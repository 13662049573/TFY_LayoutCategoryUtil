//
//  UIButton+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UIButton+TFY_Tools.h"
#import <objc/message.h>
#import <time.h>

@interface UIButton ()
/**
 *  🐶nn    👇
 */
@property(nonatomic,strong)dispatch_source_t timer;
/**
 *  🐶记录外边的时间    👇
 */
@property(nonatomic,assign)NSInteger userTime;

@end

static NSInteger const TimeInterval = 60; // 默认时间
static NSString * const ButtonTitleFormat = @"剩余%ld秒";
static NSString * const RetainTitle = @"重试";
static const void *ButtonRuntimeLimitTasks         = &ButtonRuntimeLimitTasks;
static const void *ButtonRuntimeLimitTapBlock      = &ButtonRuntimeLimitTapBlock;
static const void *ButtonRuntimeLimitTapTimes      = &ButtonRuntimeLimitTapTimes;
static const void *ButtonRuntimeLimitTapLastTimes  = &ButtonRuntimeLimitTapLastTimes;
static const void *ButtonRuntimeLimitTapSpaceTimes = &ButtonRuntimeLimitTapSpaceTimes;
static const void *ButtonRuntimeLimitIsStop        = &ButtonRuntimeLimitIsStop;

static NSString *UI_swizzleButtonMethodName = @"_UI_swizzleButtonLimitTimeMethod";

static inline void UI_swizzleButtonIfNeed(Class swizzleClass){
    @synchronized (swizzleClass) {
        if (class_getMethodImplementation(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName)) !=_objc_msgForward) return;
        class_addMethod(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName), imp_implementationWithBlock(^(id object,SEL sel){}), "v@:");
        SEL buttonTapSelector = sel_registerName("_sendActionsForEvents:withEvent:");
        __block void (* oldImp) (__unsafe_unretained id, SEL,UIControlEvents,id) = NULL;
        id newImpBlock = ^ (__unsafe_unretained UIButton* self,UIControlEvents events, id a){
            if (events & UIControlEventTouchUpInside) {
                if (objc_getAssociatedObject(self, ButtonRuntimeLimitIsStop)) return;
                id spaceTime = objc_getAssociatedObject(self, ButtonRuntimeLimitTapSpaceTimes);
                if (spaceTime) {
                   NSTimeInterval spaceTimef = [spaceTime doubleValue];
                    id lastTime = objc_getAssociatedObject(self, ButtonRuntimeLimitTapLastTimes);
                    NSTimeInterval currentTime = time(NULL);
                    if (lastTime) {
                        if (currentTime - [lastTime doubleValue] < spaceTimef) return;
                    }
                    objc_setAssociatedObject(self, ButtonRuntimeLimitTapLastTimes, @(currentTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                ButtonLimitTimesTapBlock block = objc_getAssociatedObject(self, ButtonRuntimeLimitTapBlock);
                if (block) {
                    NSUInteger tapTimes = [objc_getAssociatedObject(self, ButtonRuntimeLimitTapTimes) integerValue];
                    tapTimes ++;
                    objc_setAssociatedObject(self, ButtonRuntimeLimitTapTimes, @(tapTimes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    BOOL stop = NO;
                    block(tapTimes,&stop,self);
                    if (stop) {
                        objc_setAssociatedObject(self, ButtonRuntimeLimitIsStop, @(stop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                        return;
                    }
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL,UIControlEvents,id))objc_msgSendSuper)(&supperInfo, buttonTapSelector,events,a);
            }else{
                oldImp(self,buttonTapSelector,events,a);
            }
        };
        Method buttonTapMethod = class_getInstanceMethod(swizzleClass, buttonTapSelector);
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        if (!class_addMethod(swizzleClass, buttonTapSelector, newImp, method_getTypeEncoding(buttonTapMethod))) {
            oldImp = (__typeof__ (oldImp))method_setImplementation(buttonTapMethod, newImp);
        }
    }
}

@implementation UIButton (TFY_Tools)

- (void)imageDirection:(ButtonImageDirection)direction space:(CGFloat)space{
    CGFloat imageWidth, imageHeight, textWidth, textHeight, x, y;
    imageWidth = self.currentImage.size.width;
    imageHeight = self.currentImage.size.height;
    [self.titleLabel sizeToFit];
    textWidth = self.titleLabel.frame.size.width;
    textHeight = self.titleLabel.frame.size.height;
    space = space / 2;
    switch (direction) {
        case ButtonImageDirectionTop:{
            x = textHeight / 2 + space;
            y = textWidth / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(-x, y, x, - y);
            x = imageHeight / 2 + space;
            y = imageWidth / 2;
            self.titleEdgeInsets = UIEdgeInsetsMake(x, - y, - x, y);
        }
            break;
        case ButtonImageDirectionBottom:{
            x = textHeight / 2 + space;
            y = textWidth / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(x, y, -x, - y);
            x = imageHeight / 2 + space;
            y = imageWidth / 2;
            self.titleEdgeInsets = UIEdgeInsetsMake(-x, - y, x, y);
        }
            break;
        case ButtonImageDirectionLeft:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space,0, space);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space , 0, - space);
        }
            break;
        case ButtonImageDirectionRight:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, space + textWidth, 0, - (space + textWidth));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(space + imageWidth), 0, (space + imageWidth));
        }
            break;
        default:
            break;
    }
}

- (UIButton * _Nonnull (^)(ButtonLimitTimesTapBlock _Nonnull))buttonTapTime{
    return ^(ButtonLimitTimesTapBlock block){
        if (block != nil) {
            UI_swizzleButtonIfNeed(object_getClass(self));
        }
        objc_setAssociatedObject(self, ButtonRuntimeLimitTapBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSTimeInterval))tapSpaceTime{
    return ^(NSTimeInterval time){
        UI_swizzleButtonIfNeed(object_getClass(self));
        objc_setAssociatedObject(self, ButtonRuntimeLimitTapSpaceTimes, @(time), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (void)cancelRecordTime{
    if (!objc_getAssociatedObject(self, ButtonRuntimeLimitTapLastTimes)) return;
    objc_setAssociatedObject(self, ButtonRuntimeLimitTapLastTimes, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTime:(NSInteger)time{
    objc_setAssociatedObject(self, @selector(time), @(time), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)time {
    return  [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setFormat:(NSString *)format {
    objc_setAssociatedObject(self, @selector(format), format, OBJC_ASSOCIATION_COPY);
}

- (NSString *)format {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setUserTime:(NSInteger)userTime {
    objc_setAssociatedObject(self, @selector(userTime), @(userTime), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)userTime {
    return  [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setTimer:(dispatch_source_t)timer {
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN);
}

- (dispatch_source_t)timer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCompleteBlock:(void (^)(void))CompleteBlock {
    objc_setAssociatedObject(self, @selector(CompleteBlock), CompleteBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(void))CompleteBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)startTimer {
    if (!self.time) {
        self.time = TimeInterval;
    }
    if (!self.format) {
        self.format = ButtonTitleFormat;
    }
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.time <= 1) {
            dispatch_source_cancel(self.timer);
        }else
        {
            self.time --;
            dispatch_async(mainQueue, ^{
                self.enabled = NO;
                [self setTitle:[NSString stringWithFormat:self.format,self.time] forState:UIControlStateNormal];
            });
        }
    });
    dispatch_source_set_cancel_handler(self.timer, ^{
        dispatch_async(mainQueue, ^{
            self.enabled = YES;
            [self setTitle:RetainTitle forState:UIControlStateNormal];
            if (self.CompleteBlock) {
                self.CompleteBlock();
            }
            if (self.userTime) {
                self.time = self.userTime;
            }else
            {
                self.time = TimeInterval;
            }
        });
    });
    dispatch_resume(self.timer);
}

- (void)endTimer{
    dispatch_source_cancel(self.timer);
}

@end

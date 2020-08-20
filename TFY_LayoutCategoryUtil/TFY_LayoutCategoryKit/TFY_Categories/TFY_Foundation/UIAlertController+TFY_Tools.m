//
//  UIAlertController+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UIAlertController+TFY_Tools.h"
#import <objc/runtime.h>

static void *ktfy_ActionBlock = & ktfy_ActionBlock;
static void *ktfyCategoryActionViewController = &ktfyCategoryActionViewController;
static void *ktfyCategoryActionViewActionIndex = &ktfyCategoryActionViewActionIndex;
@interface UIAlertActionWithController : NSObject
@property (nonatomic, weak) UIAlertController * alertViewController;
@end
@implementation UIAlertActionWithController


@end

@implementation UIAlertAction (TFY_Tools)

- (void)setAlertViewController:(UIAlertActionWithController *)model{
    objc_setAssociatedObject(self, ktfyCategoryActionViewController, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAlertActionWithController *)alertViewActionWithController{
    return objc_getAssociatedObject(self, ktfyCategoryActionViewController);
}

- (UIAlertController *)tfy_alertViewController{
    return [self alertViewActionWithController].alertViewController;
}

- (void)tfy_setAlertActionTitleColor:(UIColor *)color{
    [self setValue:color forKey:@"_titleTextColor"];
}

- (void)tfy_setAlertImage:(UIImage *)image{
    [self setValue:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:@"image"];
}

- (NSInteger)tfy_actionTag{
    return [objc_getAssociatedObject(self, ktfyCategoryActionViewActionIndex) integerValue];
}

- (void)setTfy_actionTag:(NSInteger)tfy_actionTag{
    objc_setAssociatedObject(self, ktfyCategoryActionViewActionIndex, @(tfy_actionTag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIAlertController (TFY_Tools)

- (UIAlertController * _Nonnull (^)(NSString * _Nonnull, UIAlertActionStyle))tfy_addAction{
    return ^ (NSString *title, UIAlertActionStyle style){
        
        __weak typeof(self)weakSelf = self;
        [self tfy_addActionTitle:title style:style block:^(UIAlertAction * _Nonnull action) {
            if ([weakSelf tfy_actionBlock]) {
                [weakSelf tfy_actionBlock](action.tfy_actionTag, action);
            }
        }];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSInteger))tfy_actionIndex{
    return ^ (NSInteger index){
        self.actions.lastObject.tfy_actionTag = index;
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))tfy_addDesAction{
    return ^ (NSString *title){
        return self.tfy_addAction(title, UIAlertActionStyleDestructive);
    };
}
- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))tfy_addCancelAction{
    return ^ (NSString *title){
        return self.tfy_addAction(title, UIAlertActionStyleCancel);
    };
}
- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))tfy_addDefaultAction{
    return ^ (NSString *title){
        return self.tfy_addAction(title, UIAlertActionStyleDefault);
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UIAlertAction * _Nonnull)))tfy_actionStyle{
    return ^ (void (^style) (UIAlertAction *action)){
        if (style) {
            style([self tfy_currentAction]);
        }
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(tfy_AlertTapBlock _Nonnull))tfy_actionTap{
    return ^ (tfy_AlertTapBlock block){
        [self setWtc_actionBlock:block];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UITextField * _Nonnull)))tfy_addTextField{
    return ^ (void (^ textField)(UITextField * textField)){
        [self addTextFieldWithConfigurationHandler:textField];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UIAlertController * _Nonnull)))tfy_alertStyle{
    return ^ (void(^ alert) (UIAlertController * alert)){
        if (alert) {
            alert(self);
        }
        return self;
    };
}

- (UIAlertAction *)tfy_currentAction{
    return [self.actions lastObject];
}

- (tfy_AlertTapBlock)tfy_actionBlock{
    return objc_getAssociatedObject(self, ktfy_ActionBlock);
}

- (void)setWtc_actionBlock:(tfy_AlertTapBlock)block{
    objc_setAssociatedObject(self, ktfy_ActionBlock, block,OBJC_ASSOCIATION_COPY);
}


- (UIAlertController * _Nonnull (^)(NSUInteger))tfy_alertTitleMaxNum{
    return ^ (NSUInteger number){
        [self tfy_setACTitleLineMaxNumber:number];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSLineBreakMode))tfy_alertTitleLineBreakMode{
    return ^ (NSLineBreakMode mode){
        [self tfy_setACTitleLineBreakModel:mode];
        return self;
    };
}


- (UIAlertController * _Nonnull (^)(UIFont * _Nonnull, UIColor * _Nonnull))tfy_alertTitleAttributeFontWithColor{
    return ^ (UIFont *font,UIColor *color){
        return self.tfy_alertTitleAttributeWidthDictionary(^(NSMutableDictionary * _Nonnull attributes) {
            attributes[NSFontAttributeName] = font;
            attributes[NSForegroundColorAttributeName] = color;
        });
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(NSMutableDictionary * _Nonnull)))tfy_alertTitleAttributeWidthDictionary{
    return ^ (void (^attribute)(NSMutableDictionary *attribute)){
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        if (attribute) {
            attribute(dic);
        }
        if (self.message.length > 0) {
            [self tfy_setACTitleAttributedString:[[NSAttributedString alloc]initWithString:self.title attributes:dic]];
        }else{
            [self tfy_setACTitleAttributedString:nil];
        }
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(UIFont * _Nonnull, UIColor * _Nonnull))tfy_alertMessageAttributeFontWithColor{
    return ^ (UIFont *font,UIColor *color){
        return self.tfy_alertMessageAttributeWidthDictionary(^(NSMutableDictionary * _Nonnull attributes) {
            attributes[NSFontAttributeName] = font;
            attributes[NSForegroundColorAttributeName] = color;
        });
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(NSMutableDictionary * _Nonnull)))tfy_alertMessageAttributeWidthDictionary{
    return ^ (void (^attribute)(NSMutableDictionary *attribute)){
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        if (attribute) {
            attribute(dic);
        }
        if (self.message.length > 0) {
            [self tfy_setACMessageAttributedString:[[NSAttributedString alloc]initWithString:self.message attributes:dic]];
        }else{
            [self tfy_setACMessageAttributedString:nil];
        }
        return self;
    };
}
- (void)tfy_setACTitleAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"attributedTitle"];
}

- (void)tfy_setACDetailAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"_attributedDetailMessage"];
}

- (void)tfy_setACMessageAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"attributedMessage"];
}

- (void)tfy_setACTitleLineMaxNumber:(NSInteger)number{
    [self setValue:@(number) forKey:@"titleMaximumLineCount"];
}

- (void)tfy_setACTitleLineBreakModel:(NSLineBreakMode)mode{
    [self setValue:@(mode) forKey:@"titleLineBreakMode"];
}

- (UIAlertAction *)tfy_addActionTitle:(NSString *)title style:(UIAlertActionStyle)style block:(void (^)(UIAlertAction * _Nonnull))block{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:block];
    [self addAction:action];
    UIAlertActionWithController *model = [UIAlertActionWithController new];
    model.alertViewController = self;
    [action setAlertViewController:model];
    return action;
}


@end

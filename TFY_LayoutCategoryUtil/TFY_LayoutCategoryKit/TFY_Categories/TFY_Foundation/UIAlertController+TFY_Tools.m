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

- (UIAlertController *)alertViewController{
    return [self alertViewActionWithController].alertViewController;
}

- (void)setAlertActionTitleColor:(UIColor *)color{
    [self setValue:color forKey:@"_titleTextColor"];
}

- (void)setAlertImage:(UIImage *)image{
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

- (UIAlertController * _Nonnull (^)(NSString * _Nonnull, UIAlertActionStyle))addAction{
    return ^ (NSString *title, UIAlertActionStyle style){
        
        __weak typeof(self)weakSelf = self;
        [self addActionTitle:title style:style block:^(UIAlertAction * _Nonnull action) {
            if ([weakSelf tfy_actionBlock]) {
                [weakSelf tfy_actionBlock](action.tfy_actionTag, action);
            }
        }];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSInteger))actionIndex{
    return ^ (NSInteger index){
        self.actions.lastObject.tfy_actionTag = index;
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))addDesAction{
    return ^ (NSString *title){
        return self.addAction(title, UIAlertActionStyleDestructive);
    };
}
- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))addCancelAction{
    return ^ (NSString *title){
        return self.addAction(title, UIAlertActionStyleCancel);
    };
}
- (UIAlertController * _Nonnull (^)(NSString * _Nonnull))addDefaultAction{
    return ^ (NSString *title){
        return self.addAction(title, UIAlertActionStyleDefault);
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UIAlertAction * _Nonnull)))actionStyle{
    return ^ (void (^style) (UIAlertAction *action)){
        if (style) {
            style([self tfy_currentAction]);
        }
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(tfy_AlertTapBlock _Nonnull))actionTap{
    return ^ (tfy_AlertTapBlock block){
        [self setWtc_actionBlock:block];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UITextField * _Nonnull)))addTextField{
    return ^ (void (^ textField)(UITextField * textField)){
        [self addTextFieldWithConfigurationHandler:textField];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(UIAlertController * _Nonnull)))alertStyle{
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


- (UIAlertController * _Nonnull (^)(NSUInteger))alertTitleMaxNum{
    return ^ (NSUInteger number){
        [self setACTitleLineMaxNumber:number];
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(NSLineBreakMode))alertTitleLineBreakMode{
    return ^ (NSLineBreakMode mode){
        [self setACTitleLineBreakModel:mode];
        return self;
    };
}


- (UIAlertController * _Nonnull (^)(UIFont * _Nonnull, UIColor * _Nonnull))alertTitleAttributeFontWithColor{
    return ^ (UIFont *font,UIColor *color){
        return self.alertTitleAttributeWidthDictionary(^(NSMutableDictionary * _Nonnull attributes) {
            attributes[NSFontAttributeName] = font;
            attributes[NSForegroundColorAttributeName] = color;
        });
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(NSMutableDictionary * _Nonnull)))alertTitleAttributeWidthDictionary{
    return ^ (void (^attribute)(NSMutableDictionary *attribute)){
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        if (attribute) {
            attribute(dic);
        }
        if (self.message.length > 0) {
            [self setACTitleAttributedString:[[NSAttributedString alloc]initWithString:self.title attributes:dic]];
        }else{
            [self setACTitleAttributedString:nil];
        }
        return self;
    };
}

- (UIAlertController * _Nonnull (^)(UIFont * _Nonnull, UIColor * _Nonnull))alertMessageAttributeFontWithColor{
    return ^ (UIFont *font,UIColor *color){
        return self.alertMessageAttributeWidthDictionary(^(NSMutableDictionary * _Nonnull attributes) {
            attributes[NSFontAttributeName] = font;
            attributes[NSForegroundColorAttributeName] = color;
        });
    };
}

- (UIAlertController * _Nonnull (^)(void (^ _Nonnull)(NSMutableDictionary * _Nonnull)))alertMessageAttributeWidthDictionary{
    return ^ (void (^attribute)(NSMutableDictionary *attribute)){
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        if (attribute) {
            attribute(dic);
        }
        if (self.message.length > 0) {
            [self setACMessageAttributedString:[[NSAttributedString alloc]initWithString:self.message attributes:dic]];
        }else{
            [self setACMessageAttributedString:nil];
        }
        return self;
    };
}
- (void)setACTitleAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"attributedTitle"];
}

- (void)setACDetailAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"_attributedDetailMessage"];
}

- (void)setACMessageAttributedString:(NSAttributedString *)attributedString{
    [self setValue:attributedString forKey:@"attributedMessage"];
}

- (void)setACTitleLineMaxNumber:(NSInteger)number{
    [self setValue:@(number) forKey:@"titleMaximumLineCount"];
}

- (void)setACTitleLineBreakModel:(NSLineBreakMode)mode{
    [self setValue:@(mode) forKey:@"titleLineBreakMode"];
}

- (UIAlertAction *)addActionTitle:(NSString *)title style:(UIAlertActionStyle)style block:(void (^)(UIAlertAction * _Nonnull))block{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:block];
    [self addAction:action];
    UIAlertActionWithController *model = [UIAlertActionWithController new];
    model.alertViewController = self;
    [action setAlertViewController:model];
    return action;
}


@end

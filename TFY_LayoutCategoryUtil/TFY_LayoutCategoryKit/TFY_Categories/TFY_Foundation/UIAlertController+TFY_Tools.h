//
//  UIAlertController+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 快速创建
 */
CG_INLINE UIAlertController *TFY_AlertControllerCreate(NSString *_Nullable title, NSString *_Nullable message, UIAlertControllerStyle style){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
}
CG_INLINE UIAlertController *TFY_AlertControllerAlertCreate(NSString *_Nullable title,NSString *_Nullable message){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}
CG_INLINE UIAlertController *TFY_AlertControllerSheetCreate(NSString *_Nullable title, NSString *_Nullable message){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
}

typedef void (^ tfy_AlertTapBlock)(NSInteger index, UIAlertAction *action);


@interface UIAlertController (TFY_Tools)
/**
 * 添加Action，并设置key值，需要在点击方法中使用
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_addAction)(NSString *, UIAlertActionStyle);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_addDesAction)(NSString *);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_addCancelAction)(NSString *);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_addDefaultAction)(NSString *);

@property (nonatomic, copy, readonly) UIAlertController * (^tfy_actionIndex)(NSInteger);

@property (nonatomic, copy, readonly) UIAlertController * (^tfy_addTextField) (void (^textField) (UITextField *textField));
/**
 * 在点语法中用来返回一个最近添加的UIAlertAction，用来设置样式
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_actionStyle) (void (^ actionStyle)(UIAlertAction * action));
/**
 * action点击方法，返回的key值是上面添加的key值
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_actionTap) (tfy_AlertTapBlock);
/**
 * 在点语法中用来返回当前的UIAlertVController，用来设置样式
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertStyle) (void (^ alert)(UIAlertController *alertVC));
/**
 * title样式设置
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertTitleAttributeFontWithColor)(UIFont *, UIColor *);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertTitleAttributeWidthDictionary)(void (^attribute)(NSMutableDictionary * attributes));
/**
 * message样式设置
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertMessageAttributeFontWithColor)(UIFont *, UIColor *);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertMessageAttributeWidthDictionary)(void (^attribute)(NSMutableDictionary * attributes));
/**
 * title属性
 */
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertTitleMaxNum)(NSUInteger);
@property (nonatomic, copy, readonly) UIAlertController * (^tfy_alertTitleLineBreakMode)(NSLineBreakMode);
/**
 * 设置title字体颜色
 */
- (void)tfy_setACTitleAttributedString:(nullable NSAttributedString *)attributedString;
/**
 * 设置message字体颜色
 */
- (void)tfy_setACMessageAttributedString:(nullable NSAttributedString *)attributedString;
/**
 * 设置介绍字体颜色
 */
- (void)tfy_setACDetailAttributedString:(nullable NSAttributedString *)attributedString;
/**
 * 设置title最大行数
 */
- (void)tfy_setACTitleLineMaxNumber:(NSInteger)number;
/**
 * 设置title截断模式
 */
- (void)tfy_setACTitleLineBreakModel:(NSLineBreakMode)mode;
/**
 * 添加action
 */
- (UIAlertAction *)tfy_addActionTitle:(NSString *)title style:(UIAlertActionStyle)style block:(void (^) (UIAlertAction *action))block;
@end

@interface UIAlertAction (TFY_Tools)

@property (nonatomic, weak, readonly) UIAlertController * tfy_alertViewController;

@property (nonatomic, assign) NSInteger tfy_actionTag;
/**
 * 设置action颜色
 */
- (void)tfy_setAlertActionTitleColor:(UIColor *)color;
/**
 * 设置action图片
 */
- (void)tfy_setAlertImage:(UIImage *)image;


@end

NS_ASSUME_NONNULL_END

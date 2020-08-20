//
//  UITextField+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (TFY_Tools)

- (void)tfy_addLeftViewBlock:(UIView * (^) (UITextField *))leftBlock mode:(UITextFieldViewMode)mode;

- (void)tfy_addRightViewBlock:(UIView * (^) (UITextField *))rightBlock mode:(UITextFieldViewMode)mode;

- (NSRange)tfy_selectedRange;

- (void)tfy_selectedText;

- (void)tfy_setSelectedRange:(NSRange)range;

/**
 已输入字符串
 */
@property (nonatomic, copy) void (^tfy_editedText) (NSString *text);
/**
 需要结合delegate中的方法
 */
@property (nonatomic, assign) NSUInteger limitLength;
@end

NS_ASSUME_NONNULL_END

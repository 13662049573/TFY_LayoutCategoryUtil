//
//  UITextView+Placeholder.h
//  shore
//
//  Created by 田风有 on 2023/4/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Placeholder)

/* 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/* 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end

NS_ASSUME_NONNULL_END

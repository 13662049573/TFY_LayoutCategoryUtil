//
//  CommonNavigationBar.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2020/9/2.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommonNavigationBarDelegate <NSObject>

@optional
/**
 左按钮点击事件
 */
- (void)leftButtonTap:(UIButton *)button;

/**
 中间按钮点击事件
 */
- (void)middleButtonTap:(UIButton *)button;

/**
 右按钮点击事件
 */
- (void)rightButtonTap:(UIButton *)button;

/**
 导航栏点击事件
 */
- (void)navigationClick:(UIView *)view;

/**
 导航点击事件是否可以向下传递
 */
- (BOOL)navigationEventsShoulass;

/**
 设置button的类，如果为UIButton传@[@"",@"",@""]，或不传
 */
- (NSArray *)buttonClasses;

@end

@class CommonNavigationBar;

typedef void(^nav_Block)(CommonNavigationBar *bar);

@interface CommonNavigationBar : UIView

TFY_PROPERTY_OBJECT_WEAK(id <CommonNavigationBarDelegate>, delegate);

TFY_PROPERTY_STRONG_READONLY UIView * leftView;

TFY_PROPERTY_STRONG_READONLY UIView * rightView;

TFY_PROPERTY_ASSIGN_READONLY NSInteger  currentTag;

TFY_PROPERTY_OBJECT_STRONG(UIButton, leftButton);

TFY_PROPERTY_OBJECT_STRONG(UIButton, rightButton);

TFY_PROPERTY_OBJECT_STRONG(UIButton, middleButton);

TFY_PROPERTY_OBJECT_STRONG(UIView, line);

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block;

- (void)setTag:(NSInteger)tag;

- (void)resetLayout:(UIEdgeInsets)edge;
@end

NS_ASSUME_NONNULL_END

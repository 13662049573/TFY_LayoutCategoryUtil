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
- (BOOL)navigationEventsShoulSSDKass;

/**
 设置button的类，如果为UIButton传@[@"",@"",@""]，或不传
 */
- (NSArray *)buttonClasses;

@end

@class CommonNavigationBar;

typedef void(^nav_Block)(CommonNavigationBar *bar);

@interface CommonNavigationBar : UIView

@property (nonatomic, weak) id <CommonNavigationBarDelegate> delegate;

@property (nonatomic, strong, readonly) UIView * leftView;

@property (nonatomic, strong, readonly) UIView * rightView;

@property (nonatomic, strong) UIButton * leftButton;

@property (nonatomic, strong) UIButton * rightButton;

@property (nonatomic, strong) UIButton * middleButton;

@property (nonatomic, strong) UIView * line;

@property (nonatomic, assign, readonly) NSInteger  currentTag;

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block;

- (void)setTag:(NSInteger)tag;

- (void)resetLayout:(UIEdgeInsets)edge;
@end

NS_ASSUME_NONNULL_END

//
//  UIButton+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+TFY_Tools.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ButtonImageDirection) {
    ButtonImageDirectionTop,
    ButtonImageDirectionLeft,
    ButtonImageDirectionRight,
    ButtonImageDirectionBottom,
};

typedef void(^ButtonLimitTimesTapBlock)(NSUInteger time, BOOL *stop, UIButton *button);

@interface UIButton (TFY_Tools)

- (void)imageDirection:(ButtonImageDirection)direction space:(CGFloat)space;

#pragma mark - 限制点击次数 -
/**
 * 点击次数
 */
@property (nonatomic, copy, readonly) UIButton * (^ buttonTapTime) (ButtonLimitTimesTapBlock block);

/**
 * 时间间隔
 */
@property (nonatomic, copy, readonly) UIButton* (^ tapSpaceTime) (NSTimeInterval spaceTime);

/**
 * 清除限制
 */
- (void)cancelRecordTime;

/**
 *  🐶计时时间    👇
 */
@property(nonatomic,assign,readwrite)NSInteger time;
/**
 *  🐶format   👇
 */
@property(nonatomic,copy)NSString *format;
/**
 * 开启计时器
 */
- (void)startTimer;
/**
 * 干掉计时器
 */
- (void)endTimer;
/**
 * 倒计时完成后的回调
 */
@property(nonatomic,copy)void(^CompleteBlock)(void);
@end

NS_ASSUME_NONNULL_END

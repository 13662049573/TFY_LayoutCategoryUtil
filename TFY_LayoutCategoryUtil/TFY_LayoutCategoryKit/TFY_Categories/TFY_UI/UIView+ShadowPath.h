//
//  UIView+ShadowPath.h
//  ShadowPath
//
//  Created by 田风有 on 2021/9/12.
//

#import <UIKit/UIKit.h>

typedef UIView *_Nonnull(^ConrnerCorner) (UIRectCorner  corner );
typedef UIView *_Nonnull (^ConrnerRadius) (CGFloat       radius );

typedef UIView *_Nonnull (^BorderColor  ) (UIColor      * _Nonnull color);
typedef UIView *_Nonnull (^BorderWidth  ) (CGFloat       width  );

typedef UIView *_Nonnull (^ShadowColor  ) (UIColor      *_Nonnull color);
typedef UIView *_Nonnull (^ShadowOffset ) (CGSize        size   );
typedef UIView *_Nonnull (^ShadowRadius ) (CGFloat       radius );
typedef UIView *_Nonnull (^ShadowOpacity) (CGFloat       opacity);

typedef UIView *_Nonnull (^BezierPath) (UIBezierPath    *_Nonnull path);
typedef UIView *_Nonnull (^ViewBounds) (CGRect           rect);

typedef UIView *_Nonnull (^ShowVisual) (void);
typedef UIView *_Nonnull (^ClerVisual) (void);

typedef NS_OPTIONS(NSUInteger, TFYShadowSide) {
    TFYShadowSideNone   = 0,
    TFYShadowSideTop    = 1 << 0,
    TFYShadowSideLeft   = 1 << 1,
    TFYShadowSideBottom = 1 << 2,
    TFYShadowSideRight  = 1 << 3,
    TFYShadowSideAll    = TFYShadowSideTop | TFYShadowSideLeft | TFYShadowSideBottom | TFYShadowSideRight
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ShadowPath)

// 圆角
@property(nonatomic, strong, readonly)ConrnerCorner conrnerCorner;  // UIRectCorner 默认 UIRectCornerAllCorners
@property(nonatomic, strong, readonly)ConrnerRadius conrnerRadius;  // 圆角半径 默认 0.0

// 边框
@property(nonatomic, strong, readonly)BorderColor   borderColor;    // 边框颜色 默认 black
@property(nonatomic, strong, readonly)BorderWidth   borderWidth;    // 边框宽度 默认 0.0

// 阴影
@property(nonatomic, strong, readonly)ShadowColor   shadowColor;    // 阴影颜色 默认 black
@property(nonatomic, strong, readonly)ShadowOffset  shadowOffset;   // 阴影偏移方向和距离 默认 {0.0，0.0}
@property(nonatomic, strong, readonly)ShadowRadius  shadowRadius;   // 阴影模糊度 默认 0.0
@property(nonatomic, strong, readonly)ShadowOpacity shadowOpacity;  // (0~1] 默认 0.0

// 路径
@property(nonatomic, strong, readonly)BezierPath bezierPath; // 贝塞尔路径 默认 nil (有值时，radius属性将失效)
@property(nonatomic, strong, readonly)ViewBounds viewBounds; // 设置圆角时，会去获取视图的bounds属性，如果此时获取不到，则需要传入该参数，默认为 nil，如果传入该参数，则不会去回去视图的bounds属性了

// 调用
@property(nonatomic, strong, readonly)ShowVisual showVisual; // 展示
@property(nonatomic, strong, readonly)ClerVisual clerVisual; // 隐藏

/// 使用位枚举指定圆角位置
/// 通过在各个边画矩形来实现shadowpath，真正实现指那儿打那儿
/// shadowColor 阴影颜色
/// shadowOpacity 阴影透明度
/// shadowRadius 阴影半径
/// shadowSide 阴影位置
-(void)addShdowColor:(UIColor *)shadowColor
       shadowOpacity:(CGFloat)shadowOpacity
        shadowRadius:(CGFloat)shadowRadius
          shadowSide:(TFYShadowSide)shadowSide;

@end

NS_ASSUME_NONNULL_END

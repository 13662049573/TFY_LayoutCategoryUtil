//
//  UIColor+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TFY_Tools)

+ (UIColor *)tfy_colorWithHexString:(NSString *)hexString;

+ (UIColor *)tfy_colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

+ (UIColor *)tfy_randomColor;

+ (UIColor *)tfy_percentR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

+ (UIColor *)tfy_r:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

- (NSString *)tfy_hexString;

- (NSString *)tfy_hexStringWithAplha;

- (UIColor *)tfy_addColor:(UIColor *)acolor blendMode:(CGBlendMode)blendModel;

@property (nonatomic, assign, readonly) CGFloat  tfy_red;

@property (nonatomic, assign, readonly) CGFloat  tfy_green;

@property (nonatomic, assign, readonly) CGFloat  tfy_blue;

@property (nonatomic, assign, readonly) CGFloat  tfy_alpha;

@property (nonatomic, assign, readonly) CGFloat  tfy_hue;

@property (nonatomic, assign, readonly) CGFloat  tfy_saturation;

@property (nonatomic, assign, readonly) CGFloat  tfy_brightness;

@property (nonatomic, readonly) CGColorSpaceModel tfy_colorSpaceModel;

@property (nonatomic, readonly) NSString *tfy_colorSpaceString;

/**
 反色调
 */
- (UIColor *)tfy_antiColor;

@end

static inline UIColor *UIColorHexString(NSString *hexString){
    return [UIColor tfy_colorWithHexString:hexString];
}

static inline UIColor *UIColorHexAlpha(NSString *hexString, CGFloat alpha){
    return [UIColor tfy_colorWithHexString:hexString alpha:alpha];
}
/** RGBA颜色，传整数 */
static inline UIColor *UIColorRGBAlpha(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor tfy_percentR:r g:g b:b alpha:alpha];
}

/** RGB颜色，传整数  */
static inline UIColor *UIColorRGB(CGFloat r, CGFloat g, CGFloat b){
    return UIColorRGBAlpha(r,g,b,1);
}
/** RGBA颜色传分数 */
static inline UIColor *UIColorRGBAlphaPercent(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor tfy_r:r g:g b:b alpha:alpha];
}

/** RGB颜色传分数 */
static inline UIColor *UIColorRGBPercent(CGFloat r, CGFloat g, CGFloat b){
    return UIColorRGBAlphaPercent(r,g,b,1);
}


#define RGBAlphaPercent(r,g,b,a) UIColorRGBAlphaPercent(r,g,b,a)

#define RGBPercent(r,g,b) UIColorRGBPercent(r,g,b)

#define RGBAlpha(r,g,b,a) UIColorRGBAlpha(r,g,b,a)

#define RGB(r,g,b) UIColorRGB(r,g,b)

NS_ASSUME_NONNULL_END


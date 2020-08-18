//
//  UIFont+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define Font(type,fontSize) [UIFont fontType:type size:fontSize]

#define Font_Scale(type,fontSize) [UIFont fontScaleType:type size:fontSize]

typedef NS_ENUM(NSInteger, fontType) {
    SystemFont = 0,
    PingFangLight,
    PingFangReguler,
    PingFangMedium,
    PingFangSemibold,
    STHeitiSCLight,
    STHeitiSCMedium,
    DinaAlternateBold
};

@interface UIFont (TFY_Tools)
+ (UIFont *)tfy_fontScaleWithName:(NSString *)fontName fontSize:(CGFloat)fontSize;

+ (UIFont *)tfy_fontWithName:(NSString *)fontName fontSize:(CGFloat)fontSize;

+ (UIFont *)fontType:(fontType)type size:(CGFloat)size;

+ (UIFont *)fontScaleType:(fontType)type size:(CGFloat)size;

+ (UIFont *)PingFangSCLightAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCRegularAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCMediumAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCScaleMediumAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCSemiboldAndSize:(CGFloat)size;

+ (UIFont *)DINAlternateBoldAndSize:(CGFloat)size;

+ (UIFont *)STHeitiSCLightAndSize:(CGFloat)size;

+ (UIFont *)STHeitiSCMedium:(CGFloat)size;

+ (UIFont *)LatoBoldAndSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END

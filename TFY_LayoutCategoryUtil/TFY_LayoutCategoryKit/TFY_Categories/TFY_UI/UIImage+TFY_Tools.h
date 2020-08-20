//
//  UIImage+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TFY_GradientType) {
    
    TFY_GradientTypeTopToBottom      = 0,//从上到小
    TFY_GradientTypeLeftToRight      = 1,//从左到右
    TFY_GradientTypeUpleftToLowright = 2,//左上到右下
    TFY_GradientTypeUprightToLowleft = 3,//右上到左下
};

NS_ASSUME_NONNULL_BEGIN

CG_INLINE CGFloat TFY_RadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}

CG_INLINE CGFloat TFY_DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

@interface UIImage (TFY_Tools)
+ (nullable UIImage *)imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 根据颜色创建一个size大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 根据当前上下文画一个图片
 */
+ (UIImage *)imageSize:(CGSize)size withDrawContext:(void (^) (CGContextRef contextRef))drawContext;

/**
 是否有不透明
 */
- (BOOL)hasAlphaChannel;

/**
 动画图片
 */
+ (UIImage *)animatedGifName:(NSString *)name;

+ (UIImage *)animatedGifName:(NSString *)name scale:(CGFloat)scale;
/**
 修正图片
 */
- (UIImage *)imageByFixOrientation;

/**
根据当前视图和Model创建一个图片
 */
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentModel clipsToBounds:(BOOL)clips;


/**
 重新设置大小
 */
- (UIImage *)imageByResizeToSize:(CGSize)size;

/**
 等比例放大缩小
 */
- (UIImage *)imageByResizeToScale:(CGFloat)scale;

- (UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/**
 裁剪
 */
- (UIImage *)imageByCropToRect:(CGRect)rect;

/**
 创建一个带边框的image
 */
- (UIImage *)imageByInsetEdge:(UIEdgeInsets)insets withColor:(UIColor *)color;


/**
 创建一个带圆角的image
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 旋转
 */
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;
- (nullable UIImage *)imageByRotateLeft90;
- (nullable UIImage *)imageByRotateRight90;
- (nullable UIImage *)imageByRotate180;
- (nullable UIImage *)imageByFlipVertical;
- (nullable UIImage *)imageByFlipHorizontal;

/**
 高斯模糊
 */
- (nullable UIImage *)imageByTintColor:(UIColor *)color;

- (nullable UIImage *)imageByGrayscale;

- (nullable UIImage *)imageByBlurSoft;


/**
 iOS设备
 */
- (nullable UIImage *)imageByBlurLight;

/**
 类似navgationBar

 */
- (nullable UIImage *)imageByBlurExtraLight;

/**
 类似通知中心
 */
- (nullable UIImage *)imageByBlurDark;
- (nullable UIImage *)imageByBlurWithTint:(UIColor *)tintColor;
- (nullable UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                              tintColor:(nullable UIColor *)tintColor
                               tintMode:(CGBlendMode)tintBlendMode
                             saturation:(CGFloat)saturation
                              maskImage:(nullable UIImage *)maskImage;

/**
 *  获取图片宽
 */
- (CGFloat)width;

/**
 *  获取图片高
 */
- (CGFloat)height;

/**
 *  获取启动页图片 启动页图片
 */
+ (UIImage *)launchImage;

/**
 *  加载非.Bound文件下图片，单张、或2x、3x均适用(若加载非png图片需要拼接后缀名) image 图片名
 */
+ (UIImage *)loadImage:(NSString *)image;

/**
 *  加载.Bound文件下图片(无子文件夹，若加载非png图片需要拼接后缀名) image 图片名
 */
+ (UIImage *)bundleImage:(NSString *)image Resource:(NSString *)name;

/**
 *  加载.Bound文件下子文件夹图片(若加载非png图片需要拼接后缀名) fileName 图片文件夹名  fileImage 图片名
 */
+ (UIImage *)fileImage:(NSString *)fileImage fileName:(NSString *)fileName Resource:(NSString *)name;

/**
 *  字符串转图片
 */
+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr;

/**
 * 图片转字符串
 */
+ (NSString *)imageToBase64Str:(UIImage *)image;

/**
 * 图片上绘制文字
 */
- (UIImage *)imageAddTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

/**
 *  图片切割  image  要切割的图片 imageSize 要切割的图片的大小 切割好的图片
 */
+ (UIImage *)cutImage:(UIImage*)image andSize:(CGSize)imageSize;

/**
 *  根据url返回一个圆形的头像 iconUrl 头像的URL border  边框的宽度 color   边框的颜色  切割好的头像
 */
+ (UIImage *)captureCircleImageWithURL:(NSString *)iconUrl andBorderWith:(CGFloat)border andBorderColor:(UIColor *)color;

/**
 *  根据iamge返回一个圆形的头像 iconImage 要切割的头像 border    边框的宽度 color     边框的颜色  切割好的头像
 */
+ (UIImage *)captureCircleImageWithImage:(UIImage *)iconImage andBorderWith:(CGFloat)border andBorderColor:(UIColor *)color;

/**
 *  生成毛玻璃效果的图片 image      要模糊化的图片  blurAmount 模糊化指数 返回模糊化之后的图片
 */
+ (UIImage *)blurredImageWithImage:(UIImage *)image andBlurAmount:(CGFloat)blurAmount;

/**
 *  生成一个毛玻璃效果的图片  返回模糊化好的图片
 */
- (UIImage *)blurredImage:(CGFloat)blurAmount;

/**
 *  生成一个毛玻璃效果的图片 blurLevel 毛玻璃的模糊程度 毛玻璃好的图片
 */
- (UIImage *)blearImageWithBlurLevel:(CGFloat)blurLevel;

/**
 *  截取相应的view生成一张图片 view 要截的view  生成的图片
 */
+ (UIImage *)viewShotWithView:(UIView *)view;

/**
 *  截屏 返回截屏的图片
 */
- (UIImage *)screenShot;

/**
 *  图片进行压缩 image   要压缩的图片  percent 要压缩的比例(建议在0.3以上)  压缩之后的图片 压缩之后为image/jpeg 格式
 */
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent;

/**
 *  对图片进行压缩  image   要压缩的图片 newSize 压缩后的图片的像素尺寸  压缩好的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 *  对图片进行压缩 image   要压缩的图片 kb 压缩后的图片的内存大小  压缩好的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToKB:(NSInteger)kb;

/**
 *  对图片进行压缩 image   要压缩的图片 maxLength 压缩后的图片的内存大小  压缩好的图片
 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSInteger)maxLength;

/**
 *  根据视频url获取第一帧图片
 */
+ (UIImage *)videoPreViewImage:(NSURL *)path;

/**
 * 根据给定的颜色生成图片
 */
+ (UIImage *)createImage:(UIColor *)imageColor;

/**
 * 通过渐变色生成图片 colors 渐变颜色数组  gradientType 渐变类型 imageSize 需要的图片尺寸
 */
+ (UIImage *)imageFromGradientColors:(NSArray *)colors gradientType:(TFY_GradientType)gradientType imageSize:(CGSize)imageSize;

/**
 * 对比两张图片是否相同 image 原图  anotherImage 需要比较的图片
 */
+ (BOOL)imageEqualToImage:(UIImage*)image anotherImage:(UIImage *)anotherImage;

/**
 *  图片透明度 alpha 透明度 image 原图
 */
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image;

/**
 * 镶嵌图片 firstImage 图片1 secondImage 图片2  拼接后的图片
 */
+ (UIImage *)spliceFirstImage:(UIImage *)firstImage secondImage:(UIImage *)secondImage;

/**
 * 生成二维码图片  一个二维码图片，水印在二维码中央 waterImage 水印图片 size 二维码Size  dataDic 二维码中的信息--或-字符串
 */
+ (UIImage *)qrCodeImageForDataDic:(id)dataDic size:(CGSize)size waterImage:(UIImage *)waterImage;

/**生成二维码*/
+ (UIImage *)generateQRCodeWithString:(NSString *)string Size:(CGFloat)size;
/**
 *  修改二维码颜色  修改颜色后的二维码图片
 */
+ (UIImage *)changeColorWithQRCodeImage:(UIImage *)image red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;
/**
 * 改变图片颜色
 */
- (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  图片的拉伸显示
 */
+(UIImage *)stretchImageWith:(NSString *)imageString;
 /**
  *  编码生产图片
  */
+(UIImage *)stringToUIImage:(NSString *)string;
/**
 *  将数组图片加入 随机生成一个图片
 */
+(UIImage *)RandomButtonImage:(NSArray *)changeArray Integer:(NSInteger )index;
/**
 *  更改图片显示大小
 */
+(UIImage *)imageByScalingToSize:(CGSize)targetSize andSourceImage:(UIImage *)sourceImage;
/**
 * slaveheaderImage  上边视图的图片，生成的图片的宽度为headerImageView的宽度
 * mastermidImage  中间视图的图片，生成的图片的宽度为midView的宽度，拼接在headerImageView的下面
 * masterfootImage  下边视图的图片，生成的图片的宽度为footerImageView的宽度，拼接在midView的下面
 */
+ (UIImage *)addSlaveHeaderImage:(UIImage *)slaveheaderImage toMasterMidImage:(UIImage *)mastermidImage toMasterFootImage:(UIImage *)masterfootImage;
/**
 * slaveheaderImage 头部图片
 * leftImage 左侧图片
 * masterImage 主图片
 * rightImage 右侧图片
 * masterfootImage 底部图片
 */
+ (UIImage *)combineWithHeaderImage:(UIImage *)slaveheaderImage LeftImg:(UIImage*)leftImage toMasterImage:(UIImage *)masterImage rightImg:(UIImage*)rightImage FootImage:(UIImage *)masterfootImage;
/**
 *  leftImage:左侧图片 rightImage:右侧图片 margin:两者间隔
 */
- (UIImage *)combineWithLeftImg:(UIImage*)leftImage rightImg:(UIImage*)rightImage withMargin:(NSInteger)margin;
/**
 * *masterImage  主图片，生成的图片的宽度为masterImage的宽度
 * slaveImage   从图片，拼接在masterImage的下面
 */
+ (UIImage *)addSlaveImage:(UIImage *)slaveImage toMasterImage:(UIImage *)masterImage;
/**
 *  拼接快照 imagesArr 快照的数组
 */
+ (UIImage *)getImageFromImagesArray:(NSArray *)imagesArr;
/**
 * 切割合适的图片
 */
+ (UIImage*)cutOutImageWithRect:(CGPoint)point image:(UIImage *)image;
@end

CG_INLINE UIImage *UIImageNamed(NSString *imageName){
    if (![imageName isKindOfClass:[NSString class]] || imageName.length == 0) return nil;
    return [UIImage imageNamed:imageName];
}

NS_ASSUME_NONNULL_END

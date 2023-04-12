//
//  TFY_SnapshotAuxiliaryCache.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "TFY_SnapshotAuxiliaryCache.h"
#import <CommonCrypto/CommonDigest.h>
                                                            
#define KTFYDocumentPath ([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject])
// 保存文件的路径
#define kTFYPDFDownloadPath (@"/TFYPDFCache")

static NSString * const kSnapshotAuxiliaryDirectoryNameKey = @"TFYSnapshot";

@implementation TFY_SnapshotAuxiliaryCache

+ (NSString *)cacheFileWith:(NSString *)modulePath index:(NSInteger )index{
    NSString *cacheDirectory = [TFY_SnapshotAuxiliaryCache getCacheDirWith:modulePath isCreate:YES];
    
    return [cacheDirectory stringByAppendingFormat:@"/%@_%@",modulePath,@(index)];
}


+ (void )clearCacheWith:(NSString *)modulePath{
    // 避免没有删除缓存文件，把目录下的都删除
    NSString *imageDir = [TFY_SnapshotAuxiliaryCache getCacheDirWith:modulePath isCreate:NO];
    if ([imageDir isEqualToString:@""] || !imageDir ){
        [[NSFileManager defaultManager] removeItemAtPath:imageDir error:nil];
    }
}

+ (NSString *)getCacheDirWith:(NSString *)modulePath isCreate:(BOOL )isCreate{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    
    if (modulePath){
        dir = [NSString stringWithFormat:@"%@%@/%@",dir,kSnapshotAuxiliaryDirectoryNameKey,modulePath];
    }else{
        dir = [NSString stringWithFormat:@"%@%@",dir,kSnapshotAuxiliaryDirectoryNameKey];
    }
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = YES;
    if (![fm fileExistsAtPath:dir isDirectory:&isDir]) {
        if (!isCreate){
            return @"";
        }
        [fm createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:NULL];
        return dir;
    } else {
        // 存在
        return dir;
    }
}

+ (UIImage *)spellImageOf:(CGSize )imageSize paths:(NSArray <NSString *> *)paths{
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0.0);
    
    CGFloat drawHeight = 0;
    for (NSInteger index = 0 ;index < paths.count; index++){
        @autoreleasepool {
            NSString *imageName = paths[index];
        
            NSData *imageData = [NSData dataWithContentsOfFile:imageName];
            UIImage *image = [[UIImage alloc] initWithData:imageData];
            
             if( image == nil ) {
                 imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageName]];
                 image = [[UIImage alloc] initWithData:imageData];
                 
                 if (!image){
                     NSLog(@"error:input image not found!");
                     break;
                 }
             };
            
            CGFloat imageHeight = image.size.height / [UIScreen mainScreen].scale;
            //Draw masterImage
            [image drawInRect:CGRectMake(0, drawHeight, imageSize.width, imageHeight)];
            drawHeight += imageHeight;
            
            image = nil;
            imageData = nil;
        }
    }
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return resultImage;
}

+ (void )getPDFDataWith:(NSString *)fileUrl finishBlock:(void(^)(UIImage *image))finishBlock{
    NSString *pDFDownloadPath = [KTFYDocumentPath stringByAppendingFormat:@"%@",kTFYPDFDownloadPath];
    
    //文件名
    NSString *fileName = [self MD5ForLower32Bate:fileUrl];
    //文件扩展名
    NSString *fileExtension = [fileUrl pathExtension];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.%@",pDFDownloadPath,fileName,fileExtension];
    
    BOOL isDir;
    // 如果不存在对应目录，直接创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir]) {
        [self creatFolderInCacheWithPath:kTFYPDFDownloadPath];
    }
    
    NSData *data;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [self getPdfImageWithUrl:[NSURL fileURLWithPath:filePath] finishBlock:finishBlock];
        return;
    }
    
    data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileUrl]];
    
    BOOL isWrite = [data writeToFile:filePath atomically:YES];
    if (!isWrite) {
        !finishBlock?:finishBlock(nil);
    }
    
    [self getPdfImageWithUrl:[NSURL fileURLWithPath:filePath] finishBlock:finishBlock];
}

+ (void)getPdfImageWithUrl:(NSURL *)fileUrl finishBlock:(void(^)(UIImage *image))finishBlock{
    CGFloat totalHeight = 0;
    
    //获取size
    CGRect rect = CGRectNull;
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef)fileUrl);
    
    size_t pageNum = CGPDFDocumentGetNumberOfPages(pdf);
    
    CGRect screenBound = [UIScreen mainScreen].bounds;
    
    NSMutableArray <NSString *>*filesArr = [NSMutableArray new];
    // 画每一页pdf
    for (size_t index = 1; index <= pageNum; index++) {
        @autoreleasepool {
            // 画pdf
            CGPDFPageRef page = CGPDFDocumentGetPage(pdf, index);
            rect = CGPDFPageGetBoxRect(page, kCGPDFCropBox);
            NSInteger rotationAngle = CGPDFPageGetRotationAngle(page);
            
            if (rotationAngle == 90 || rotationAngle == 270) {
                CGFloat temp = rect.size.width;
                rect.size.width = rect.size.height;
                rect.size.height = temp;
            }

            CGFloat whRatio = rect.size.height / rect.size.width;
            rect.size.width = screenBound.size.width;
            rect.size.height = rect.size.width * whRatio;
            totalHeight += rect.size.height;
 
            UIImage *image;
            if (!CGRectEqualToRect(rect, CGRectNull)) {
                UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
                CGAffineTransform drawingTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, rect, 0, true);
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                CGContextConcatCTM(ctx, drawingTransform);
                CGContextDrawPDFPage(ctx, page);
                image = UIGraphicsGetImageFromCurrentImageContext();
                image = [UIImage imageWithCGImage:image.CGImage scale:1.0f orientation:UIImageOrientationDownMirrored];
                UIGraphicsEndImageContext();
            }
            

            if (image) {
                NSArray *separatedArr = [fileUrl.absoluteString componentsSeparatedByString:@"."];
                NSString *prefix = [separatedArr firstObject];

                NSString *fileJpgPath = [NSString stringWithFormat:@"%@-%@.jpg",prefix,@(index)];
                NSData *data = UIImageJPEGRepresentation(image, 1.0);
                if (data.length > 0) {
                    NSURL *fileURL = [NSURL URLWithString:fileJpgPath];
                    BOOL isWrite = [data writeToURL:fileURL atomically:YES];
 
                    if (isWrite){
                        [filesArr addObject:fileJpgPath];
                    }
                }
                
                
            }
        }
    }
    CGPDFDocumentRelease(pdf);

    UIImage *image = [TFY_SnapshotAuxiliaryCache spellImageOf:CGSizeMake(screenBound.size.width, totalHeight) paths:filesArr];

    dispatch_async(dispatch_get_main_queue(), ^{
        !finishBlock?:finishBlock(image);
        
        // 清除图片缓存
        [filesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [[NSFileManager defaultManager] removeItemAtURL:[NSURL URLWithString:obj] error:nil];
        }];
    });
}

// 清除缓存
+ (void )clearPDFCache{
    [[NSFileManager defaultManager] removeItemAtPath:[KTFYDocumentPath stringByAppendingFormat:@"%@",kTFYPDFDownloadPath] error:nil];
}

//文件夹创建
+ (void)creatFolderInCacheWithPath:(NSString *)path {
    NSString *creatFolderPath = [KTFYDocumentPath stringByAppendingPathComponent:path];
    BOOL isDir;
    if (![[NSFileManager defaultManager] fileExistsAtPath:creatFolderPath isDirectory:&isDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:creatFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

//MD5转换
+ (NSString *)MD5ForLower32Bate:(NSString *)str{
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}


@end

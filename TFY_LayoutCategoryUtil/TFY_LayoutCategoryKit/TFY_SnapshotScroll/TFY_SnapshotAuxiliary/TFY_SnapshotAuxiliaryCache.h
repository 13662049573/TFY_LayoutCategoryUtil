//
//  TFY_SnapshotAuxiliaryCache.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFY_SnapshotAuxiliaryCache : NSObject

+ (NSString *)cacheFileWith:(NSString *)modulePath index:(NSInteger )index;

+ (void )clearCacheWith:(NSString *)modulePath;

+ (UIImage *)spellImageOf:(CGSize )imageSize paths:(NSArray <NSString *> *)paths;

+ (void)getPDFDataWith:(NSString *)fileUrl finishBlock:(void(^)(UIImage *image))finishBlock;

+ (void)clearPDFCache;

@end

NS_ASSUME_NONNULL_END

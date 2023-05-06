//
//  TFY_AppVersion.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/5/6.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFY_AppVersion : NSObject

/** 本地版本号 */
+ (NSString *)locationVersion;
/** 检测版本并回调 */
+ (void)isUpdataApp:(NSString *)appId checkNewVersionNotificationBlock:(void(^)(BOOL success,  NSDictionary * _Nullable result))block;
/** 提示更新并回调 */
+ (void)showUpdateTips:(NSDictionary *)dictionary completion:(void(^__nullable)(BOOL success,NSString *trackId,NSURL *trackViewUrl))block;

@end

NS_ASSUME_NONNULL_END

//
//  TFY_OpenShare+Renren.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/6/1.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "TFY_OpenShare.h"

NS_ASSUME_NONNULL_BEGIN

@interface TFY_OpenShare (Renren)
+(void)connectRenrenWithAppId:(NSString *)appId AndAppKey:(NSString*)appKey;
+(BOOL)isRenrenInstalled;

+(void)shareToRenrenSession:(TFY_OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
+(void)shareToRenrenTimeline:(TFY_OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
@end

NS_ASSUME_NONNULL_END

//
//  NSString+avoidCrash.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (avoidCrash)
+ (void)tfy_avoidCrashExchangeMethod;
@end

NS_ASSUME_NONNULL_END

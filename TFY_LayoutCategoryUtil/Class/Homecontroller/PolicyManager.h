//
//  PolicyManager.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PolicyManager : NSObject
+ (PolicyManager *)defaultManager;

@property (nonatomic, strong, readonly) NSNumber * isAllowPolicy;

- (void)show;

- (void)clearCache;
@end

NS_ASSUME_NONNULL_END

//
//  PolicyViewController.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "SSDKCommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PolicyViewController : SSDKCommonViewController
@property (nonatomic, copy) void (^ policyStaus) (BOOL status);
@end

NS_ASSUME_NONNULL_END

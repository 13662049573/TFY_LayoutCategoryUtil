//
//  PolicyManager.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PolicyManager.h"
#import "PolicyViewController.h"
static NSString * kPolicyManagerSaveKey =  @"kPolicyManagerSaveKey";

@interface PolicyManager ()
@property (nonatomic, strong) NSNumber * isAllowPolicy;
@end

@implementation PolicyManager
static dispatch_once_t onceToken;

static PolicyManager * manager = nil;
+ (PolicyManager *)defaultManager{
    dispatch_once(&onceToken, ^{
        manager = [PolicyManager new];
    });
    return manager;
}

- (void)show{
    
    id cacheKey = [[NSUserDefaults standardUserDefaults] objectForKey:kPolicyManagerSaveKey];
    if (cacheKey) {
        self.isAllowPolicy = cacheKey;
        return;
    }
    PolicyViewController *vc = [PolicyViewController new];
    vc.policyStaus = ^(BOOL status) {
        self.isAllowPolicy = @(status);
        
        [[NSUserDefaults standardUserDefaults] setObject:@(status) forKey:kPolicyManagerSaveKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self clear];
    };
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.present();
    
}

- (void)clear{
    onceToken = 0;
    manager = nil;
}

- (void)clearCache{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kPolicyManagerSaveKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

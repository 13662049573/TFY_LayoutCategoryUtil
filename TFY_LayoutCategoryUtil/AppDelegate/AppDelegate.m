//
//  AppDelegate.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "MainViewController.h"
#import "PolicyManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     if (!TFY_ScenePackage.isSceneApp) {
           self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
           self.window.backgroundColor = [UIColor whiteColor];
           [self.window makeKeyAndVisible];
     }
    TFYRotateDefault.shared.defaultPreferredStatusBarStyle = UIStatusBarStyleDefault;
    
    [TFY_ScenePackage addBeforeWindowEvent:^(TFY_Scene * _Nonnull application) {
       if ([GuideViewController isFirstRun]) {
           [UIApplication tfy_window].rootViewController = [[GuideViewController alloc] init];
           [[UIApplication tfy_window].rootViewController addViewDidDisappearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
               [[PolicyManager defaultManager] show];
           }];
       } else {
           [UIApplication tfy_window].rootViewController = [[MainViewController alloc] init];
           [[PolicyManager defaultManager] show];
       }
    }];
    return YES;
}

@end

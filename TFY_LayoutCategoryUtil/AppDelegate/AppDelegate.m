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
     if (!TFY_Scene.isSceneApp) {
           self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
           self.window.backgroundColor = [UIColor whiteColor];
           [self.window makeKeyAndVisible];
     }
    [TFY_Scene addBeforeWindowEvent:^(TFY_ScenePackageTools * _Nonnull application) {
       if ([GuideViewController isFirstRun]) {
           [UIApplication tfy_window].rootViewController = [[GuideViewController alloc] init];
           [[UIApplication tfy_window].rootViewController addViewDidDisappearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
               [[PolicyManager defaultManager] show];
           }];
       } else {
           [UIApplication tfy_window].rootViewController = [[MainViewController alloc] init];
           [[PolicyManager defaultManager] show];
       }
       [self setupNavigationBar];
    }];
    return YES;
}


- (void)setupNavigationBar
{
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    // 设置返回样式图片
    UIImage *image = [[UIImage imageNamed:@"fh"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
    // 设置标题属性
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :TFY_ColorRGB(255, 255, 255), NSFontAttributeName : Font(PingFangSemibold, 18)}];
    // 设置bar颜色
    
    [navigationBar setBarTintColor:TFY_ColorRGB(50, 102, 255)];
}

@end

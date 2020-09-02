//
//  SceneDelegate.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "SceneDelegate.h"


#ifndef __IPHONE_13_0

@protocol UIWindowSceneDelegate <NSObject>
@end

#endif

@protocol UIWindowSceneDelegate;
@class UIScene,UISceneSession,UISceneConnectionOptions, UIOpenURLContext;
@interface SceneDelegate ()<UIWindowSceneDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self.window tfy_showOnScene:scene];
}

@end

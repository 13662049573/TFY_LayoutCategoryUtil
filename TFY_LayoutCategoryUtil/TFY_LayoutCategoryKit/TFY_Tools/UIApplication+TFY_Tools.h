//
//  UIApplication+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFY_ScenePackageTools.h"

#define TFY_SafeArea(view)\
({\
UIEdgeInsets safeInsets = UIEdgeInsetsMake(20, 0, 0, 0);\
      if(view){\
          static IMP imp = _objc_msgForward;\
          static dispatch_once_t onceToken;\
          dispatch_once(&onceToken, ^{\
                  Method method = class_getInstanceMethod([view class], sel_registerName("safeAreaInsets"));\
                  if (method) {\
                     imp = method_getImplementation(method);\
                  }\
          });\
      if (imp != _objc_msgForward) {\
          safeInsets = ((UIEdgeInsets (*)(id, SEL))imp)(view,sel_registerName("safeAreaInsets"));\
     }\
  }\
 safeInsets;\
})

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (TFY_Tools)
/**
 * statusBar的frame
 */
+ (CGRect)statusBarFrame;

/**
 * 当前的windowScene
 */
+ (id)currentScene;

/**
 * 当前windowSceneDelegate
 */
+ (id)currentSceneDelegate;

/**
 * 最上面的window
 */
+ (UIWindow *)currentWindow;

/**
 * 当前关键视图
 */
+ (UIWindow *)currentKeyWindow;

/**
 * 当前操作的window
 */
+ (UIWindow *)window;

+ (UIWindow *)keyWindow;

/**
 * app的 delegate
 */
+ (id<UIApplicationDelegate>)delegate;

/**
 * 跟控制器-- window
 */
+ (__kindof UIViewController *)rootViewController;


@property (nonatomic, assign, class, readonly) BOOL isSceneApp;
/**
 * 最上层的非TabbarController和NavigationBarController的控制器
 */
+ (__kindof  UIViewController *)currentTopViewController;

+ (__kindof UINavigationController *)currentToNavgationController;

@end

@interface UIView (Navigation_Chain)

- (UINavigationController *_Nonnull)navigationController;

@end

//仅仅是状态栏的高度
CG_INLINE CGFloat kStatusBarHeight() {
    return (TFY_SafeArea([UIApplication window]).top);
}

CG_INLINE CGFloat kDefaultNavigationBarHeight() {
    return (TFY_SafeArea([UIApplication window]).top + 44);
}

//这个高度如果有tabbar高度则包含tabbar高度，否则不包含
CG_INLINE CGFloat KHomeIndicatorHeight() {
    return (TFY_SafeArea([UIApplication currentTopViewController].view).bottom);
}
//这个高度只是tabbarHeight的高度
CG_INLINE CGFloat KTabbarHeight() {
    return ([UIApplication rootViewController].tabBarController.tabBar.height);
}

//当前显示的navigationbar的高度
CG_INLINE CGFloat kNavigationBarHeight() {
    UINavigationBar *bar = [UIApplication currentTopViewController].navigationController.navigationBar;
    return bar.isHidden?0:bar.height + kStatusBarHeight();
}

NS_ASSUME_NONNULL_END

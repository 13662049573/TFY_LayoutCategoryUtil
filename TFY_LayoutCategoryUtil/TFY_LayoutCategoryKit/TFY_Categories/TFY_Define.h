//
//  TFY_Define.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#ifndef TFY_Define_h
#define TFY_Define_h

#import <UIKit/UIKit.h>



#define TFY_WIDTH [UIScreen screenWidth]

#define TFY_HEIGHT [UIScreen screenHeight]

#define TFY_SCALE [UIScreen screenScale]

//仅仅是状态栏的高度
#define kStatusBarHeight (TFY_SafeArea([UIApplication window]).top)

//当前显示的navigationbar的高度
#define kNavigationBarHeight \
({\
    CGFloat height = 0;\
    UINavigationBar *bar = [UIApplication currentTopViewController].navigationController.navigationBar;\
    if (!bar.isHidden) {\
         height = bar.height + kStatusBarHeight;\
    }\
    height;\
})

#define kDefaultNavigationBarHeight (TFY_SafeArea([UIApplication window]).top + 44)

//这个高度如果有tabbar高度则包含tabbar高度，否则不包含
#define KHomeIndicatorHeight (TFY_SafeArea([UIApplication currentTopViewController].view).bottom)

//这个高度只是tabbarHeight的高度
#define KTabbarHeight ([UIApplication rootViewController].tabBarController.tabBar.height)

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

#define TFY_WEAK  __weak typeof(self)weakSelf = self;

#define TFY_STRONG  __strong typeof(weakSelf)self = weakSelf;

#endif /* TFY_Define_h */

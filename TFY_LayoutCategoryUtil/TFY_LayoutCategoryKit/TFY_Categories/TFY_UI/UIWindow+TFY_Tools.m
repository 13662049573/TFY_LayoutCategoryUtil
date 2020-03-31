//
//  UIWindow+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UIWindow+TFY_Tools.h"
#import "UIApplication+TFY_Tools.h"
#import <objc/message.h>

@implementation UIWindow (TFY_Tools)

- (void)showOnCurrentScene{
    [self showOnScene:[UIApplication currentScene]];
}

- (void)showOnScene:(id)scene{
    if (UIApplication.isSceneApp) {
        if (scene && [scene isKindOfClass:NSClassFromString(@"UIWindowScene")]) {
            ((void (*)(id, SEL,id))objc_msgSend)(self,sel_registerName("setWindowScene:"),scene);
        }
    }
}
@end

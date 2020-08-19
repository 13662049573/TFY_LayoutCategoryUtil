//
//  UIViewController+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UIViewController+TFY_Tools.h"

@implementation UIViewController (TFY_Tools)

- (UINavigationController *)navigationController{
    UIResponder * responder = self.view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return  (UINavigationController *)responder;
}

@end

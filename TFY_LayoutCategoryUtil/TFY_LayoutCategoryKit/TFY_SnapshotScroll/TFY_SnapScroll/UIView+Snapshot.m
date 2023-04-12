//
//  UIView+Snapshot.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "UIView+Snapshot.h"
#import "TFY_Inlinefunction.h"
#import "UIViewController+TFY_Tools.h"

@implementation UIView (Snapshot)

- (void )screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(void(^)(UIImage *snapshotImage))finishBlock{
    if (!finishBlock)return;
    
    UIView *snapshotMaskView;
    if (needMask){
      snapshotMaskView = [self addSnapshotMaskView];
      addMaskAfterBlock?addMaskAfterBlock():nil;
    }
    
    UIImage *snapshotImage = nil;
    
    __block CGRect bounds;
    __block CALayer *selfLayer;
    TFY_GCD_QUEUE_MAIN(^{
        bounds = self.bounds;
        selfLayer = self.layer;
    });

    UIGraphicsBeginImageContextWithOptions(bounds.size,NO,[UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [selfLayer renderInContext:context];

    snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    if (snapshotMaskView){
        [snapshotMaskView removeFromSuperview];
    }

    finishBlock(snapshotImage);
}


- (UIView *)addSnapshotMaskView{
    __block UIView *snapshotMaskView;
    
    //获取父view
    __block UIView *superview;
    __block UIViewController *currentViewController;
    
    TFY_GCD_QUEUE_MAIN(^{
        currentViewController = [UIViewController currentViewController];
        if (currentViewController){
            superview = currentViewController.view;
        }else{
            superview = self.superview;
        }
        
        //添加遮盖
        snapshotMaskView = [superview snapshotViewAfterScreenUpdates:YES];
        
        snapshotMaskView.frame = superview.frame;
        [superview.layer addSublayer:snapshotMaskView.layer];
    });
    
    return snapshotMaskView;
}

@end

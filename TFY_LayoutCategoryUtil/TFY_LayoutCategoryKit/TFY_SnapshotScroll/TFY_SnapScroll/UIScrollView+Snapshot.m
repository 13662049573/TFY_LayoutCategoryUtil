//
//  UIScrollView+Snapshot.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "UIScrollView+Snapshot.h"
#import "TFY_SnapshotManager.h"
#import "TFY_Inlinefunction.h"
#import "UIScrollView+SnapshotAuxiliary.h"
#import "UIView+Snapshot.h"

@implementation UIScrollView (Snapshot)

- (void )snapshotSpliceImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentOffset:(CGPoint )oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock{
    
    [self snapshotSpliceImageWith:snapshotMaskView
                      contentSize:contentSize
                   oldContentSize:contentSize
                 oldContentOffset:oldContentOffset
                      finishBlock:finishBlock];
}

- (void )snapshotSpliceImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentSize:(CGSize )oldContentSize oldContentOffset:(CGPoint )oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock{

    __block CGRect scrollViewBounds;
    TFY_GCD_QUEUE_MAIN(^{
        self.contentOffset = CGPointZero;
        scrollViewBounds = self.bounds;
    });
    //计算快照屏幕数
    NSUInteger snapshotScreenCount = floorf(contentSize.height / scrollViewBounds.size.height);

    __weak typeof(self) weakSelf = self;
    UIGraphicsBeginImageContextWithOptions(contentSize, YES, [UIScreen mainScreen].scale);

    //截取完所有图片
    [self scrollToDraw:0 maxIndex:(NSInteger )snapshotScreenCount finishBlock:^{
        if (snapshotMaskView.layer){
            [snapshotMaskView.layer removeFromSuperlayer];
        }

        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        weakSelf.contentOffset = oldContentOffset;
        weakSelf.contentSize = oldContentSize;
        
        !finishBlock?:finishBlock(snapshotImage);
    }];
}

//滑动画了再截图
- (void )scrollToDraw:(NSInteger )index maxIndex:(NSInteger )maxIndex finishBlock:(void(^)(void))finishBlock{
    __block UIView *snapshotView;
    __block CGRect snapshotFrame;
    TFY_GCD_QUEUE_MAIN(^{
        snapshotView = self.superview;

         //截取的frame
         snapshotFrame = CGRectMake(0, (float)index * snapshotView.bounds.size.height, snapshotView.bounds.size.width, snapshotView.bounds.size.height);

         [self setContentOffset:CGPointMake(0, -self.contentInset.top + index * snapshotView.frame.size.height)];
    });

    CGFloat delayTime = MAX([TFY_SnapshotManager defaultManager].delayTime, 0.3);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [snapshotView drawViewHierarchyInRect:snapshotFrame afterScreenUpdates:YES];

        if(index < maxIndex){
            [self scrollToDraw:index + 1 maxIndex:maxIndex finishBlock:finishBlock];
        }else{
            !finishBlock?:finishBlock();
        }
    });
}

- (void )screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(SnapshotFinishBlock )finishBlock{
    if (!finishBlock)return;
    
    UIView *snapshotMaskView;
    if (needMask){
        snapshotMaskView = [self addSnapshotMaskView];
        addMaskAfterBlock?addMaskAfterBlock():nil;
    }
    
    //保存原始信息
    __block CGPoint oldContentOffset;
    __block CGSize oldContentSize;
    TFY_GCD_QUEUE_MAIN(^{
        oldContentOffset = self.contentOffset;
        oldContentSize = self.contentSize;
    });
    // 异常判断，因为需要根据contentSize截取图片，如果width为0，取自身控件的宽度，结束后还原
    if (!self.contentSize.width){
        NSLog(@"width is zero");
        
        self.contentSize = CGSizeMake(self.bounds.size.width, self.contentSize.height);
    }

    if ([self isBigImageWith:oldContentSize]){
        [self snapshotBigImageWith:snapshotMaskView contentSize:oldContentSize oldContentOffset:oldContentOffset finishBlock:finishBlock];
        return ;
    }
    
    // 使用拼接方案
    if ([TFY_SnapshotManager defaultManager].snapshotType == SnapshotTypeSplice){
        [self snapshotSpliceImageWith:snapshotMaskView contentSize:oldContentSize oldContentOffset:oldContentOffset finishBlock:finishBlock];
        return;
    }
    
    [self snapshotNormalImageWith:snapshotMaskView contentSize:oldContentSize oldContentOffset:oldContentOffset finishBlock:finishBlock];
}

- (BOOL )isBigImageWith:(CGSize )contentSize{
    TFY_SnapshotManager *snapshotManager = [TFY_SnapshotManager defaultManager];
    if (contentSize.width * contentSize.height > snapshotManager.maxImageSize){
        return YES;
    }
    return NO;
}


- (void )snapshotBigImageWith:(UIView *)snapshotMaskView contentSize:(CGSize)contentSize oldContentOffset:(CGPoint)oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock{
    TFY_SnapshotManager *snapshotManager = [TFY_SnapshotManager defaultManager];
    //计算快照屏幕数
    NSUInteger snapshotScreenCount = floorf(contentSize.height / self.bounds.size.height);
    
    __weak typeof(self) weakSelf = self;
    self.contentOffset = CGPointZero;
    
    NSInteger maxScreenCount = snapshotManager.maxScreenCount;
    
    self.delayTime = snapshotManager.delayTime;
    [self screenSnapshotWith:snapshotScreenCount maxScreenCount:maxScreenCount finishBlock:^(UIImage * _Nonnull snapshotImage) {
        
        if (snapshotMaskView.layer){
            [snapshotMaskView.layer removeFromSuperlayer];
        }
        
        weakSelf.contentOffset = oldContentOffset;
        weakSelf.contentSize = contentSize;
        
        !finishBlock?:finishBlock(snapshotImage);
    }];
}

- (void )snapshotNormalImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentOffset:(CGPoint )oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock{
    //保存frame
    __block CGRect oldFrame;
    TFY_GCD_QUEUE_MAIN(^{
        oldFrame = self.layer.frame;
        // 划到bottom
        if (self.contentSize.height > self.frame.size.height) {
            self.contentOffset = CGPointMake(0, self.contentSize.height - self.bounds.size.height + self.contentInset.bottom);
        }

        self.layer.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    });

    CGFloat delayTime = [TFY_SnapshotManager defaultManager].delayTime;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage* snapshotImage = nil;

        self.contentOffset = CGPointZero;

        UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, NO, [UIScreen mainScreen].scale);

        CGContextRef context = UIGraphicsGetCurrentContext();

        [self.layer renderInContext:context];

        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();

        //还原
        self.layer.frame = oldFrame;
        self.contentOffset = oldContentOffset;
        self.contentSize = contentSize;
        
        if (snapshotMaskView.layer){
            [snapshotMaskView.layer removeFromSuperlayer];
        }

        !finishBlock?:finishBlock(snapshotImage);
    });
}

- (instancetype )subScrollViewTotalExtraHeight:(void(^)(CGFloat subScrollViewExtraHeight))finishBlock{
    __block CGFloat extraHeight = 0.0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIScrollView class]]){
            UIScrollView *scrollView = (UIScrollView *)obj;
            
            if (scrollView.contentSize.height > scrollView.frame.size.height) {
                extraHeight = scrollView.contentSize.height - scrollView.frame.size.height;
            }
            
            [scrollView subScrollViewTotalExtraHeight:^(CGFloat subScrollViewExtraHeight) {
                extraHeight += subScrollViewExtraHeight;
            }];
        }
    }];
    
    
    finishBlock?finishBlock(extraHeight):nil;
    return self;
}

@end

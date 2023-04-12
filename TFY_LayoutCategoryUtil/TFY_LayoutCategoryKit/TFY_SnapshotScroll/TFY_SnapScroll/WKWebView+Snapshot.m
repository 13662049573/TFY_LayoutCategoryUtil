//
//  WKWebView+Snapshot.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "WKWebView+Snapshot.h"
#import "UIView+Snapshot.h"
#import "TFY_SnapshotManager.h"

@implementation WKWebView (Snapshot)

- (void)screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(SnapshotFinishBlock)finishBlock{
    if (!finishBlock)return;
    
    UIView *snapshotMaskView;
    if (needMask){
        snapshotMaskView = [self addSnapshotMaskView];
        addMaskAfterBlock?addMaskAfterBlock():nil;
    }
    
    //保存原始信息
    __block CGPoint oldContentOffset;
    __block CGSize oldContentSize;
    __block CGSize contentSize;
    __block UIScrollView *scrollView;
    
    TFY_GCD_QUEUE_MAIN(^{
        scrollView = self.scrollView;
        
        oldContentOffset = scrollView.contentOffset;
        oldContentSize = scrollView.contentSize;
        contentSize = oldContentSize;
        contentSize.height += scrollView.contentInset.top + scrollView.contentInset.bottom;
    });
    
    if ([scrollView isBigImageWith:contentSize]){
        [scrollView snapshotBigImageWith:snapshotMaskView contentSize:contentSize oldContentOffset:oldContentOffset finishBlock:finishBlock];
        return ;
    }
    [scrollView snapshotSpliceImageWith:snapshotMaskView contentSize:contentSize oldContentOffset:oldContentOffset finishBlock:finishBlock];
}

@end

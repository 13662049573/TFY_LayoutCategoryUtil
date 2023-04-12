//
//  UIScrollView+Snapshot.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SnapshotFinishBlock)(UIImage *snapshotImage);

@interface UIScrollView (Snapshot)

- (void )snapshotSpliceImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentOffset:(CGPoint )oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock;

- (void )snapshotSpliceImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentSize:(CGSize )oldContentSize oldContentOffset:(CGPoint )oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock;

- (void )screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(SnapshotFinishBlock )finishBlock;

// 是否是大图
- (BOOL )isBigImageWith:(CGSize )contentSize;

// 截图大图
- (void )snapshotBigImageWith:(UIView *)snapshotMaskView contentSize:(CGSize )contentSize oldContentOffset:(CGPoint)oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock;

/// 获取子scrollView的内容的多余高度
- (instancetype )subScrollViewTotalExtraHeight:(void(^)(CGFloat subScrollViewExtraHeight))finishBlock;

@end

NS_ASSUME_NONNULL_END

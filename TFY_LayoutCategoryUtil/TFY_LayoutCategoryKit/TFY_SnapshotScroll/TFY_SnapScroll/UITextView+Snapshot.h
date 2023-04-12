//
//  UITextView+Snapshot.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SnapshotFinishBlock)(UIImage *snapshotImage);

@interface UITextView (Snapshot)

- (void )screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(SnapshotFinishBlock)finishBlock;

- (void )snapshotNormalImageWith:(UIView *)snapshotMaskView contentSize:(CGSize)contentSize oldContentOffset:(CGPoint)oldContentOffset finishBlock:(SnapshotFinishBlock )finishBlock;

- (BOOL)isBigImageWith:(CGSize)contentSize;

@end

NS_ASSUME_NONNULL_END

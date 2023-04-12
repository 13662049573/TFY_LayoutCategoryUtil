//
//  UIView+Snapshot.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Snapshot)

- (void )screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(void(^)(UIImage *snapshotImage))finishBlock;

/// 添加当前截图的遮盖
- (UIView *)addSnapshotMaskView;

@end

NS_ASSUME_NONNULL_END

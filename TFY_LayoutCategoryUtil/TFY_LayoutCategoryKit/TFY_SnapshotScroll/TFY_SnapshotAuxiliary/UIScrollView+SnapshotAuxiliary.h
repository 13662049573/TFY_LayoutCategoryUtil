//
//  UIScrollView+SnapshotAuxiliary.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (SnapshotAuxiliary)

@property (nonatomic, assign) CGFloat delayTime;

- (void )screenSnapshotWith:(NSInteger )snapshotScreenCount maxScreenCount:(NSInteger )maxScreenCount finishBlock:(void(^)(UIImage *snapshotImage))finishBlock;
@end

NS_ASSUME_NONNULL_END

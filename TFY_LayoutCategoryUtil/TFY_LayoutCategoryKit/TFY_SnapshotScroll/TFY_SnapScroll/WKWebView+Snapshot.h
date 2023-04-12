//
//  WKWebView+Snapshot.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "UIScrollView+Snapshot.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (Snapshot)

- (void)screenSnapshotNeedMask:(BOOL)needMask addMaskAfterBlock:(void(^)(void))addMaskAfterBlock finishBlock:(SnapshotFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END

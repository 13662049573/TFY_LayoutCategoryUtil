//
//  WKWebView+SnapshotAuxiliary.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (SnapshotAuxiliary)

- (void)getPDFImageWithBlock:(void(^)(UIImage *image))getImageBlock;

@end

NS_ASSUME_NONNULL_END

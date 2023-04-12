//
//  WKWebView+SnapshotAuxiliary.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "WKWebView+SnapshotAuxiliary.h"
#import "TFY_SnapshotAuxiliaryCache.h"

@implementation WKWebView (SnapshotAuxiliary)

- (void )getPDFImageWithBlock:(void(^)(UIImage *image))getImageBlock{
    NSString *requestUrl = self.URL.absoluteString;
    if (![requestUrl hasSuffix:@".pdf"]){
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [TFY_SnapshotAuxiliaryCache getPDFDataWith:requestUrl finishBlock:getImageBlock];
    });
}

@end

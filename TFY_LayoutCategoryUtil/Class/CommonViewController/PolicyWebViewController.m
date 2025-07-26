//
//  PolicyWebViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2020/9/2.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PolicyWebViewController.h"

@interface PolicyWebViewController ()
TFY_PROPERTY_OBJECT_STRONG(WKWebView, webView);
@end

@implementation PolicyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewModelSet()
    .addToSuperView(self.view)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        self.webView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    });
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.extraInfo[@"url"]]];
}

@end

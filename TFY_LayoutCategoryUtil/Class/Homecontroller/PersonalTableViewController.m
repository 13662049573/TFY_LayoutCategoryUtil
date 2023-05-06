//
//  PersonalTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PersonalTableViewController.h"
#import <StoreKit/StoreKit.h>

@interface PersonalTableViewController ()<SKStoreProductViewControllerDelegate>
@property(nonatomic , strong)UITextView *textView;
@property(nonatomic , strong)UIButton *buttom;
@end

@implementation PersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textView.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.top.equalTo(self.view).offset(100);
        make.height.mas_equalTo(40);
    });
    
    [self.textView tfy_autoHeightWithMaxHeight:100 textViewHeightDidChanged:^(CGFloat currentTextViewHeight) {
        self.textView.makeChain.updateMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.height.mas_equalTo(currentTextViewHeight);
        });
    }];
    
    self.buttom.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.right.mas_equalTo(self.textView);
        make.top.equalTo(self.textView.mas_bottom).offset(20);
        make.height.mas_equalTo(44);
    });
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = UITextViewSet();
        _textView.makeChain
        .placeholder(@"测试护师")
        .placeholderColor(UIColor.blueColor)
        .font([UIFont systemFontOfSize:15 weight:UIFontWeightSemibold])
        .borderColor(UIColor.redColor.CGColor)
        .borderWidth(1)
        .backgroundColor(UIColor.whiteColor);
    }
    return _textView;
}

- (UIButton *)buttom {
    if (!_buttom) {
        _buttom = UIButtonSet();
        _buttom.makeChain
        .backgroundColor(UIColor.orangeColor)
        .text(@"检测更新", UIControlStateNormal)
        .textColor(UIColor.whiteColor, UIControlStateNormal)
        .cornerRadius(22)
        .masksToBounds(YES)
        .addTarget(self, @selector(buttomClick:), UIControlEventTouchUpInside);
    }
    return _buttom;
}

- (void)buttomClick:(UIButton *)btn {
    [TFY_AppVersion isUpdataApp:@"1596187588" checkNewVersionNotificationBlock:^(BOOL success, NSDictionary * _Nullable result) {
        if (success && result.count > 0) {
            [TFY_AppVersion showUpdateTips:result completion:^(BOOL success, NSString * _Nonnull trackId, NSURL * _Nonnull trackViewUrl) {
                if (success) {
                    [self sKStoreProductAppId:trackId];
                }
            }];
        } else {
            [TFY_Utils makeToast:@"已经是最新版本了!"];
        }
    }];
}
/// 获取对应项目下载界面
- (void)sKStoreProductAppId:(NSString *)appid {
    [TFY_Utils makeToastActivity];
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
    storeProductVC.delegate = self;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:appid forKey:SKStoreProductParameterITunesItemIdentifier];
    [storeProductVC loadProductWithParameters:dic completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (!error) {
            [self presentViewController:storeProductVC animated:YES completion:nil];
        }
        [TFY_Utils hideToastActivity];
    }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

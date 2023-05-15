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
@property(nonatomic , strong)TFY_TagsView *tagsView;
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
    
    self.tagsView.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.buttom.mas_bottom).offset(30);
        make.height.mas_equalTo(200);
    });
    
    [self generateTagsTapped];
}

- (void)generateTagsTapped {
  NSString *text = @"神的恩赐，神的恩赐，神的恩赐。埃尼亚语comodo ligula eget dolor。Aenean马萨。与社会有关的生育问题和生育问题，都是必须解决的问题。Donec quam felis, ultresies nec, pellentesque eu, pretium quis, sem。无结果者皆为敌人。刚足，小穗状花序，锯齿状花序，卵形花序，圆弧。In enim just to, rhoncus ut, imperdiet a, venenatis vitae, just to。Nullam dictum felis eu pede mollis pretium。整数tincidunt。";
  [self.tagsView removeAllTags];
  for (NSString *word in [text componentsSeparatedByString:@" "]) {
    if (word.length > 0) {
      [self.tagsView addTag:word];
    }
  }
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

- (TFY_TagsView *)tagsView {
    if (!_tagsView) {
        _tagsView = TFY_TagsView.new;
        _tagsView.editable = NO;
        _tagsView.selectable = YES;
        _tagsView.allowsMultipleSelection = YES;
        _tagsView.scrollsHorizontally = NO;
        _tagsView.interitemSpacing = 10;
        _tagsView.lineSpacing = 10;
        _tagsView.tagButtonHeight = 40;
        _tagsView.tintColor = UIColor.redColor;
    }
    return _tagsView;
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

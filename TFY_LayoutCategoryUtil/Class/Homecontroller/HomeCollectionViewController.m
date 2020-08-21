//
//  HomeCollectionViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "HomeCollectionViewController.h"

@interface HomeCollectionViewController ()
@property (nonatomic, strong) UIButton * confirmButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textfiled;
@end

@implementation HomeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TFY_ColorHexString(@"ffffff");
    
    UIButtonModelSet().backgroundColor(UIColor.orangeColor).text(@"这是一个按钮", UIControlStateNormal).font([UIFont systemFontOfSize:15 weight:UIFontWeightBold]).assignTo(^(__kindof UIView * _Nonnull view) {
        self.confirmButton = view;
    }).addTarget(self, @selector(btnClick:), UIControlEventTouchUpInside).addToSuperView(self.view).makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(50);
    });
    
    UILabelModelSet().text(@"这是一个Label").textColor(UIColor.redColor).backgroundColor(UIColor.yellowColor).cornerRadius(10).font([UIFont systemFontOfSize:14 weight:UIFontWeightHeavy]).numberOfLines(0).textAlignment(NSTextAlignmentCenter).addToSuperView(self.view).makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.top.equalTo(self.confirmButton.mas_bottom).offset(30);
        make.height.mas_equalTo(self.confirmButton);
    }).assignTo(^(__kindof UIView * _Nonnull view) {
        self.titleLabel = view;
    });
    
    UITextFieldModelSet().placeholder(@"这是一个输入框").placeholderColor(UIColor.lightTextColor).allowsEditingTextAttributes(YES).font([UIFont systemFontOfSize:30 weight:UIFontWeightBold]).textColor(UIColor.redColor).backgroundColor(UIColor.lightTextColor).cornerRadius(10).addToSuperView(self.view).assignTo(^(__kindof UIView * _Nonnull view) {
        self.textfiled = view;
    }).makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(80);
    });
    
    UIViewModelSet().backgroundColor(TFY_ColorHexString(@"4e5f6g")).clipRadius(CornerClipTypeBothTop, 10).addToSuperView(self.view).makeMasonry(^(MASConstraintMaker * _Nonnull make) {
           make.left.equalTo(self.titleLabel);
           make.right.equalTo(self.titleLabel);
           make.top.equalTo(self.textfiled.mas_bottom).offset(20);
           make.height.mas_equalTo(80);
    });
    
}

- (void)btnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.confirmButton.backgroundColor = UIColor.greenColor;
    } else {
        self.confirmButton.backgroundColor = UIColor.yellowColor;
    }
}

@end

//
//  HomeCollectionViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "HomeCollectionViewController.h"

@interface HomeCollectionViewController ()
TFY_PROPERTY_OBJECT_STRONG(UIButton, confirmButton);
TFY_PROPERTY_OBJECT_STRONG(UILabel, titleLabel);
TFY_PROPERTY_OBJECT_STRONG(UITextField, textfiled);
TFY_PROPERTY_NSString(name);
TFY_PROPERTY_CHAIN_BLOCK(myblock,NSString *name,NSString *name2);

@end

@implementation HomeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TFY_ColorHexString(@"ffffff");
    
    UIButtonModelSet()
    .multiple(3)
    .part_first()
    .text(@"第一个", UIControlStateNormal).textColor(UIColor.redColor, UIControlStateNormal)
    .backgroundColor(UIColor.yellowColor)
    .cornerRadius(40)
//    .image(TFY_ImageNamed(@"login_phone"), UIControlStateNormal)
    .assignToObjects(^(NSArray * _Nonnull objs) {
//        self.phoneBtn = objs[0];
//        self.weixinBtn = objs[1];
//        self.qqBtn = objs[2];
    })
//    .addTarget(self, @selector(phoneClick:), UIControlEventTouchUpInside)
    .makeTag(1)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(68);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    })
    .part_sencond()
    .text(@"第二个", UIControlStateNormal).textColor(UIColor.redColor, UIControlStateNormal)
//    .image(TFY_ImageNamed(@"login_weixin"),UIControlStateNormal)
    .makeTag(2)
    .addToSuperView(self.view)
    .backgroundColor(UIColor.purpleColor)
//    .addTarget(self, @selector(phoneClick:), UIControlEventTouchUpInside)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    })
    .part_third()
    .text(@"第三个", UIControlStateNormal).textColor(UIColor.redColor, UIControlStateNormal)
//    .addTarget(self, @selector(phoneClick:), UIControlEventTouchUpInside)
    .makeTag(3)
    .backgroundColor(UIColor.blueColor)
//    .image(TFY_ImageNamed(@"login_qq"),UIControlStateNormal)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.equalTo(self.view).offset(-68);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    });
    
        UIButtonModelSet().backgroundColor(UIColor.orangeColor).text(@"这是一个按钮", UIControlStateNormal).font([UIFont systemFontOfSize:15 weight:UIFontWeightBold]).assignTo(^(__kindof UIView * _Nonnull view) {
            self.confirmButton = view;
        }).addTarget(self, @selector(btnClick:), UIControlEventTouchUpInside)
        .addToSuperView(self.view)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.view).offset(200);
            make.right.equalTo(self.view).offset(-20);
            make.height.mas_equalTo(50);
        });
    
        UILabelModelSet().text(@"这是一个Label").textColor(UIColor.redColor).backgroundColor(UIColor.yellowColor).cornerRadius(10).font([UIFont systemFontOfSize:14 weight:UIFontWeightHeavy]).numberOfLines(0).textAlignment(NSTextAlignmentCenter)
        .addToSuperView(self.view)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.equalTo(self.view).offset(40);
            make.right.equalTo(self.view).offset(-40);
            make.top.equalTo(self.confirmButton.mas_bottom).offset(30);
            make.height.mas_equalTo(self.confirmButton);
        }).assignTo(^(__kindof UIView * _Nonnull view) {
            self.titleLabel = view;
        });
    
        UITextFieldModelSet()
    .placeholder(@"这是一个输入框")
    .placeholderColor(UIColor.whiteColor)
    .allowsEditingTextAttributes(YES)
    .font([UIFont systemFontOfSize:15 weight:UIFontWeightBold])
    .textColor(UIColor.redColor)
    .contentInsets(UIEdgeInsetsMake(-50, 10, 10, 10))
    .backgroundColor(UIColor.orangeColor)
    .cornerRadius(10)
    .addToSuperView(self.view)
    .assignTo(^(__kindof UIView * _Nonnull view) {
            self.textfiled = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(100);
    });
    
    UIViewModelSet().backgroundColor(TFY_ColorHexString(@"4e5f6g")).clipRadius(CornerClipTypeBothTop, 10).addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
           make.left.equalTo(self.titleLabel);
           make.right.equalTo(self.titleLabel);
           make.top.equalTo(self.textfiled.mas_bottom).offset(20);
           make.height.mas_equalTo(80);
    });

    self.myblock = ^(NSString *name, NSString *name2) {
        NSLog(@"block-----%@---%@",name,name2);
    };
}

- (void)btnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.confirmButton.backgroundColor = UIColor.greenColor;
    } else {
        self.confirmButton.backgroundColor = UIColor.yellowColor;
    }
    self.myblock(@"222", @"33333");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textfiled resignFirstResponder];
}

@end

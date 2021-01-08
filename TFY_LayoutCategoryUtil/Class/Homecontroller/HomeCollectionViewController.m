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

    self.navigationItem.leftBarButtonItem = tfy_barbtnItem().tfy_titleItem(@"添加标签",15,[UIColor redColor],self,@selector(timeimageClick));
    TFY_QueueStartAfterTime(0.5)
    [self.navigationItem.leftBarButtonItem tfy_addBadgeWithText:@"4"];
    TFY_queueEnd
    
    self.navigationItem.rightBarButtonItem = tfy_barbtnItem().tfy_titleItem(@"减少标签",15,[UIColor redColor],self,@selector(timeimageClick2));
    
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
    
    UIButtonModelSet()
    .backgroundColor(UIColor.orangeColor)
    .text(@"这是一个按钮", UIControlStateNormal)
    .font([UIFont systemFontOfSize:15 weight:UIFontWeightBold])
    .tapSpaceTime(2)//限制点击时间
    .buttonTapTime(^(NSUInteger time, BOOL * _Nonnull stop, UIButton * _Nonnull button) {//获取点击多少次
        NSLog(@"time----------%lu",(unsigned long)time);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {//返回对象
            self.confirmButton = view;
    })
    .addTarget(self, @selector(btnClick:), UIControlEventTouchUpInside)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.view).offset(200);
            make.right.equalTo(self.view).offset(-20);
            make.height.mas_equalTo(50);
    });
    
    UILabelModelSet()
    .text(@"这是一个Label")
    .textColor(UIColor.redColor)
    .backgroundColor(UIColor.yellowColor)
    .cornerRadius(10).font([UIFont systemFontOfSize:14 weight:UIFontWeightHeavy])
    .numberOfLines(0)
    .textAlignment(NSTextAlignmentCenter)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.equalTo(self.view).offset(40);
            make.right.equalTo(self.view).offset(-40);
            make.top.equalTo(self.confirmButton.mas_bottom).offset(30);
            make.height.mas_equalTo(self.confirmButton);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
            self.titleLabel = view;
        [self.titleLabel tfy_addBadgeWithText:@"3333"];
        [self.titleLabel tfy_setBadgeFlexMode:BadgeViewFlexModeMiddle];
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
    
    UIViewModelSet()
    .backgroundColor(TFY_ColorHexString(@"4e5f6g"))
    .clipRadius(CornerClipTypeBothTop, 10)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
       make.left.equalTo(self.titleLabel);
       make.right.equalTo(self.titleLabel);
       make.top.equalTo(self.textfiled.mas_bottom).offset(20);
       make.height.mas_equalTo(80);
    });
    
    
    TfySY_TabBarController *tabBarVC = (TfySY_TabBarController *)self.tabBarController;
    TfySY_TabBarItem *item = tabBarVC.tfySY_TabBar.currentSelectItem; // 因为已经到这个页面，说明就是当前的选项卡item
    // 设置徽标位置
    TfySY_TabBarConfigModel *itemModel = item.itemModel;
    itemModel.itemBadgeStyle = TfySY_TabBarItemBadgeStyleTopCenter; // 因为是item强引用model，所以两个model的指针相同，可以直接设置
    
    item.badgeLabel.badgeWidth = 15;  // 宽度
    item.badgeLabel.badgeHeight = 15;  // 高度
    item.badge = @"7";
    
}

- (void)btnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.confirmButton.backgroundColor = UIColor.greenColor;
    } else {
        self.confirmButton.backgroundColor = UIColor.yellowColor;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textfiled resignFirstResponder];
}

- (void)timeimageClick {
    [self.navigationItem.leftBarButtonItem tfy_increase];
}

- (void)timeimageClick2 {
    [self.navigationItem.leftBarButtonItem tfy_decrease];
}

@end

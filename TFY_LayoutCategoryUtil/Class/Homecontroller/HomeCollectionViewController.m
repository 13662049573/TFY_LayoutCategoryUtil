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
@property(nonatomic , strong)UILabel *nameLabel,*titleLabel2,*weddingLabel,*pericLabel,*refundLabel;
@property(nonatomic , strong)UIView *backView;
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
    .assignToObjects(^(NSArray * _Nonnull objs) {
//        self.phoneBtn = objs[0];
//        self.weixinBtn = objs[1];
//        self.qqBtn = objs[2];
    })
    .makeTag(1)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(68);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    })
    .part_sencond()
    .text(@"第二个", UIControlStateNormal).textColor(UIColor.redColor, UIControlStateNormal)
    .makeTag(2)
    .addToSuperView(self.view)
    .backgroundColor(UIColor.purpleColor)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    })
    .part_third()
    .text(@"第三个", UIControlStateNormal).textColor(UIColor.redColor, UIControlStateNormal)
    .makeTag(3)
    .backgroundColor(UIColor.blueColor)
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
    .contentInsets(UIEdgeInsetsMake(0, 10, 10, 10))
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
        make.height.mas_equalTo(50);
    });
    
    self.backView.makeChain
    .backgroundColor(UIColor.tfy_randomColor)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
       make.left.equalTo(self.titleLabel);
       make.right.equalTo(self.titleLabel);
       make.top.equalTo(self.textfiled.mas_bottom).offset(20);
       make.height.mas_equalTo(80);
    });
    
    self.backView.conrnerCorner(UIRectCornerTopLeft|UIRectCornerTopRight).conrnerRadius(8).borderColor(UIColor.redColor).borderWidth(5).showVisual();
    
    self.nameLabel.makeChain
    .font([UIFont systemFontOfSize:10 weight:UIFontWeightBold])
    .text(@"0")
    .textAlignment(NSTextAlignmentCenter)
    .cornerRadius(10)
    .masksToBounds(YES)
    .textColor(UIColor.whiteColor)
    .backgroundColor(UIColor.redColor)
    .addToSuperView(self.backView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.backView).offset(50);
        make.centerY.equalTo(self.backView).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    });

    self.refundLabel.makeChain
    .font([UIFont systemFontOfSize:10 weight:UIFontWeightBold])
    .text(@":")
    .textAlignment(NSTextAlignmentCenter)
    .textColor(UIColor.redColor)
    .addToSuperView(self.backView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(0);
        make.centerY.equalTo(self.nameLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(10, 20));
    });

    self.titleLabel2.makeChain
    .font([UIFont systemFontOfSize:10 weight:UIFontWeightBold])
    .text(@"0")
    .cornerRadius(10)
    .textColor(UIColor.whiteColor)
    .backgroundColor(UIColor.redColor)
    .masksToBounds(YES)
    .textAlignment(NSTextAlignmentCenter)
    .addToSuperView(self.backView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.refundLabel.mas_right).offset(0);
        make.centerY.equalTo(self.refundLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    });

    self.weddingLabel.makeChain
    .font([UIFont systemFontOfSize:10 weight:UIFontWeightBold])
    .text(@":")
    .textAlignment(NSTextAlignmentCenter)
    .textColor(UIColor.redColor)
    .addToSuperView(self.backView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.titleLabel2.mas_right).offset(0);
        make.centerY.equalTo(self.titleLabel2.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(10, 20));
    });

    self.pericLabel.makeChain
    .font([UIFont systemFontOfSize:10 weight:UIFontWeightBold])
    .text(@"0")
    .cornerRadius(10)
    .textColor(UIColor.whiteColor)
    .backgroundColor(UIColor.redColor)
    .masksToBounds(YES)
    .textAlignment(NSTextAlignmentCenter)
    .addToSuperView(self.backView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.weddingLabel.mas_right).offset(0);
        make.centerY.equalTo(self.weddingLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    });

    
    TfySY_TabBarController *tabBarVC = (TfySY_TabBarController *)self.tabBarController;
    TfySY_TabBarItem *item = tabBarVC.tfySY_TabBar.currentSelectItem; // 因为已经到这个页面，说明就是当前的选项卡item
    // 设置徽标位置
    TfySY_TabBarConfigModel *itemModel = item.itemModel;
    itemModel.itemBadgeStyle = TfySY_TabBarItemBadgeStyleTopCenter; // 因为是item强引用model，所以两个model的指针相同，可以直接设置
    
    item.badgeLabel.badgeWidth = 15;  // 宽度
    item.badgeLabel.badgeHeight = 15;  // 高度
    item.badge = @"7";
    
    NSDate *fineDate = [NSDate.date tfy_dateByAddingHours:3];
    TFY_Weak(self);
    [TFY_Timer countDownWithStratDate:NSDate.date finishDate:fineDate completeBlock:^(NSInteger day, NSInteger hour, NSInteger minute, NSInteger second) {
        weak_self.nameLabel.text = [NSString stringWithFormat:@"%02ld",hour];
        weak_self.titleLabel2.text = [NSString stringWithFormat:@"%02ld",minute];
        weak_self.pericLabel.text = [NSString stringWithFormat:@"%02ld",second];
    }];
}

- (void)btnClick:(UIButton *)btn {
    [self passwordtologinClick];
    
    NSString *str = nil;
    
    NSDictionary *dict = @{@"ssss":str};
}

- (void)passwordtologinClick {
    TFY_AlertControllerAlertCreate(@"提示", @"是否要注销账户呢？注销会让你在该平台里面所有数据都会清空。不会保留任何数据。")
    .tfy_addCancelAction(@"greenColor", 0)
    .tfy_addDefaultAction(@"yellowColor", 1)
    .tfy_alertMessageAttributeFontWithColor([UIFont systemFontOfSize:14],UIColor.blackColor)
    .tfy_actionTap(^(NSInteger index, UIAlertAction * _Nonnull action) {
        if (index==1) {
            self.confirmButton.backgroundColor = UIColor.yellowColor;
        } else {
            self.confirmButton.backgroundColor = UIColor.greenColor;
        }
    })
    .tfy_showFromViewController(self);
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

- (UIView *)backView {
    if (!_backView) {
        _backView = UIView.new;
    }
    return _backView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = UILabelSet();
        _nameLabel.makeChain
        .textColor(TFY_ColorHexString(@"000000"))
        .textAlignment(NSTextAlignmentLeft);
    }
    return _nameLabel;
}

- (UILabel *)titleLabel2 {
    if (!_titleLabel2) {
        _titleLabel2 = UILabelSet();
        _titleLabel2.makeChain
            .textColor(TFY_ColorHexString(@"000000"))
            .textAlignment(NSTextAlignmentLeft);
    }
    return _titleLabel2;
}

- (UILabel *)weddingLabel {
    if (!_weddingLabel) {
        _weddingLabel = UILabelSet();
        _weddingLabel.makeChain
            .textColor(TFY_ColorHexString(@"000000"))
            .textAlignment(NSTextAlignmentLeft);
    }
    return _weddingLabel;
}

- (UILabel *)pericLabel {
    if (!_pericLabel) {
        _pericLabel = UILabelSet();
        _pericLabel.makeChain
            .textColor(TFY_ColorHexString(@"000000"))
            .textAlignment(NSTextAlignmentLeft);
    }
    return _pericLabel;
}

- (UILabel *)refundLabel {
    if (!_refundLabel) {
        _refundLabel = UILabelSet();
        _refundLabel.makeChain
        .textColor(TFY_ColorHexString(@"000000"))
        .textAlignment(NSTextAlignmentLeft);
    }
    return _refundLabel;
}

@end

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
@end

@implementation HomeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButtonModelSet().backgroundColor(UIColor.orangeColor).text(@"按钮", UIControlStateNormal).font([UIFont systemFontOfSize:15 weight:UIFontWeightBold]).assignTo(^(__kindof UIView * _Nonnull view) {
        self.confirmButton = view;
        
    }).addTarget(self, @selector(btnClick), UIControlEventValueChanged).addToSuperView(self.view).makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(50);
    });
}

- (void)btnClick {
    
}

@end

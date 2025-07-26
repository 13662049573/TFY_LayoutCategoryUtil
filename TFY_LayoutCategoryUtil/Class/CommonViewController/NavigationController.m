//
//  NavigationController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2020/9/2.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController
@synthesize navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationBar.middleButton.makeChain
    .text(self.title, UIControlStateNormal)
    .font(Font(PingFangMedium, 17))
    .textColor(TFY_ColorHexString(@"464646"), UIControlStateNormal);
    
    self.navigationBar.leftButton.makeChain
    .image(TFY_ImageNamed(@"nav_icon_back"), UIControlStateNormal)
    .textColor(TFY_ColorHexString(@"464646"), UIControlStateNormal);
    // Do any additional setup after loading the view.
}

- (void)leftButtonTap:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

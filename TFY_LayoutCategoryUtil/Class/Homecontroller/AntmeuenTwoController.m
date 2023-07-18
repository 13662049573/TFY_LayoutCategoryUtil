//
//  AntmeuenTwoController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2021/1/30.
//  Copyright © 2021 田风有. All rights reserved.
//

#import "AntmeuenTwoController.h"
#import "IndexViewController.h"
@interface AntmeuenTwoController ()
@property(nonatomic , strong)TFY_ImageView *gifImageView;
@end

@implementation AntmeuenTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"gif";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"GIF" style:UIBarButtonItemStylePlain target:self action:@selector(gifImageViewClick:)];
    
    self.gifImageView.makeChain
//    .contentMode(UIViewContentModeScaleAspectFit)
    .backgroundColor(UIColor.blackColor)
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.equalTo(self.view).offset(0);
    });
}

- (void)gifImageViewClick:(UIBarButtonItem *)item {
    self.gifImageView.image = [UIImage tfy_animatedGifName:@"redpacket_24" scale:24];
}

- (TFY_ImageView *)gifImageView {
    if (!_gifImageView) {
        _gifImageView = TFY_ImageView.new;
    }
    return _gifImageView;
}

@end

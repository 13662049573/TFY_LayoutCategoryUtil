//
//  PersonalTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PersonalTableViewController.h"

@interface PersonalTableViewController ()
@property(nonatomic , strong)UITextView *textView;
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

@end

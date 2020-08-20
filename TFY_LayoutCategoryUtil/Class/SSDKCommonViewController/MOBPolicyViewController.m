//
//  MOBPolicyViewController.m
//  ShareSDKDemo
//
//  Setd by maxl on 2020/1/14.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPolicyViewController.h"
#import "MOBPolicyWebViewController.h"

@interface MOBPolicyViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIButton * cancelButton;

@property (nonatomic, strong) UIButton * confirmButton;

@property (nonatomic, strong) UITextView *contentTextView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *recentUpdateDate;

@property (nonatomic, strong) UILabel *effectDate;

@end

@implementation MOBPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self setupUI];
    [self loadData];
    
}

- (void)setupUI{
    
    UIViewModelSet()
    .backgroundColor([UIColor whiteColor])
    .addToSuperView(self.view)
    .cornerRadius(17)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        self.contentView = view;
    });
    
    UILabelModelSet()
    .multiple(3)
    .assignToObjects(^(NSArray<UILabel *> * _Nonnull objs) {
       self.titleLabel = objs[0];
        self.recentUpdateDate = objs[1];
        self.effectDate = objs[2];
    })
    .addToSuperView(self.contentView)
    .textAlignment(NSTextAlignmentCenter)
    .part_first()
    .font(Font(PingFangSemibold, 17))
    .textColor(TFY_ColorHexString(@"000000"))
    .text(@"TFY_Link Demo隐私条款")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_offset(20);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    })
    .part_range(NSMakeRange(1, 2))
    .font(Font(PingFangLight, 13))
    .textColor(TFY_ColorHexAlpha(@"000000", 0.45))
    .textAlignment(NSTextAlignmentCenter)
    .part_sencond()
    .text(@"最近更新日期：2019年12月13日")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(15);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    })
    .part_third()
    .text(@"版本生效日期：2019年12月20日")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.recentUpdateDate.mas_bottom).mas_offset(1);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    });
    
    UIButtonModelSet()
    .multiple(2)
    .font(Font(PingFangReguler, 15))
    .cornerRadius(20)
    .masksToBounds(YES)
    .addToSuperView(self.contentView)
    .part_first()
    .textColor(TFY_ColorHexString(@"000000"), UIControlStateNormal)
    .backgroundColor(TFY_ColorHexString(@"#ECECEC"))
    .addTarget(self, @selector(cancelClick), UIControlEventTouchUpInside)
    .text(@"取消", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.right.equalTo(self.contentView.mas_centerX).offset(-9.5);
    })
    .part_sencond()
    .textColor(TFY_ColorHexString(@"ffffff"), UIControlStateNormal)
    .backgroundColor(TFY_ColorHexString(@"#FF7800"))
    .addTarget(self, @selector(confirmClick), UIControlEventTouchUpInside)
    .text(@"同意", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.left.equalTo(self.contentView.mas_centerX).offset(9.5);
    })
    .assignToObjects(^(NSArray<UIButton *> * _Nonnull objs) {
        self.cancelButton = objs[0];
        self.confirmButton = objs[1];
    });
    
    UITextViewModelSet()
    .textColor(TFY_ColorHexString(@"000000"))
    .font(Font(PingFangReguler, 14))
    .addToSuperView(self.contentView)
    .delegate(self)
    .editable(NO)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        self.contentTextView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(self.effectDate.mas_bottom).offset(10);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.bottom.equalTo(self.cancelButton.mas_top).offset(-20);
    });
    
}

- (void)viewSafeAreaInsetsChanged:(UIEdgeInsets)edges{
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30 + edges.left);
        make.right.mas_offset(-30 - edges.right);
        make.top.mas_offset(100 + edges.top);
        make.bottom.mas_offset(- 120 - edges.bottom);
    }];
}

- (void)loadData{
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"    欢迎您使用TFY_Tech提供的演示DEMO，TFY_Link提供了一步实现移动端深度链接的功能，不仅极大地方便了您的终端用户的服务体验，更为您实时了解终端用户的数据进行了统计分析。为了对您的TFY_Link功能进行来源追溯并帮助您更精细化运营，我们将依据TFY_Tech的《隐私政策》来帮助你了解我们需要收集哪些数据。\n\n\n详情点击:" attributes:@{
        NSFontAttributeName :Font(PingFangReguler, 13),
        NSForegroundColorAttributeName:TFY_ColorHexString(@"000000")
    }];
    
    _contentTextView.linkTextAttributes = @{NSForegroundColorAttributeName:TFY_ColorHexString(@"FF7800")};
   
}


- (void)cancelClick{
    if (self.policyStaus) {
        self.policyStaus(NO);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)confirmClick{
    if (self.policyStaus) {
        self.policyStaus(YES);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - UITextViewDelegate -

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    MOBPolicyWebViewController *vc = [MOBPolicyWebViewController new];
    vc.title = @"《MobTech隐私政策》";
    vc.extraInfo[@"url"] = URL;
    vc.showAnimated(YES).push();
    return NO;
}


@end

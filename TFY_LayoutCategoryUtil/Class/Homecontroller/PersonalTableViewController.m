//
//  PersonalTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PersonalTableViewController.h"
#import <StoreKit/StoreKit.h>

@interface PersonalTableViewController ()<SKStoreProductViewControllerDelegate,TextTagCollectionViewDelegate>
@property(nonatomic , strong)UITextView *textView;
@property(nonatomic , strong)UIButton *buttom;
@property (strong, nonatomic)TFY_TextTagCollectionView *tagsView;
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
        make.bottom.equalTo(self.view).offset(-TFY_kBottomBarHeight());
    });

    NSArray *tags = @[@"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views",
                      @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views"];
    
    
    NSUInteger location = 0;
    NSUInteger length = 8;
    
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.24 green:0.72 blue:0.94 alpha:1.00]
                             attachment:@{@"key": @"1"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.30 green:0.72 blue:0.53 alpha:1.00]
                             attachment:@{@"key": @"2"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.97 green:0.64 blue:0.27 alpha:1.00]
                             attachment:@{@"key": @"3"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.73 green:0.91 blue:0.41 alpha:1.00]
                             attachment:@{@"key": @"4"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.35 green:0.35 blue:0.36 alpha:1.00]
                             attachment:@{@"key": @"5"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:1.00 green:0.41 blue:0.42 alpha:1.00]
                             attachment:@{@"key": @"6"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.50 green:0.86 blue:0.90 alpha:1.00]
                             attachment:@{@"key": @"7"}];
    
    location += length;
    [self.class addBatchTagsWithStrings:tags
                                  range:NSMakeRange(location, length)
                              toTagView:_tagsView
                        backgroundColor:[UIColor colorWithRed:0.33 green:0.23 blue:0.34 alpha:1.00]
                             attachment:@{@"key": @"8"}];
    
    [_tagsView reload];
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

- (TFY_TextTagCollectionView *)tagsView {
    if (!_tagsView) {
        _tagsView = TFY_TextTagCollectionView.new;
        _tagsView.alignment = TagCollectionAlignmentFillByExpandingWidth;
        _tagsView.delegate = self;
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

- (void)textTagCollectionView:(TFY_TextTagCollectionView *)textTagCollectionView
                    didTapTag:(TFY_TextTag *)tag
                      atIndex:(NSUInteger)index {
    NSLog(@"Did tap: %@, config extra: %@", tag.content, tag.attachment);
}

+ (void)addBatchTagsWithStrings:(NSArray<NSString *> *)strings
                          range:(NSRange)range
                      toTagView:(TFY_TextTagCollectionView *)tagView
                backgroundColor:(UIColor *)backgroundColor
                     attachment:(id)attachment {
    
    static TFY_TextTagStyle *defaultStyle = nil;
    static TFY_TextTagStringContent *defaultContent = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultStyle = [TFY_TextTagStyle new];
        defaultStyle.backgroundColor = [UIColor whiteColor];
        defaultStyle.borderColor = [UIColor whiteColor];
        defaultStyle.borderWidth = 1;
        defaultStyle.cornerRadius = 4;
        defaultStyle.extraSpace = CGSizeMake(8, 8);
        defaultStyle.shadowColor = [UIColor blackColor];
        defaultStyle.shadowOpacity = 0.3;
        defaultStyle.shadowRadius = 2;
        defaultStyle.shadowOffset = CGSizeMake(1, 1);
        
        defaultContent = [TFY_TextTagStringContent new];
        defaultContent.textFont = [UIFont systemFontOfSize:20];
        defaultContent.textColor = [UIColor whiteColor];
    });
    
    for (NSString *text in [strings subarrayWithRange:range]) {
        TFY_TextTag *tag = [TFY_TextTag new];
        
//        tag.enableAutoDetectAccessibility = YES;
        
        tag.isAccessibilityElement = YES;
        tag.accessibilityLabel = text;
        tag.accessibilityIdentifier = [NSString stringWithFormat:@"identifier: %@", text];
        tag.accessibilityHint = [NSString stringWithFormat:@"hint: %@", text];
        tag.accessibilityValue = [NSString stringWithFormat:@"value: %@", text];
        
        TFY_TextTagStyle *style = [defaultStyle copy];
        style.backgroundColor = backgroundColor;
        
        TFY_TextTagStyle *selectedStyle = [style copy];
        selectedStyle.backgroundColor = [self.class getRevertColor:style.backgroundColor];
        selectedStyle.borderColor = [UIColor blackColor];
        selectedStyle.cornerRadius = 8;
        selectedStyle.shadowColor = [UIColor greenColor];
        
        TFY_TextTagStringContent *content = [defaultContent copy];
        content.text = text;
        
        tag.style = style;
        tag.selectedStyle = selectedStyle;
        tag.content = content;
        tag.attachment = attachment;
        [tagView addTag:tag];
    }
    
    [tagView updateTagAtIndex:range.location + arc4random_uniform((uint32_t)range.length) selected:YES];
}

+ (UIColor *)getRevertColor:(UIColor *)color {
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    return [UIColor colorWithRed:1 - red green:1 - green blue:1 - blue alpha:1];
}


@end

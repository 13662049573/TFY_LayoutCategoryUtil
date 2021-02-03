//
//  AntmeuenTwoController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2021/1/30.
//  Copyright © 2021 田风有. All rights reserved.
//

#import "AntmeuenTwoController.h"

@interface AntmeuenTwoController ()

@end

@implementation AntmeuenTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scroll.tfy_edgeFillColor = UIColor.orangeColor;
    [scroll tfy_addEdgeEffect];
    [self.view addSubview:scroll];
    
    /// 圆角 + 阴影
    TFY_ShadowView *v1 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(50, 20, 100, 100)];
    v1.backgroundColor = [UIColor whiteColor];
    [v1 shaodw];
    [v1 cornerRadius:10];
    UILabel *label1 = [[UILabel alloc] initWithFrame:v1.bounds];
    label1.text = @"四周阴影\n四周圆角";
    label1.numberOfLines = 2;
    label1.textColor = [UIColor darkGrayColor];
    label1.font = [UIFont systemFontOfSize:13];
    label1.textAlignment = NSTextAlignmentCenter;
    [v1 addSubview:label1];
    [scroll addSubview:v1];
    
    /// 单个圆角 + 阴影
    TFY_ShadowView *v2 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(200, 20, 100, 100)];
    v2.backgroundColor = [UIColor whiteColor];
    [v2 shaodwRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(ShadowSideAllSides)];
    [v2 cornerRadius:10 byRoundingCorners:(UIRectCornerTopLeft)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:v2.bounds];
    label2.text = @"四周阴影\n单个圆角";
    label2.numberOfLines = 2;
    label2.textColor = [UIColor darkGrayColor];
    label2.font = [UIFont systemFontOfSize:13];
    label2.textAlignment = NSTextAlignmentCenter;
    [v2 addSubview:label2];
    [scroll addSubview:v2];
    
    /// 上下阴影 + 单个圆角
    TFY_ShadowView *v3 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(50, 160, 100, 100)];
    v3.backgroundColor = [UIColor whiteColor];
    [v3 verticalShaodwRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeZero];
    [v3 cornerRadius:10 byRoundingCorners:(UIRectCornerTopRight)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:v2.bounds];
    label3.text = @"上下阴影\n单个圆角";
    label3.numberOfLines = 2;
    label3.textColor = [UIColor darkGrayColor];
    label3.font = [UIFont systemFontOfSize:13];
    label3.textAlignment = NSTextAlignmentCenter;
    [v3 addSubview:label3];
    [scroll addSubview:v3];
    
    /// 单边阴影 + 单个圆角
    TFY_ShadowView *v4 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(200, 160, 100, 100)];
    v4.backgroundColor = [UIColor whiteColor];
    [v4 shaodwRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(ShadowSideRight)];
    [v4 cornerRadius:10 byRoundingCorners:(UIRectCornerBottomLeft)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:v2.bounds];
    label4.text = @"单边阴影\n单个圆角";
    label4.numberOfLines = 2;
    label4.textColor = [UIColor darkGrayColor];
    label4.font = [UIFont systemFontOfSize:13];
    label4.textAlignment = NSTextAlignmentCenter;
    [v4 addSubview:label4];
    [scroll addSubview:v4];
    
    /// 上边阴影 + 上边圆角
    TFY_ShadowView *v5 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    v5.backgroundColor = [UIColor whiteColor];
    [v5 shaodwRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(ShadowSideTop)];
    [v5 cornerRadius:10 byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)];
    UILabel *label5 = [[UILabel alloc] initWithFrame:v2.bounds];
    label5.text = @"上边阴影\n上边圆角";
    label5.numberOfLines = 2;
    label5.textColor = [UIColor darkGrayColor];
    label5.font = [UIFont systemFontOfSize:13];
    label5.textAlignment = NSTextAlignmentCenter;
    [v5 addSubview:label5];
    [scroll addSubview:v5];
    
    /// 下边阴影 + 下边圆角
    TFY_ShadowView *v6 = [[TFY_ShadowView alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    v6.backgroundColor = [UIColor whiteColor];
    [v6 shaodwRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(ShadowSideBottom)];
    [v6 cornerRadius:10 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)];
    UILabel *label6 = [[UILabel alloc] initWithFrame:v2.bounds];
    label6.text = @"下边阴影\n下边圆角";
    label6.numberOfLines = 2;
    label6.textColor = [UIColor darkGrayColor];
    label6.font = [UIFont systemFontOfSize:13];
    label6.textAlignment = NSTextAlignmentCenter;
    [v6 addSubview:label6];
    [scroll addSubview:v6];
    
    CGFloat h = v6.frame.origin.y + 200 < self.view.bounds.size.height ? self.view.bounds.size.height+1 : v6.frame.origin.y + 200;
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width, h);
    
    
    CGFloat kViewHeight = 200;
    UIView *showView = [[UIView alloc] initWithFrame:(CGRectMake(0, self.view.frame.size.height-kViewHeight, self.view.frame.size.width, kViewHeight))];
    showView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:showView];
    
    CGFloat kRadian = -35;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0, kRadian)];
    [bezierPath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width, kRadian) controlPoint:CGPointMake(self.view.frame.size.width/2, -kRadian)];
    [bezierPath addLineToPoint: CGPointMake(self.view.frame.size.width, showView.frame.size.height)];
    [bezierPath addLineToPoint: CGPointMake(0, showView.frame.size.height)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.strokeColor = UIColor.clearColor.CGColor;
    layer.fillColor = UIColor.whiteColor.CGColor;
    layer.cornerRadius = 3.0;
    layer.masksToBounds = NO;
    layer.shadowOffset = CGSizeMake(-5, -5); //(0,0)时是四周都有阴影
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOpacity = 0.1;
    [showView.layer addSublayer:layer];
}


@end

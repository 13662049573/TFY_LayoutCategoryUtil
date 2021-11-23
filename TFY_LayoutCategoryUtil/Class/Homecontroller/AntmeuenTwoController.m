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

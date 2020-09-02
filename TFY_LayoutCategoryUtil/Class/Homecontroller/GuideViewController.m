//
//  GuideViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "GuideViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
@interface GuideViewController ()<UIScrollViewDelegate>
TFY_PROPERTY_OBJECT_STRONG(UIPageControl, pageControl);
TFY_PROPERTY_NSArray(imageNames);
TFY_PROPERTY_NSArray(titles);
TFY_PROPERTY_NSArray(contents);
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.imageNames = @[@"yd_1", @"yd_3", @"yd_3"];
       
    self.titles = @[@"场景还原", @"无码邀请", @"关系匹配"];
       
    self.contents = @[@"Web端打开页面场景，可直达App端指定内页", @"告别邀请码，自动关联邀请关系，自动统计相关值", @"自带社交关系，智能匹配好友，提高留存率"];
       
    [self createGuideScrollView];
}

+ (BOOL)isFirstRun
{
    static NSString *const MLDAlreadyRun = @"AlreadyRun";
    
    BOOL res = [[[NSUserDefaults standardUserDefaults] objectForKey:MLDAlreadyRun] boolValue];
    if (!res)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:MLDAlreadyRun];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    return !res;
}

- (void)createGuideScrollView
{
    UIScrollView *guideScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    guideScrollView.bounces = NO;
    guideScrollView.pagingEnabled = YES;
    guideScrollView.showsVerticalScrollIndicator = NO;
    guideScrollView.showsHorizontalScrollIndicator = NO;
    
    guideScrollView.delegate = self;
    
    NSInteger imagesCount = self.imageNames.count;
    
    guideScrollView.contentSize = CGSizeMake(TFY_Width_W() * imagesCount, TFY_Height_H());
    
    
    CGPoint viewCenter = self.view.center;
    
    for (int i = 0; i < imagesCount; i++)
    {
        CALayer *imageLayer = [CALayer layer];
        imageLayer.contents = (__bridge id)[UIImage imageNamed:self.imageNames[i]].CGImage;
        imageLayer.contentsGravity = kCAGravityResizeAspect;
        imageLayer.bounds = CGRectMake(0, 0, TFY_Width_W() * 0.8, TFY_Height_H() * 0.8);
        
        imageLayer.position = CGPointMake(viewCenter.x + TFY_Width_W() * i, viewCenter.y - TFY_Height_H() * 0.1);
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = self.titles[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabel.bounds = CGRectMake(0, 0, TFY_Width_W(), TFY_Height_H() * 0.2);
        titleLabel.center = CGPointMake(viewCenter.x + TFY_Width_W() * i, viewCenter.y + TFY_Height_H() * 0.23);
        
        titleLabel.font = Font(PingFangSemibold, 27);
        titleLabel.textColor = [UIColor colorWithRed:23/255.0 green:25/255.0 blue:34/255.0 alpha:1.0];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.text = self.contents[i];
        
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.numberOfLines = 0;
        
        contentLabel.bounds = CGRectMake(0, 0, TFY_Width_W() * 0.6, TFY_Height_H() * 0.2);
        contentLabel.center = CGPointMake(viewCenter.x + TFY_Width_W() * i, viewCenter.y + TFY_Height_H() * 0.3);
        
        contentLabel.font = Font(PingFangReguler, 15);
        contentLabel.textColor = [UIColor colorWithRed:23/255.0 green:25/255.0 blue:34/255.0 alpha:1.0];
        
        UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [skipBtn addTarget:self action:@selector(enterToMainViewController) forControlEvents:UIControlEventTouchUpInside];

        if (i < imagesCount - 1)
        {
            skipBtn.frame = CGRectMake(TFY_Width_W() * (i + 1) - 90, TFY_kBottomBarHeight(), 65, 28);
            
            [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
            [skipBtn setTitleColor:[UIColor colorWithRed:48/255.0 green:79/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
            
            skipBtn.layer.masksToBounds = YES;
            skipBtn.layer.cornerRadius = 14;
            
            skipBtn.layer.borderWidth = 1;
            skipBtn.layer.borderColor = [UIColor colorWithRed:48/255.0 green:79/255.0 blue:255/255.0 alpha:1.0].CGColor;
        }
        else
        {
            skipBtn.bounds = CGRectMake(0, 0, TFY_Width_W() * 0.8, 50);
            
            skipBtn.center = CGPointMake(viewCenter.x + TFY_Width_W() * i, TFY_Height_H() - 50);
            
            [skipBtn setTitle:@"进入DEMO" forState:UIControlStateNormal];
            [skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            skipBtn.backgroundColor = [UIColor colorWithRed:50/255.0 green:102/255.0 blue:255/255.0 alpha:1.0];
            
            skipBtn.layer.masksToBounds = YES;
            skipBtn.layer.cornerRadius = 25;
        }
        
        [guideScrollView.layer addSublayer:imageLayer];
        
        [guideScrollView addSubview:titleLabel];
        
        [guideScrollView addSubview:contentLabel];
        
        [guideScrollView addSubview:skipBtn];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, TFY_Width_W() / 2, 30)];
    self.pageControl.center = CGPointMake(viewCenter.x, TFY_Height_H() - 90);
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = imagesCount;
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:236/255.0 green:239/255.0 blue:241/255.0 alpha:1.0];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:156/255.0 green:165/255.0 blue:183/255.0 alpha:1.0];
    
    [self.view addSubview:guideScrollView];
    [self.view addSubview:self.pageControl];
}

- (void)enterToMainViewController
{
   
    [TFY_ScenePackageTools defaultPackage].window.rootViewController = [[MainViewController alloc] init];
    
    CATransition *animation = [CATransition animation];
    
    animation.duration = 2;
    
    animation.type = kCATransitionReveal;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    [[TFY_ScenePackageTools defaultPackage].window.layer addAnimation:animation forKey:nil];
    
    [[TFY_ScenePackageTools defaultPackage].window makeKeyAndVisible];
}

#pragma mark - scrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / TFY_Width_W();
}


@end

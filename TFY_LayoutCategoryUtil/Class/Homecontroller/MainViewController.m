//
//  MainViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "MainViewController.h"
#import "HomeCollectionViewController.h"
#import "PersonalTableViewController.h"
#import "AntmeuenTwoController.h"
@interface MainViewController ()<TfySY_TabBarDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子VC
    [self addChildViewControllers];

}

- (void)addChildViewControllers{
    // 创建选项卡的数据 想怎么写看自己，这块我就写笨点了
    NSArray <NSDictionary *>*VCArray =
    @[@{@"vc":[HomeCollectionViewController new],@"normalImg":@"home",@"selectImg":@"home2",@"itemTitle":@"首页"},
      @{@"vc":[PersonalTableViewController new],@"normalImg":@"wd_1",@"selectImg":@"wd_2",@"itemTitle":@"我的"},
      @{@"vc":[AntmeuenTwoController new],@"normalImg":@"sy_1",@"selectImg":@"sy_2",@"itemTitle":@"展示"}];
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TfySY_TabBarConfigModel *model = [TfySY_TabBarConfigModel new];
        model.itemTitle = [obj objectForKey:@"itemTitle"];
        model.selectImageName = [obj objectForKey:@"selectImg"];
        model.normalImageName = [obj objectForKey:@"normalImg"];
        model.selectColor = [UIColor orangeColor];
        UIViewController *vc = [obj objectForKey:@"vc"];
        TFY_NavigationController *nav = [[TFY_NavigationController alloc] initWithRootViewController:vc];
        [tabBarVCs addObject:nav];
        [tabBarConfs addObject:model];
    }];
    self.ControllerArray = tabBarVCs;
    self.tfySY_TabBar = [[TfySY_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    self.tfySY_TabBar.delegate = self;
    [self.tabBar addSubview:self.tfySY_TabBar];
    
}
// 9.实现代理，如下：
- (void)TfySY_TabBar:(TfySY_TabBar *)tabbar selectIndex:(NSInteger)index{
    [self setSelectedIndex:index];
}
@end

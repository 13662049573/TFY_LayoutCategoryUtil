//
//  CommonViewController.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2020/9/2.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonNavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

//------------------tableView
@interface CommonTableViewModel : NSObject
//tableView的类
@property (nonatomic, copy) NSString *  clas;
//tableView的样式
@property (nonatomic, assign) UITableViewStyle  style;
//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;
//详细设置tableView属性
@property (nonatomic, copy) void (^tableView) (UITableView *tableView);
@end

//协议
@protocol CommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@optional
//此方法不需要实现，可直接调用
-  (CommonTableViewModel *)tableViewModel;

//设置父视图
- (UIView *)comonTableViewSuperView;
//设置一些属性
- (void)commonTableViewModel:(CommonTableViewModel *)model;

@end


//------------------collectionView

@interface CommonCollectionViewModel : NSObject

@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

@property (nonatomic, copy) void (^layoutSetting) (UICollectionViewFlowLayout *layout);

//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;

@end

@protocol CommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;

@optional

//此方法不需要实现，可直接调用
- (CommonCollectionViewModel *)collectionViewModel;

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(CommonCollectionViewModel *)model;

@end

@protocol CommonNavigationProtocol <CommonNavigationBarDelegate>

@property (nonatomic, strong) CommonNavigationBar * navigationBar;

@optional

- (UIView *)commonNavigationViewSuperView;

@end


typedef NS_ENUM(NSInteger, AppOrientation) {
    AppOrientationProtrait = 0,//竖向
    AppOrientationLeft = 1,
    AppOrientationWithOutDown = 2 ,//不向下
    AppOrientationLandscape = 3//横向
};


@protocol CommonViewControllerProtocol <NSObject>


@optional

//安全区域变化
- (void)viewSafeAreaInsetsChanged:(UIEdgeInsets)edges;

@end

@interface CommonViewController : UIViewController<CommonViewControllerProtocol>

/**
 是否可以左滑
 */
@property (nonatomic, assign) BOOL swipeCanPop;

/**
 方向
 */
- (void)orientationLand:(AppOrientation)orientation;

/**
 额外的信息
 */
@property (nonatomic, strong) NSMutableDictionary * extraInfo;

@end

NS_ASSUME_NONNULL_END

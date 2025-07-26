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
TFY_PROPERTY_NSString(clas);
//tableView的样式
TFY_PROPERTY_OBJECT_ASSIGN(UITableViewStyle, style);
//是否自定义布局
TFY_PROPERTY_BOOL(isCustomLayout);
//详细设置tableView属性
TFY_PROPERTY_CHAIN_BLOCK(tableView,UITableView *tableView);
@end

//协议
@protocol CommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>
TFY_PROPERTY_OBJECT_STRONG(UITableView, tableView);

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
TFY_PROPERTY_OBJECT_STRONG(UICollectionViewFlowLayout, layout);
TFY_PROPERTY_CHAIN_BLOCK(layoutSetting,UICollectionViewFlowLayout *layout);
TFY_PROPERTY_BOOL(isCustomLayout);//是否自定义布局
@end

@protocol CommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
TFY_PROPERTY_OBJECT_STRONG(UICollectionView, collectionView);

@optional

//此方法不需要实现，可直接调用
- (CommonCollectionViewModel *)collectionViewModel;

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(CommonCollectionViewModel *)model;

@end

@protocol CommonNavigationProtocol <CommonNavigationBarDelegate>
TFY_PROPERTY_OBJECT_STRONG(CommonNavigationBar, navigationBar);

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
TFY_PROPERTY_BOOL(swipeCanPop);
/**
 方向
 */
- (void)orientationLand:(AppOrientation)orientation;

/**
 额外的信息
 */
TFY_PROPERTY_NSMutableDictionary(extraInfo);

@end

NS_ASSUME_NONNULL_END

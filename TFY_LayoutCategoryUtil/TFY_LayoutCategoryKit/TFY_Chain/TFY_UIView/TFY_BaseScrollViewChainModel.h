//
//  TFY_BaseScrollViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TFY_BaseScrollViewChainModel<__covariant ObjectType> : TFY_BaseViewChainModel<ObjectType>
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentSize) (CGSize);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffset) (CGPoint);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentInset) (UIEdgeInsets);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bounces) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceVertical) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceHorizontal) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ pagingEnabled) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollEnabled) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ showsHorizontalScrollIndicator) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ showsVerticalScrollIndicator) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollsToTop) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ indicatorStyle) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollIndicatorInsets) (UIEdgeInsets);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ directionalLockEnabled) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ minimumZoomScale) (CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ maximumZoomScale) (CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ zoomScale) (CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetAnimated)(CGPoint, BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetToVisible)(CGRect, BOOL);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <UIScrollViewDelegate>);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ adJustedContentIOS11)(void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ automaticallyAdjustsScrollIndicatorInsets) (BOOL) API_AVAILABLE(ios(13.0));
@end

NS_ASSUME_NONNULL_END

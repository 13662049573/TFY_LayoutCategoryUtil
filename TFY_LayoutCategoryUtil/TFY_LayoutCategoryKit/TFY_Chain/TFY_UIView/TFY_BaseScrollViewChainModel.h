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
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentSize) (CGSize contentSize);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffset) (CGPoint contentOffset);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentInset) (UIEdgeInsets contentInset);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bounces) (BOOL bounces);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceVertical) (BOOL alwaysBounceVertical);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceHorizontal) (BOOL alwaysBounceHorizontal);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ pagingEnabled) (BOOL pagingEnabled);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollEnabled) (BOOL scrollEnabled);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ showsHorizontalScrollIndicator) (BOOL showsHorizontalScrollIndicator);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ showsVerticalScrollIndicator) (BOOL showsVerticalScrollIndicator);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollsToTop) (BOOL scrollsToTop);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ indicatorStyle) (BOOL indicatorStyle);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ scrollIndicatorInsets) (UIEdgeInsets scrollIndicatorInsets);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ directionalLockEnabled) (BOOL directionalLockEnabled);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ minimumZoomScale) (CGFloat minimumZoomScale);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ maximumZoomScale) (CGFloat maximumZoomScale);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ zoomScale) (CGFloat zoomScale);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetAnimated)(CGPoint point, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetToVisible)(CGRect rect, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <UIScrollViewDelegate> delegate);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ adJustedContentIOS11)(void);
@end

NS_ASSUME_NONNULL_END

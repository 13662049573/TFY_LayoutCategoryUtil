//
//  TFY_LongPressGestureChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_LongPressGestureChainModel;


@interface TFY_LongPressGestureChainModel : TFY_BaseGestureChainModel<TFY_LongPressGestureChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_LongPressGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);

TFY_CATEGORY_CHAIN_PROPERTY TFY_LongPressGestureChainModel * (^ minimumPressDuration) (NSTimeInterval minimumPressDuration);

TFY_CATEGORY_CHAIN_PROPERTY TFY_LongPressGestureChainModel * (^ allowableMovement) (CGFloat allowableMovement);

@end

TFY_CATEGORY_EXINTERFACE(UILongPressGestureRecognizer, TFY_LongPressGestureChainModel)

NS_ASSUME_NONNULL_END

//
//  TFY_SliderViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_SliderViewChainModel;
@interface TFY_SliderViewChainModel : TFY_BaseControlChainModel<TFY_SliderViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ value) (float);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumValue) (float);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumValue) (float);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumValueImage) (UIImage *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumValueImage) (UIImage *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ continuous) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumTrackTintColor) (UIColor *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumTrackTintColor) ( UIColor *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ thumbTintColor) (UIColor *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setThumbImage) (UIImage *,UIControlState);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setMinimumTrackImage) (UIImage *,UIControlState);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setMaximumTrackImage) (UIImage *,UIControlState);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setValueAnimated) (float, BOOL);
@end

TFY_CATEGORY_EXINTERFACE(UISlider, TFY_SliderViewChainModel)

NS_ASSUME_NONNULL_END

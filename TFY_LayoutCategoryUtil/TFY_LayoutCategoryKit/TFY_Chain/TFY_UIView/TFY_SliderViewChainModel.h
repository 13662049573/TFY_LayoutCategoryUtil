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

TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ value) (float value);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumValue) (float minimumValue);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumValue) (float maximumValue);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumValueImage) (UIImage * minimumValueImage);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumValueImage) (UIImage * maximumValueImage);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ continuous) (BOOL continuous);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ minimumTrackTintColor) (UIColor * minimumTrackTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ maximumTrackTintColor) ( UIColor *maximumTrackTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ thumbTintColor) (UIColor * thumbTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setThumbImage) (UIImage *image,UIControlState status);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setMinimumTrackImage) (UIImage *image,UIControlState status);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setMaximumTrackImage) (UIImage *image,UIControlState status);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SliderViewChainModel * (^ setValueAnimated) (float value, BOOL animated);
@end

TFY_CATEGORY_EXINTERFACE(UISlider, TFY_SliderViewChainModel)

NS_ASSUME_NONNULL_END

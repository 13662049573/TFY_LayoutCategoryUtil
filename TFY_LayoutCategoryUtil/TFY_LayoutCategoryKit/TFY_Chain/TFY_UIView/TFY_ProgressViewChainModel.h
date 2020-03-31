//
//  TFY_ProgressViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_ProgressViewChainModel;
@interface TFY_ProgressViewChainModel : TFY_BaseViewChainModel<TFY_ProgressViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ progressViewStyle) (UIProgressViewStyle progressViewStyle);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ progress) (float progress);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ progressTintColor) (UIColor* progressTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ trackTintColor) (UIColor* trackTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ progressImage) (UIImage* progressImage);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ trackImage) (UIImage* trackImage);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ observedProgress) (NSProgress * observedProgress) API_AVAILABLE(ios(9.0));
TFY_CATEGORY_CHAIN_PROPERTY TFY_ProgressViewChainModel * (^ setProgressAnimated) (float progress, BOOL animated);
@end

TFY_CATEGORY_EXINTERFACE(UIProgressView, TFY_ProgressViewChainModel)

NS_ASSUME_NONNULL_END

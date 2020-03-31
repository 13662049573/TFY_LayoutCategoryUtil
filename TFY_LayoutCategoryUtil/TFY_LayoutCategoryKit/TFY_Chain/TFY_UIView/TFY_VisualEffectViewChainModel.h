//
//  TFY_VisualEffectViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_VisualEffectViewChainModel;
@interface TFY_VisualEffectViewChainModel : TFY_BaseViewChainModel<TFY_VisualEffectViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_VisualEffectViewChainModel * (^ effect) (UIVisualEffect * effect);
@end

TFY_CATEGORY_EXINTERFACE(UIVisualEffectView, TFY_VisualEffectViewChainModel)

NS_ASSUME_NONNULL_END

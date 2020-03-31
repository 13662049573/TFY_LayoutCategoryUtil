//
//  TFY_EmiiterLayerChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_EmiiterLayerChainModel;
@interface TFY_EmiiterLayerChainModel : TFY_BaseLayerChainModel<TFY_EmiiterLayerChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterCells) (NSArray<CAEmitterCell *> * emitterCells);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ birthRate) (float birthRate);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ lifetime) (float lifetime);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterPosition) (CGPoint emitterPosition);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterZPosition) (CGFloat emitterZPosition);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterSize) (CGSize emitterSize);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterDepth) (CGFloat emitterDepth);

#ifdef __IPHONE_12_0
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterShape) (CAEmitterLayerEmitterShape emitterShape);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ emitterMode) (CAEmitterLayerEmitterMode emitterMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ renderMode) (CAEmitterLayerRenderMode renderMode);

#endif
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ preservesDepth) (BOOL preservesDepth);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ velocity) (float velocity);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ scale) (float scale);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ spin) (float spin);
TFY_CATEGORY_CHAIN_PROPERTY TFY_EmiiterLayerChainModel * (^ seed) (unsigned int seed);

@end

TFY_CATEGORY_EXINTERFACE(CAEmitterLayer, TFY_EmiiterLayerChainModel)

NS_ASSUME_NONNULL_END

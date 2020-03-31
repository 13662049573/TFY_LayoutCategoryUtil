//
//  TFY_ShaperLayerChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_ShaperLayerChainModel;
@interface TFY_ShaperLayerChainModel : TFY_BaseLayerChainModel<TFY_ShaperLayerChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ path) (CGPathRef path);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ fillColor) (CGColorRef fillColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ fillRule) (CAShapeLayerFillRule fillRule);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ strokeColor) (CGColorRef strokeColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ strokeStart) (CGFloat strokeStart);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ strokeEnd) (CGFloat strokeEnd);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ lineWidth) (CGFloat lineWidth);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ miterLimit) (CGFloat miterLimit);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ lineCap) (CAShapeLayerLineCap lineCap);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ lineJoin) (CAShapeLayerLineJoin lineJoin);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ lineDashPhase) (CGFloat lineDashPhase);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ShaperLayerChainModel * (^ lineDashPattern) (NSArray<NSNumber *> * lineDashPattern);
@end

TFY_CATEGORY_EXINTERFACE(CAShapeLayer, TFY_ShaperLayerChainModel)

NS_ASSUME_NONNULL_END

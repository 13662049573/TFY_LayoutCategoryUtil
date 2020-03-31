//
//  TFY_TextLayerChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_TextLayerChainModel;
@interface TFY_TextLayerChainModel : TFY_BaseLayerChainModel<TFY_TextLayerChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ string) (id string);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ font) (CFTypeRef font);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ fontSize) (CGFloat fontSize);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ foregroundColor) (CGColorRef foregroundColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ wrapped) (BOOL wrapped);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ truncationMode) (CATextLayerTruncationMode truncationMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ alignmentMode) (CATextLayerAlignmentMode alignmentMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextLayerChainModel * (^ allowsFontSubpixelQuantization) (BOOL allowsFontSubpixelQuantization);

@end
TFY_CATEGORY_EXINTERFACE(CATextLayer, TFY_TextLayerChainModel)

NS_ASSUME_NONNULL_END

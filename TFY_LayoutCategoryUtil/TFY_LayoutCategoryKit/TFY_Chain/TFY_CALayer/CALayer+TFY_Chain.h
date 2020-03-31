//
//  CALayer+TFY_Chain.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TFY_LayerChainHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (TFY_Chain)
TFY_CATEGORY_STRONG_PROPERTY TFY_LayerChainModel *(^ addLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_ShaperLayerChainModel *(^ addShaperLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_EmiiterLayerChainModel *(^ addEmiiterLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_ScrollLayerChainModel *(^ addScrollLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_TextLayerChainModel *(^ addTextLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_TiledLayerChainModel *(^ addTiledLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_TransFormLayerChainModel *(^ addTransFormLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_GradientLayerChainModel *(^ addGradientLayer)(void);

TFY_CATEGORY_STRONG_PROPERTY TFY_ReplicatorLayerChainModel *(^ addReplicatorLayer)(void);
@end

NS_ASSUME_NONNULL_END

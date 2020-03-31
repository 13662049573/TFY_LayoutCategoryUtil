//
//  UIView+TFY_Chain.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CALayer+TFY_Chain.h"
#import "TFY_ViewHeader.h"
#import "TFY_GestureChainHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TFY_Chain)

TFY_CATEGORY_STRONG_PROPERTY TFY_ViewChainModel *(^ addView)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_LabelChainModel *(^ addLabel)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_ImageViewChainModel *(^ addImageView)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_ControlChainModel *(^ addControl)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_TextFieldChainModel *(^ addTextField)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_ButtonChainModel *(^ addButton)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_SwitchChainModel *(^ addSwitch)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_ScrollViewChainModel *(^ addScrollView)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_TextViewChainModel *(^ addTextView)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_TableViewChainModel *(^ addTableView)(NSInteger tag);

TFY_CATEGORY_STRONG_PROPERTY TFY_CollectionViewChainModel *(^ addCollectionView)(NSInteger tag);

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

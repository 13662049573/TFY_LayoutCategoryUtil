//
//  TFY_SwitchChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_SwitchChainModel;
@interface TFY_SwitchChainModel : TFY_BaseControlChainModel<TFY_SwitchChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_SwitchChainModel *(^ on)(BOOL on);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SwitchChainModel *(^ onTintColor)(UIColor *onTintColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SwitchChainModel *(^ thumbTintColor)(UIColor *thumbTintColor);

TFY_CATEGORY_CHAIN_PROPERTY TFY_SwitchChainModel *(^ onImage)(UIImage *onImage);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SwitchChainModel *(^ offImage)(UIImage *offImage);

@end

TFY_CATEGORY_EXINTERFACE(UISwitch, TFY_SwitchChainModel)

NS_ASSUME_NONNULL_END

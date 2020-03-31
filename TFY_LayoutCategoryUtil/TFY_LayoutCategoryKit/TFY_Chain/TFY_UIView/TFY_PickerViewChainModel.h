//
//  TFY_PickerViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_PickerViewChainModel;
@interface TFY_PickerViewChainModel : TFY_BaseViewChainModel<TFY_PickerViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ dataSource) (id<UIPickerViewDataSource> dataSource);
TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ delegate) (id<UIPickerViewDelegate> delegate);
TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ showsSelectionIndicator) (BOOL showsSelectionIndicator);
TFY_CATEGORY_CHAIN_PROPERTY NSInteger (^ numberOfRowsInComponent) (NSInteger component);
TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ rowSizeForComponent) (NSInteger component);
TFY_CATEGORY_CHAIN_PROPERTY UIView * (^ viewForRowComponent) (NSInteger row, NSInteger component);
TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ reloadAllComponents) (void);
TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ reloadComponent) (NSInteger component);
TFY_CATEGORY_CHAIN_PROPERTY TFY_PickerViewChainModel * (^ selectRowInComponent) (NSInteger row, NSInteger component, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY NSInteger (^ selectedRowInComponent) (NSInteger component);

@end
TFY_CATEGORY_EXINTERFACE(UIPickerView, TFY_PickerViewChainModel)

NS_ASSUME_NONNULL_END

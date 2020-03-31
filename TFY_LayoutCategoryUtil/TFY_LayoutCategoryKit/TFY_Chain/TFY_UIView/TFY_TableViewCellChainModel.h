//
//  TFY_TableViewCellChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_TableViewCellChainModel;
@interface TFY_TableViewCellChainModel : TFY_BaseViewChainModel<TFY_TableViewCellChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ selectionStyle) (UITableViewCellSelectionStyle selectionStyle);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ accessoryType) (UITableViewCellAccessoryType selectionStyle);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ separatorInset) (UIEdgeInsets separatorInset);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ editing) (BOOL editing);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ editingWithAnimated) (BOOL editing, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ focusStyle)(UITableViewCellFocusStyle focusStyle) API_AVAILABLE(ios(9.0));
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewCellChainModel * (^ userInteractionEnabledWhileDragging)(BOOL userInteractionEnabledWhileDragging) API_AVAILABLE(ios(11.0));

@end

static inline UITableViewCell * UITableViewCellCreateWithStyleAndIndentify(UITableViewCellStyle style, NSString *identifier){
    return [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier];
}

TFY_CATEGORY_EXINTERFACE(UITableViewCell, TFY_TableViewCellChainModel)

NS_ASSUME_NONNULL_END

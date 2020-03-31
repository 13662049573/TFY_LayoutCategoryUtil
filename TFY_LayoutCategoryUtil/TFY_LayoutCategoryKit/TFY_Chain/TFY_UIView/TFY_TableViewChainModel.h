//
//  TFY_TableViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_TableViewChainModel;
@interface TFY_TableViewChainModel : TFY_BaseScrollViewChainModel<TFY_TableViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ delegate) (id <UITableViewDelegate> delegate);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ dataSource) (id <UITableViewDataSource> dataSource);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ adJustedContentIOS11)(void);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ rowHeight)(CGFloat rowHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionHeaderHeight)(CGFloat sectionHeaderHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionFooterHeight)(CGFloat sectionFooterHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedRowHeight)(CGFloat estimatedRowHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedSectionHeaderHeight)(CGFloat estimatedSectionHeaderHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedSectionFooterHeight)(CGFloat estimatedSectionFooterHeight);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorInset)(UIEdgeInsets separatorInset);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ editing)(BOOL editing);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsSelection)(BOOL allowsSelection);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsMultipleSelection)(BOOL allowsMultipleSelection);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsSelectionDuringEditing)(BOOL allowsSelectionDuringEditing);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsMultipleSelectionDuringEditing)(BOOL allowsMultipleSelectionDuringEditing);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorColor)(UIColor *separatorColor);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ tableHeaderView)(UIView * tableHeaderView);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ tableFooterView)(UIView * tableFooterView);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionIndexBackgroundColor)(UIColor *sectionIndexBackgroundColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionIndexColor)(UIColor *sectionIndexColor);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier);

@end

static inline UITableView * UITableViewCreateWithStyle(UITableViewStyle style){
    return [[UITableView alloc]initWithFrame:CGRectZero style:style];
}
TFY_CATEGORY_EXINTERFACE(UITableView, TFY_TableViewChainModel)

NS_ASSUME_NONNULL_END

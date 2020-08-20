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

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ delegate) (id <UITableViewDelegate>);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ dataSource) (id <UITableViewDataSource>);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel * (^ adJustedContentIOS11)(void);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ rowHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionHeaderHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionFooterHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedRowHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedSectionHeaderHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ estimatedSectionFooterHeight)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorInset)(UIEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ editing)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsSelection)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsMultipleSelection)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsSelectionDuringEditing)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ allowsMultipleSelectionDuringEditing)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorStyle)(UITableViewCellSeparatorStyle);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ separatorColor)(UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ tableHeaderView)(UIView *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ tableFooterView)(UIView *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionIndexBackgroundColor)(UIColor *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ sectionIndexColor)(UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TableViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier);

@end

CG_INLINE UITableView * UITableViewCreateWithStyle(UITableViewStyle style){
    return [[UITableView alloc]initWithFrame:CGRectZero style:style];
}
TFY_CATEGORY_EXINTERFACE(UITableView, TFY_TableViewChainModel)

NS_ASSUME_NONNULL_END

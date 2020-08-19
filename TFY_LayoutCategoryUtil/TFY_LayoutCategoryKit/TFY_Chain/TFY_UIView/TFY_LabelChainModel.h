//
//  TFY_LabelChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_LabelChainModel;
@interface TFY_LabelChainModel : TFY_BaseViewChainModel<TFY_LabelChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ text)(NSString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ font)(UIFont *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ textColor)(UIColor *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ attributedText)(NSAttributedString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ textAlignment)(NSTextAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ numberOfLines)(NSInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ lineBreakMode)(NSLineBreakMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ adjustsFontSizeToFitWidth)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ baselineAdjustment)(UIBaselineAdjustment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ allowsDefaultTighteningForTruncation)(BOOL) API_AVAILABLE(ios(9.0));
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ minimumScaleFactor)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ preferredMaxLayoutWidth)(CGFloat);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ contentInsets)(UIEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithLimitSize) (CGSize);

TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithOutLimitSize) (void);

@end

TFY_CATEGORY_EXINTERFACE(UILabel, TFY_LabelChainModel)

NS_ASSUME_NONNULL_END

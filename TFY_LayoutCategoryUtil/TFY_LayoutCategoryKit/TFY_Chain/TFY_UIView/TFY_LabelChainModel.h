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

TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ text)(NSString *text);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ font)(UIFont *font);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ textColor)(UIColor *textColor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ attributedText)(NSAttributedString *attributedText);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ numberOfLines)(NSInteger numberOfLines);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ lineBreakMode)(NSLineBreakMode lineBreakMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ baselineAdjustment)(UIBaselineAdjustment baselineAdjustment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ allowsDefaultTighteningForTruncation)(BOOL allowsDefaultTighteningForTruncation) API_AVAILABLE(ios(9.0));
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ minimumScaleFactor)(CGFloat minimumScaleFactor);
TFY_CATEGORY_CHAIN_PROPERTY TFY_LabelChainModel *(^ preferredMaxLayoutWidth)(CGFloat preferredMaxLayoutWidth);

TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithLimitSize) (CGSize limitSize);

TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithOutLimitSize) (void);

@end

TFY_CATEGORY_EXINTERFACE(UILabel, TFY_LabelChainModel)

NS_ASSUME_NONNULL_END

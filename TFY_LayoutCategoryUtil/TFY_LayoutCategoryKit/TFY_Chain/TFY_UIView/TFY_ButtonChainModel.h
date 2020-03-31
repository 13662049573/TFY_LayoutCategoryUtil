//
//  TFY_ButtonChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"
#import "UIButton+TFY_Tools.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^TFY_ButtonImageTitleBlock)(UIImageView *imageView, UILabel *title);
@class TFY_ButtonChainModel;
@interface TFY_ButtonChainModel : TFY_BaseControlChainModel<TFY_ButtonChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ contentEdgeInsets)(UIEdgeInsets contentEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ titleEdgeInsets)(UIEdgeInsets titleEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ imageEdgeInsets)(UIEdgeInsets imageEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsImageWhenHighlighted) (BOOL adjustsImageWhenHighlighted);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ showsTouchWhenHighlighted) (BOOL showsTouchWhenHighlighted);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsImageWhenDisabled) (BOOL adjustsImageWhenDisabled);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ reversesTitleShadowWhenHighlighted) (BOOL reversesTitleShadowWhenHighlighted);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ image) (UIImage *image, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ text) (NSString *title, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ textColor) (UIColor *color, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel * (^ backgroundImage) (UIImage *image, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ attributedTitle) (NSAttributedString *title, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ titleShadow) (UIColor *color, UIControlState state);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ font) (UIFont *font);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ numberOfLines)(NSInteger numberOfLines);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ lineBreakMode)(NSLineBreakMode lineBreakMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ baselineAdjustment)(UIBaselineAdjustment baselineAdjustment);


TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel * (^ imageDirection) (ButtonImageDirection imageDirection, CGFloat space);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ imageAndTitle)(TFY_ButtonImageTitleBlock block);
@end


static inline UIButton *UIButtonCreateWithType(UIButtonType buttonType){
    return [UIButton buttonWithType:buttonType];
}
TFY_CATEGORY_EXINTERFACE(UIButton, TFY_ButtonChainModel)

NS_ASSUME_NONNULL_END

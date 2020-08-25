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

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ contentEdgeInsets)(UIEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ titleEdgeInsets)(UIEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ imageEdgeInsets)(UIEdgeInsets);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsImageWhenHighlighted) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ showsTouchWhenHighlighted) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsImageWhenDisabled) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ reversesTitleShadowWhenHighlighted) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ image) (UIImage *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ text) (NSString *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ textColor) (UIColor *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel * (^ backgroundImage) (UIImage *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ attributedTitle) (NSAttributedString *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ titleShadow) (UIColor *, UIControlState);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ font) (UIFont *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ textAlignment)(NSTextAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ numberOfLines)(NSInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ lineBreakMode)(NSLineBreakMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ adjustsFontSizeToFitWidth)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ baselineAdjustment)(UIBaselineAdjustment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment);


TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel * (^ imageDirection) (ButtonImageDirection, CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY TFY_ButtonChainModel *(^ imageAndTitle)(TFY_ButtonImageTitleBlock);
@end


CG_INLINE UIButton *UIButtonCreateWithType(UIButtonType buttonType){
    return [UIButton buttonWithType:buttonType];
}
TFY_CATEGORY_EXINTERFACE(UIButton, TFY_ButtonChainModel)

NS_ASSUME_NONNULL_END

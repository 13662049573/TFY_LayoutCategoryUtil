//
//  TFY_BaseControlChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^TFY_TargetActionBlock)(__kindof UIControl *sender);
@interface TFY_BaseControlChainModel<__covariant ObjectType> : TFY_BaseViewChainModel<ObjectType>
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ enabled)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ selected)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ highlighted)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentVerticalAlignment)(UIControlContentVerticalAlignment);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock)(TFY_TargetActionBlock, UIControlEvents);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setTargetBlock)(TFY_TargetActionBlock, UIControlEvents);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget)(id, SEL, UIControlEvents);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setTarget)(id, SEL, UIControlEvents);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id,SEL, UIControlEvents);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTarget)(void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(UIControlEvents);
@end

NS_ASSUME_NONNULL_END

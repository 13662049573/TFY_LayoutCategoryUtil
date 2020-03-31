//
//  TFY_ChainBaseModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ChainDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface TFY_ChainBaseModel<__covariant  ObjectType> : NSObject

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, strong, readonly) NSMutableArray *allOjects;

@property (nonatomic, strong, readonly) NSMutableArray * effectiveObjects;

//添加的数量，包括原来的创建对象的数量
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ multiple) (NSInteger count);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_first) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_sencond) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_third) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_fourth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_fifth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_sixth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_seventh) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_eighth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_ninth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_tenth) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_sequence) (NSUInteger index);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_range) (NSRange range);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ part_all) (void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ assignToObjects)(void (^ objs) (NSArray * objs));

- (void)enumerateObjectsUsingBlock:(void (^)(id _Nonnull))block;

@end

NS_ASSUME_NONNULL_END

//
//  NSArray+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (TFY_Tools)

- (ObjectType)safe_objectAtIndex:(NSUInteger)index;

- (ObjectType)randomObject;
/**
 快捷计算
 */
- (CGFloat)maxObject;

- (CGFloat)minObject;

- (CGFloat)sumObject;
@end

@interface NSArray<ObjectType> (Plist)

/**
 从一个二进制数据中读取一个数组
 */
+ (nullable NSArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

/**
 数组转换为plist二进制数据
 */
- (nullable NSData *)plistData;

/**
 数组转化为xml字符串
 */
- (nullable NSString *)plistString;

/**
 json字符串
 */
- (NSString *)jsonString;

/**
 更具可读性的json字符串
 */
- (NSString *)jsonPrettyString;

@end

#define TFY_MUTABLEARRAY_PROPERTY @property (nonatomic, strong, readonly) NSMutableArray <ObjectType>*

@interface NSMutableArray <ObjectType>(TFY_Tools)

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

- (void)removeFirstObject;

- (ObjectType)popFirstObject;

- (ObjectType)popLastObject;

TFY_MUTABLEARRAY_PROPERTY (^addObjectChain) (ObjectType anObject);

TFY_MUTABLEARRAY_PROPERTY (^removeObjectChain) (ObjectType anObject);

TFY_MUTABLEARRAY_PROPERTY (^addObjectChainPre) (ObjectType anObject);

TFY_MUTABLEARRAY_PROPERTY (^addObjectsChain) (NSArray <ObjectType>* objects);

TFY_MUTABLEARRAY_PROPERTY (^addObjectsChainPre) (NSArray <ObjectType>* objects);

TFY_MUTABLEARRAY_PROPERTY (^insertObjectsChainAtIndex) (NSArray <ObjectType>* objects, NSUInteger index);

- (void)reverse;

- (void)shuffle;

@end
NS_ASSUME_NONNULL_END

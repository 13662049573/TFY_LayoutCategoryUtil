//
//  NSDictionary+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (TFY_Tools)
/**
 升序排列所有keys
 
 */
- (NSArray <KeyType>*)allKeysSorted;

/**
 升序排列所有keys
 @return 所有value
 */
- (NSArray <ObjectType>*)allValuesSortedByKeys;

- (BOOL)containsObjectForKey:(KeyType)key;

/**
 查找字典中包含的key并返回字典
 */
- (NSDictionary *)entriesForKeys:(NSArray <KeyType>*)keys;

/**
 json字符串
 */
- (NSString *)jsonString;

/**
 更具可读性的json字符串
 */
- (NSString *)jsonPrettyString;
@end
@interface NSDictionary <KeyType, ObjectType> (Plist)

+ (nullable NSDictionary <KeyType ,ObjectType>*)dictionaryWithPlistData:(NSData *)plist;

+ (nullable NSDictionary <KeyType ,ObjectType>*)dictionaryWithPlistString:(NSString *)plist;

- (nullable NSData *)plistData;

- (nullable NSString *)plistString;

@end

@interface NSDictionary (ValueDefault)

- (BOOL)boolValueForKey:(NSString *)key default:(BOOL)def;

- (char)charValueForKey:(NSString *)key default:(char)def;
- (unsigned char)unsignedCharValueForKey:(NSString *)key default:(unsigned char)def;

- (short)shortValueForKey:(NSString *)key default:(short)def;
- (unsigned short)unsignedShortValueForKey:(NSString *)key default:(unsigned short)def;

- (int)intValueForKey:(NSString *)key default:(int)def;
- (unsigned int)unsignedIntValueForKey:(NSString *)key default:(unsigned int)def;

- (long)longValueForKey:(NSString *)key default:(long)def;
- (unsigned long)unsignedLongValueForKey:(NSString *)key default:(unsigned long)def;

- (long long)longLongValueForKey:(NSString *)key default:(long long)def;
- (unsigned long long)unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)def;

- (float)floatValueForKey:(NSString *)key default:(float)def;
- (double)doubleValueForKey:(NSString *)key default:(double)def;

- (NSInteger)integerValueForKey:(NSString *)key default:(NSInteger)def;
- (NSUInteger)unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)def;

- (nullable NSNumber *)numberValueForKey:(NSString *)key default:(nullable NSNumber *)def;
- (nullable NSString *)stringValueForKey:(NSString *)key default:(nullable NSString *)def;

- (NSArray *)arrayValueForKey:(NSString *)key default:(nullable NSArray *)def;
- (NSDictionary *)dicValueForKey:(NSString *)key default:(nullable NSDictionary *)def;

@end
#define TFY_MUTABLEDICTION_PROPERTY @property (nonatomic, strong, readonly) NSMutableDictionary <KeyType, ObjectType> *

@interface NSMutableDictionary <KeyType, ObjectType> (TFY_Category)
+ (nullable NSMutableDictionary <KeyType ,ObjectType>*)dictionaryWithPlistData:(NSData *)plist;

+ (nullable NSMutableDictionary <KeyType ,ObjectType>*)dictionaryWithPlistString:(NSString *)plist;

- (nullable ObjectType)popObjectForKey:(KeyType)aKey;

- (NSDictionary <KeyType, ObjectType>*)popEntriesForKeys:(NSArray <KeyType>*)keys;

TFY_MUTABLEDICTION_PROPERTY ( ^ addValueForKey)(ObjectType object, KeyType key);

TFY_MUTABLEDICTION_PROPERTY ( ^ addValueForKeyWithDefault)(ObjectType value, KeyType key, ObjectType defaultValue);

TFY_MUTABLEDICTION_PROPERTY ( ^ removeValueForKey)(KeyType key);

@end
NS_ASSUME_NONNULL_END

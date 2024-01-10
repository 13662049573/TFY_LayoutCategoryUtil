//
//  TFY_ModelSqlite.h
//  TFY_Model
//
//  Created by 田风有 on 2019/5/30.
//  Copyright © 2019 恋机科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

#pragma ******************************************  数据库模型处理类   ******************************************


@protocol TFY_ModelSqlite <NSObject>
@optional
/**
 *  自定义数据存储路径
 */
+ (NSString *)tfy_SqlitePath;
/**
 *  自定义模型类数据库版本号
 */
+ (NSString *)tfy_SqliteVersion;
/**
 *  自定义数据库加密密码 手动引入pod 'TFY_ModelKit/SQLCipher'
 */
+ (NSString *)tfy_SqlitePasswordKey;
/**
 *  自定义数据表主键名称
 */
+ (NSString *)tfy_SqliteMainkey;
/**
 *  忽略属性集合
 */
+ (NSArray *)tfy_IgnorePropertys;
/**
 *  引入使用其他方式创建的数据库存储路径来使用Sqlite进行操作其他方式创建的数据库
 */
+ (NSString *)tfy_OtherSqlitePath;
/**
 *  指定自定义表名 在指定引入其他方式创建的数据库时，这个时候如果表名不是模型类名需要实现该方法指定表名称
 */
+ (NSString *)tfy_TableName;

@end


@interface TFY_ModelSqlite : NSObject
/**
 *  存储模型数组到本地(事务方式) 模型数组对象(model_array 里对象类型要一致)
 */
+ (BOOL)inserts:(NSArray *)model_array;
/**
 *  存储模型到本地model_object 模型对象
 */
+ (BOOL)insert:(id)model_object;
/**
 *  获取模型类表总条数model_class 模型类 总条数
 */
+ (NSUInteger)count:(Class)model_class;
/**
 * 查询本地模型对象model_class 模型类 查询模型对象数组
 */
+ (NSArray *)query:(Class)model_class;
/**
 * 查询本地模型对象model_class 模型类 where 查询条件(查询语法和SQL where 查询语法一样，where为空则查询所有) 查询模型对象数组
 */
+ (NSArray *)query:(Class)model_class where:(NSString *_Nullable)where;
/**
 * 查询本地模型对象 order 排序条件(排序语法和SQL order 查询语法一样，order为空则不排序)
 */
+ (NSArray *)query:(Class)model_class order:(NSString *)order;
/**
 *  查询本地模型对象 limit 限制条件(限制语法和SQL limit 查询语法一样，limit为空则不限制查询) [TFY_ModelSqlite query:[Person class] limit:@"8"];
 */
+ (NSArray *)query:(Class)model_class limit:(NSString *)limit;
/**
 *  [TFY_ModelSqlite query:[Person class] where:@"age < 30" order:@"by age desc/asc"]; 
 */
+ (NSArray *)query:(Class)model_class where:(NSString *)where order:(NSString *)order;
/**
 * [TFY_ModelSqlite query:[Person class] where:@"age <= 30" limit:@"8 offset 8"];
 */
+ (NSArray *)query:(Class)model_class where:(NSString *)where limit:(NSString *)limit;
/**
 *  [TFY_ModelSqlite query:[Person class] order:@"by age desc/asc" limit:@"8 offset 8"];
 */
+ (NSArray *)query:(Class)model_class order:(NSString *)order limit:(NSString *)limit;
/**
 * [TFY_ModelSqlite query:[Person class] where:@"age <= 30" order:@"by age desc/asc" limit:@"8"];
 */
+ (NSArray *)query:(Class)model_class where:(NSString *)where order:(NSString *)order limit:(NSString *)limit;
/**
 * 自定义sql查询 [TFY_ModelSqlite query:Model.self sql:@"select cc.* from ( select tt.*,(select count(*)+1 from Chapter where chapter_id = tt.chapter_id and updateTime< updateTime ) as group_id from Chapter tt) cc where cc.group_id<=7 order by updateTime desc"];
 */
+ (NSArray *)query:(Class)model_class sql:(NSString *)sql;
/**
 *  利用sqlite 函数进行查询 [TFY_ModelSqlite query:[Person class] sqliteFunc:@"max(age)"];
                         [TFY_ModelSqlite query:[Person class] sqliteFunc:@"count(*)"];
 */
+ (id)query:(Class)model_class func:(NSString *)func;
/**
 *  利用sqlite 函数进行查询 [TFY_ModelSqlite query:[Person class] sqliteFunc:@"max(age)" condition:@"where name = '北京'"];
                         [TFY_ModelSqlite query:[Person class] sqliteFunc:@"count(*)" condition:@"where name = '北京'"];
 */
+ (id)query:(Class)model_class func:(NSString *)func condition:(NSString *_Nullable)condition;
/**
 * 更新本地模型对象
 */
+ (BOOL)update:(id)model_object where:(NSString *)where;
/**
 *  更新数据表字段 [TFY_ModelSqlite update:Person.self value:@"name = 'tfy', age = 100" where:@"age > 25"];
 */
+ (BOOL)update:(Class)model_class value:(NSString *)value where:(NSString *)where;
/**
 * 清空本地模型对象
 */
+ (BOOL)clear:(Class)model_class;
/**
 * 删除本地模型对象
 */
+ (BOOL)deletes:(Class)model_class where:(NSString *_Nullable)where;
/**
 *  清空所有本地模型数据库
 */
+ (void)removeAllModel;
/**
 *  清空指定本地模型数据库
 */
+ (void)removeModel:(Class)model_class;
/**
 *  返回本地模型数据库路径
 */
+ (NSString *)localPathWithModel:(Class)model_class;
/**
 *  返回本地模型数据库版本号
 */
+ (NSString *)versionWithModel:(Class)model_class;

@end


/**当存储NSArray/NSDictionary属性并且里面是自定义模型对象时，模型对象必须实现NSCoding协议，可以使用TFY_SqliteModel库一行代码实现NSCoding相关代码**/

///模型对象归档解归档实现
#define TFY_SqliteCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self tfy_SqliteDecode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self tfy_SqliteEncode:encoder]; \
}\
- (id)copyWithZone:(NSZone *)zone { return [self tfy_SqliteCopy]; }

@protocol TFY_SqliteModelKeyValue <NSObject>
@optional
/// 模型类可自定义属性名称<json key名, 替换实际属性名>
+ (NSDictionary <NSString *, NSString *> *)tfy_SqliteModelReplacePropertyMapper;
/// 模型数组/字典元素对象可自定义类<替换实际属性名,实际类>
+ (NSDictionary <NSString *, Class> *)tfy_SqliteModelReplaceContainerElementClassMapper;
/// 模型类可自定义属性类型<替换实际属性名,实际类>
+ (NSDictionary <NSString *, Class> *)tfy_SqliteModelReplacePropertyClassMapper;

@end

@interface NSObject (TFY_SqliteModel)<TFY_SqliteModelKeyValue>
#pragma mark - json转模型对象 Api -

/** 说明:把json解析为模型对象
 * json :json数据对象
 * 模型对象
 */
+ (id)tfy_SqliteModelWithJson:(id)json;

/** 说明:把json解析为模型对象
 * json :json数据对象
 * keyPath :json key的路径
 * 模型对象
 */

+ (id)tfy_SqliteModelWithJson:(id)json keyPath:(NSString *)keyPath;


#pragma mark - 模型对象转json Api -

/** 说明:把模型对象转换为字典
 *@return 字典对象
 */

- (NSDictionary *)tfy_SqliteDictionary;

/** 说明:把模型对象转换为json字符串
 *@return json字符串
 */

- (NSString *)tfy_SqliteJson;

#pragma mark - 模型对象序列化 Api -

/// 复制模型对象
- (id)tfy_SqliteCopy;

/// 序列化模型对象
- (void)tfy_SqliteEncode:(NSCoder *)aCoder;

/// 反序列化模型对象
- (void)tfy_SqliteDecode:(NSCoder *)aDecoder;
@end

NS_ASSUME_NONNULL_END

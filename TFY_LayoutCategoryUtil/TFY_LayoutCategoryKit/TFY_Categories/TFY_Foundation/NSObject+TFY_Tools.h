//
//  NSObject+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^tfy_deallocTask)(id object);

@interface NSObject (TFY_Tools)

@property (nonatomic, copy, readonly) NSString * clasName;

+ (NSString *)clasName;

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

- (void)setAssociateValue:(id)value forKey:(void *)key;

- (void)setAssociateWeakValue:(nullable id)value forKey:(void *)key;

- (id)getAssociateValueByKey:(void *)key;

- (void)removeAllAssociatedValues;

- (void)addDeallocTask:(tfy_deallocTask)task;

- (nullable id)performSelectorWithArguments:(SEL)sel, ...;

- (void)performSelectorWithArguments:(SEL)sel delay:(NSTimeInterval)delay, ...;

- (nullable id)performSelectorWaitUntilDone:(BOOL)wait onMainThreadWithArguments:(SEL)sel ,...;

- (nullable id)performSelectorwaitUntilDone:(BOOL)wait withArguments:(SEL)sel onThread:(NSThread *)thread, ...;

- (void)performSelectorWithArgumentsInBackground:(SEL)sel, ...;
@end

NS_ASSUME_NONNULL_END

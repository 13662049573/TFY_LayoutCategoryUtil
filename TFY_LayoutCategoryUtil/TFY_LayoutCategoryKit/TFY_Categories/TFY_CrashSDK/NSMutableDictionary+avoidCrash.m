//
//  NSMutableDictionary+avoidCrash.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "NSMutableDictionary+avoidCrash.h"
#import "TFY_AvoidCrash.h"

@implementation NSMutableDictionary (avoidCrash)

+ (void)tfy_avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [TFY_AvoidCrash exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKey:) method2Sel:@selector(avoidCrashSetObject:forKey:)];
    
        //removeObjectForKey:
        Method removeObjectForKey = class_getInstanceMethod(dictionaryM, @selector(removeObjectForKey:));
        Method avoidCrashRemoveObjectForKey = class_getInstanceMethod(dictionaryM, @selector(avoidCrashRemoveObjectForKey:));
        method_exchangeImplementations(removeObjectForKey, avoidCrashRemoveObjectForKey);
    });
}


//=================================================================
//                       setObject:forKey:
//=================================================================
#pragma mark - setObject:forKey:

- (void)avoidCrashSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self avoidCrashSetObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                       setObject:forKeyedSubscript:
//=================================================================
#pragma mark - setObject:forKey:

- (void)avoidCrashSetObject:(id)anObject forKeyedSubscript:(id<NSCopying>)aKey {
    
    @try {
        [self avoidCrashSetObject:anObject forKeyedSubscript:aKey];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                       removeObjectForKey:
//=================================================================
#pragma mark - removeObjectForKey:

- (void)avoidCrashRemoveObjectForKey:(id)aKey {
    
    @try {
        [self avoidCrashRemoveObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


@end

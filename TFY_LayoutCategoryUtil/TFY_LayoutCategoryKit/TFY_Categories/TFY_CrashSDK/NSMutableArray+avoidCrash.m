//
//  NSMutableArray+avoidCrash.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "NSMutableArray+avoidCrash.h"
#import "TFY_AvoidCrash.h"

@implementation NSMutableArray (avoidCrash)

+ (void)tfy_avoidCrashExchangeMethod {
    Class arrayMClass = NSClassFromString(@"__NSArrayM");
    
    //get object from array method exchange
    //由于继承于NSArray，所以 objectAtIndexedSubscript已经在NSArray中处理过了，无需处理
    
    //array set object at index
    [TFY_AvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(setObject:atIndexedSubscript:) method2Sel:@selector(avoidCrashSetObject:atIndexedSubscript:)];
    
    //removeObjectAtIndex:
    [TFY_AvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(removeObjectAtIndex:) method2Sel:@selector(avoidCrashRemoveObjectAtIndex:)];
    
    //insertObject:atIndex:
    [TFY_AvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(insertObject:atIndex:) method2Sel:@selector(avoidCrashInsertObject:atIndex:)];
    
    
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(lpm_MavoidCrashObjectsAtIndex:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(lpm_MavoidCrashObjectsAtIndexes:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(lpm_MavoidCrashObjectAtIndexedSubscript:)];
}


//=================================================================
//                    array set object at index
//=================================================================
#pragma mark - get object from array


- (void)avoidCrashSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self avoidCrashSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    removeObjectAtIndex:
//=================================================================
#pragma mark - removeObjectAtIndex:

- (void)avoidCrashRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self avoidCrashRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    insertObject:atIndex:
//=================================================================
#pragma mark - set方法
- (void)avoidCrashInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self avoidCrashInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:TFYAvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


// __NSArrayM
//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)lpm_MavoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self lpm_MavoidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
    
}


//=================================================================
//                       objectsAtIndexes:
//=================================================================
#pragma mark - objectsAtIndexes:

- (NSArray *)lpm_MavoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lpm_MavoidCrashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return returnArray;
    }
}


//=================================================================
//                       objectsAtIndex:
//=================================================================
#pragma mark - objectsAtIndexes:

- (id)lpm_MavoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self lpm_MavoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}

@end

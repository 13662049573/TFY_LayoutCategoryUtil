//
//  NSArray+avoidCrash.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "NSArray+avoidCrash.h"
#import "TFY_AvoidCrash.h"

@implementation NSArray (avoidCrash)

+ (void)tfy_avoidCrashExchangeMethod {
    
    //class method
    
    //instance array method exchange
    [TFY_AvoidCrash exchangeClassMethod:[self class] method1Sel:@selector(arrayWithObjects:count:) method2Sel:@selector(AvoidCrashArrayWithObjects:count:)];
    
    // __NSArrayI，__NSArray0，__NSSingleObjectArrayI
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(avoidCrashObjectsAtIndex:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(avoidCrashObjectsAtIndexes:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(avoidCrashObjectAtIndexedSubscript:)];
    
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(lpm_IavoidCrashObjectsAtIndex:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(lpm_IavoidCrashObjectsAtIndexes:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(lpm_IavoidCrashObjectAtIndexedSubscript:)];
    
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(lpm_SavoidCrashObjectsAtIndex:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(lpm_SavoidCrashObjectsAtIndexes:)];
    [TFY_AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(lpm_SavoidCrashObjectAtIndexedSubscript:)];
    
}


//=================================================================
//                        instance array
//=================================================================
#pragma mark - instance array


+ (instancetype)AvoidCrashArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self AvoidCrashArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil object and instance a array.";
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self AvoidCrashArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}



//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)avoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self avoidCrashObjectAtIndexedSubscript:idx];
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

- (NSArray *)avoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrashObjectsAtIndexes:indexes];
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

- (id)avoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self avoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}



// __NSArrayI
//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)lpm_IavoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self lpm_IavoidCrashObjectAtIndexedSubscript:idx];
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

- (NSArray *)lpm_IavoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lpm_IavoidCrashObjectsAtIndexes:indexes];
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

- (id)lpm_IavoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self lpm_IavoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}


// __NSSingleObjectArrayI
//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)lpm_SavoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self lpm_SavoidCrashObjectAtIndexedSubscript:idx];
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

- (NSArray *)lpm_SavoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lpm_SavoidCrashObjectsAtIndexes:indexes];
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

- (id)lpm_SavoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self lpm_SavoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = TFYAvoidCrashDefaultReturnNil;
        [TFY_AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}


@end

//
//  TFY_AvoidCrash.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

#define TFYAvoidCrashNotification @"TFYAvoidCrashNotification"
#define TFYAvoidCrashDefaultReturnNil  @"This framework default is to return nil to avoid crash."
#define TFYAvoidCrashDefaultIgnore     @"This framework default is to ignore this operation to avoid crash."

@interface TFY_AvoidCrash : NSObject

/// 开始生效.你可以在AppDelegate的didFinishLaunchingWithOptions方法中调用becomeEffective方法
+ (void)becomeEffective;

+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)noteErrorWithException:(NSException *)exception defaultToDo:(NSString *)defaultToDo;

@end

NS_ASSUME_NONNULL_END

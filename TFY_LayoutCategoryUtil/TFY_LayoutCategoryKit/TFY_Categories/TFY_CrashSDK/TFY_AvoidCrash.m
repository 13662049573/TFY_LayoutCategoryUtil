//
//  TFY_AvoidCrash.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/1/18.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "TFY_AvoidCrash.h"
#import "NSObject+avoidCrash.h"
#import "NSArray+avoidCrash.h"
#import "NSMutableArray+avoidCrash.h"
#import "NSDictionary+avoidCrash.h"
#import "NSMutableDictionary+avoidCrash.h"
#import "NSString+avoidCrash.h"
#import "NSMutableString+avoidCrash.h"
#import "NSAttributedString+avoidCrash.h"
#import "NSMutableAttributedString+avoidCrash.h"

#define TFYAvoidCrashSeparator         @"================================================================"
#define TFYAvoidCrashSeparatorWithFlag @"========================TFY_AvoidCrash Log=========================="

#define key_errorName        @"errorName"
#define key_errorReason      @"errorReason"
#define key_errorPlace       @"errorPlace"
#define key_defaultToDo      @"defaultToDo"
#define key_callStackSymbols @"callStackSymbols"
#define key_exception        @"exception"

@implementation TFY_AvoidCrash

/**
 *  开始生效(进行方法的交换)
 */
+ (void)becomeEffective {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject tfy_avoidCrashExchangeMethod];

        [NSArray tfy_avoidCrashExchangeMethod];
        [NSMutableArray tfy_avoidCrashExchangeMethod];

        [NSDictionary tfy_avoidCrashExchangeMethod];
        [NSMutableDictionary tfy_avoidCrashExchangeMethod];

        [NSString tfy_avoidCrashExchangeMethod];
        [NSMutableString tfy_avoidCrashExchangeMethod];

        [NSAttributedString tfy_avoidCrashExchangeMethod];
        [NSMutableAttributedString tfy_avoidCrashExchangeMethod];
    });
}

/**
 *  类方法的交换
 */
+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    Method method1 = class_getClassMethod(anClass, method1Sel);
    Method method2 = class_getClassMethod(anClass, method2Sel);
    method_exchangeImplementations(method1, method2);
}


/**
 *  对象方法的交换
 */
+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    
    Method originalMethod = class_getInstanceMethod(anClass, method1Sel);
    Method swizzledMethod = class_getInstanceMethod(anClass, method2Sel);
    
    BOOL didAddMethod =
    class_addMethod(anClass,
                    method1Sel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            method2Sel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

/**
 *  获取堆栈主要崩溃精简化的信息<根据正则表达式匹配出来>
 *  callStackSymbolStr 堆栈主要崩溃信息 堆栈主要崩溃精简化的信息
 */

+ (NSString *)getMainCallStackSymbolMessageWithCallStackSymbols:(NSArray<NSString *> *)callStackSymbols {
    
    //mainCallStackSymbolMsg的格式为   +[类名 方法名]  或者 -[类名 方法名]
    __block NSString *mainCallStackSymbolMsg = nil;
    
    //匹配出来的格式为 +[类名 方法名]  或者 -[类名 方法名]
    NSString *regularExpStr = @"[-\\+]\\[.+\\]";
    
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:regularExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    for (int index = 2; index < callStackSymbols.count; index++) {
        NSString *callStackSymbol = callStackSymbols[index];
        
        [regularExp enumerateMatchesInString:callStackSymbol options:NSMatchingReportProgress range:NSMakeRange(0, callStackSymbol.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            if (result) {
                NSString* tempCallStackSymbolMsg = [callStackSymbol substringWithRange:result.range];
                
                //get className
                NSString *className = [tempCallStackSymbolMsg componentsSeparatedByString:@" "].firstObject;
                className = [className componentsSeparatedByString:@"["].lastObject;
                
                NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(className)];
                
                //filter category and system class
                if (![className hasSuffix:@")"] && bundle == [NSBundle mainBundle]) {
                    mainCallStackSymbolMsg = tempCallStackSymbolMsg;
                }
                *stop = YES;
            }
        }];
        
        if (mainCallStackSymbolMsg.length) {
            break;
        }
    }
    
    return mainCallStackSymbolMsg;
}


/**
 *  提示崩溃的信息(控制台输出、通知)
 *
 *   exception   捕获到的异常
 *  defaultToDo 这个框架里默认的做法
 */
+ (void)noteErrorWithException:(NSException *)exception defaultToDo:(NSString *)defaultToDo {

    //堆栈数据
    NSArray *callStackSymbolsArr = [NSThread callStackSymbols];
    
    //获取在哪个类的哪个方法中实例化的数组  字符串格式 -[类名 方法名]  或者 +[类名 方法名]
    NSString *mainCallStackSymbolMsg = [TFY_AvoidCrash getMainCallStackSymbolMessageWithCallStackSymbols:callStackSymbolsArr];
    
    if (mainCallStackSymbolMsg == nil) {
        mainCallStackSymbolMsg = @"崩溃方法定位失败,请您查看函数调用栈来排查错误原因";
    }
    
    NSString *errorName = exception.name;
    NSString *errorReason = exception.reason;
    //errorReason 可能为 -[__NSCFConstantString avoidCrashCharacterAtIndex:]: Range or index out of bounds
    //将avoidCrash去掉
    errorReason = [errorReason stringByReplacingOccurrencesOfString:@"avoidCrash" withString:@""];
    
    NSString *errorPlace = [NSString stringWithFormat:@"Error Place:%@",mainCallStackSymbolMsg];
    
    NSString *logErrorMessage = [NSString stringWithFormat:@"\n\n%@\n\n%@\n%@\n%@\n%@\n\n%@\n\n",TFYAvoidCrashSeparatorWithFlag, errorName, errorReason, errorPlace, defaultToDo, TFYAvoidCrashSeparator];
    NSLog(@"%@", logErrorMessage);
    
    NSDictionary *errorInfoDic = @{
                                   key_errorName        : errorName,
                                   key_errorReason      : errorReason,
                                   key_errorPlace       : errorPlace,
                                   key_defaultToDo      : defaultToDo,
                                   key_exception        : exception,
                                   key_callStackSymbols : callStackSymbolsArr
                                   };
    
    //将错误信息放在字典里，用通知的形式发送出去
    [[NSNotificationCenter defaultCenter] postNotificationName:TFYAvoidCrashNotification object:nil userInfo:errorInfoDic];
}



@end
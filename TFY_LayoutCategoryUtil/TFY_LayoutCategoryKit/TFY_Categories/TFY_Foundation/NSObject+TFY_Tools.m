//
//  NSObject+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "NSObject+TFY_Tools.h"
#import <UIKit/UIKit.h>
#import <objc/message.h>

#define PERFORMSELECROR(_args, _return_)\
NSMethodSignature *sig = [self methodSignatureForSelector:sel];\
if (!sig){[self doesNotRecognizeSelector:sel]; return _return_;}\
NSInvocation *invoctation = [NSInvocation invocationWithMethodSignature:sig];\
if (!invoctation) {[self doesNotRecognizeSelector:sel]; return _return_;}\
[invoctation setTarget:self];\
[invoctation setSelector:sel];\
va_list args;\
va_start(args, _args);\
[NSObject setInv:invoctation withSig:sig andArgs:args];\
va_end(args);

static const void *RuntimeDeallocTasks = &RuntimeDeallocTasks;
static const void *RuntimeDeallocClassTag = &RuntimeDeallocClassTag;

@implementation NSObject (TFY_Tools)

- (NSString *)clasName{
    return [NSString stringWithUTF8String:class_getName([self class])];
}

+ (NSString *)clasName{
    return NSStringFromClass(self);
}

- (nullable id)performSelectorWithArguments:(SEL)sel, ... {
    PERFORMSELECROR(sel, nil)
    [invoctation invoke];
    return [self getInvocationFromInv:invoctation sig:sig];
}

- (void)performSelectorWithArguments:(SEL)sel delay:(NSTimeInterval)delay, ...{
    PERFORMSELECROR(delay, )
    [invoctation retainArguments];
    [invoctation performSelector:sel withObject:nil afterDelay:delay];
}

- (nullable id)performSelectorWaitUntilDone:(BOOL)wait onMainThreadWithArguments:(SEL)sel, ...{
    PERFORMSELECROR(sel, nil)
    if (!wait) [invoctation retainArguments];
    [invoctation performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:wait];
    return wait?[NSObject getInvocationFromInv:invoctation sig:sig]:nil;
}

- (nullable id)performSelectorwaitUntilDone:(BOOL)wait withArguments:(SEL)sel onThread:(NSThread *)thread, ...{
    PERFORMSELECROR(thread, nil)
    if (!wait) [invoctation retainArguments];
    [invoctation performSelector:@selector(invoke) onThread:thread withObject:nil waitUntilDone:wait];
    return wait ? [NSObject getInvocationFromInv:invoctation sig:sig] : nil;
}

- (void)performSelectorWithArgumentsInBackground:(SEL)sel, ...{
    PERFORMSELECROR(sel, )
    [invoctation retainArguments];
    [invoctation performSelectorInBackground:sel withObject:nil];
}

#undef PERFORMSELECROR

- (id)getInvocationFromInv:(NSInvocation *)inv sig:sig{
    NSUInteger length = [sig methodReturnLength];
    if (length == 0) return nil;
    
    char *type = (char *)[sig methodReturnType];
    while (*type == 'r' || // const
           *type == 'n' || // in
           *type == 'N' || // inout
           *type == 'o' || // out
           *type == 'O' || // bycopy
           *type == 'R' || // byref
           *type == 'V') { // oneway
        type++;
    }
    
#define return_with_number(_type_)\
do{\
_type_ ret;\
[inv getReturnValue:&ret]; \
return @(ret);\
} while (0)
    
    switch (*type) {
        case 'v': return nil; // void
        case 'B': return_with_number(bool);
        case 'c': return_with_number(char);
        case 'C': return_with_number(unsigned char);
        case 's': return_with_number(short);
        case 'S': return_with_number(unsigned short);
        case 'i': return_with_number(int);
        case 'I': return_with_number(unsigned int);
        case 'l': return_with_number(int);
        case 'L': return_with_number(unsigned int);
        case 'q': return_with_number(long long);
        case 'Q': return_with_number(unsigned long long);
        case 'f': return_with_number(float);
        case 'd': return_with_number(double);
        case 'D': { // long double
            long double ret;
            [inv getReturnValue:&ret];
            return [NSNumber numberWithDouble:ret];
        };
            
        case '@': { // id
            id ret = nil;
            [inv getReturnValue:&ret];
            return ret;
        };
            
        case '#': { // Class
            Class ret = nil;
            [inv getReturnValue:&ret];
            return ret;
        };
            
        default: { // struct / union / SEL / void* / unknown
            const char *objCType = [sig methodReturnType];
            char *buf = calloc(1, length);
            if (!buf) return nil;
            [inv getReturnValue:buf];
            NSValue *value = [NSValue valueWithBytes:buf objCType:objCType];
            free(buf);
            return value;
        };
    }
#undef return_with_number
}

+ (void)setInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig andArgs:(va_list)args{
    NSUInteger count = [sig numberOfArguments];
    for (int index = 2; index < count; index++) {
        char *type = (char *)[sig getArgumentTypeAtIndex:index];
        while (*type == 'r' || // const
               *type == 'n' || // in
               *type == 'N' || // inout
               *type == 'o' || // out
               *type == 'O' || // bycopy
               *type == 'R' || // byref
               *type == 'V') { // oneway
            type++; // cutoff useless prefix
        }
        
        BOOL unsupportedType = NO;
        switch (*type) {
            case 'v': // 1: void
            case 'B': // 1: bool
            case 'c': // 1: char / BOOL
            case 'C': // 1: unsigned char
            case 's': // 2: short
            case 'S': // 2: unsigned short
            case 'i': // 4: int / NSInteger(32bit)
            case 'I': // 4: unsigned int / NSUInteger(32bit)
            case 'l': // 4: long(32bit)
            case 'L': // 4: unsigned long(32bit)
            { // 'char' and 'short' will be promoted to 'int'.
                int arg = va_arg(args, int);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'q': // 8: long long / long(64bit) / NSInteger(64bit)
            case 'Q': // 8: unsigned long long / unsigned long(64bit) / NSUInteger(64bit)
            {
                long long arg = va_arg(args, long long);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'f': // 4: float / CGFloat(32bit)
            { // 'float' will be promoted to 'double'.
                double arg = va_arg(args, double);
                float argf = arg;
                [inv setArgument:&argf atIndex:index];
            } break;
                
            case 'd': // 8: double / CGFloat(64bit)
            {
                double arg = va_arg(args, double);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'D': // 16: long double
            {
                long double arg = va_arg(args, long double);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '*': // char *
            case '^': // pointer
            {
                void *arg = va_arg(args, void *);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case ':': // SEL
            {
                SEL arg = va_arg(args, SEL);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '#': // Class
            {
                Class arg = va_arg(args, Class);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '@': // id
            {
                id arg = va_arg(args, id);
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '{': // struct
            {
                if (strcmp(type, @encode(CGPoint)) == 0) {
                    CGPoint arg = va_arg(args, CGPoint);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGSize)) == 0) {
                    CGSize arg = va_arg(args, CGSize);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGRect)) == 0) {
                    CGRect arg = va_arg(args, CGRect);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGVector)) == 0) {
                    CGVector arg = va_arg(args, CGVector);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
                    CGAffineTransform arg = va_arg(args, CGAffineTransform);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CATransform3D)) == 0) {
                    CATransform3D arg = va_arg(args, CATransform3D);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(NSRange)) == 0) {
                    NSRange arg = va_arg(args, NSRange);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(UIOffset)) == 0) {
                    UIOffset arg = va_arg(args, UIOffset);
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
                    UIEdgeInsets arg = va_arg(args, UIEdgeInsets);
                    [inv setArgument:&arg atIndex:index];
                } else {
                    unsupportedType = YES;
                }
            } break;
                
            case '(': // union
            {
                unsupportedType = YES;
            } break;
                
            case '[': // array
            {
                unsupportedType = YES;
            } break;
                
            default: // what?!
            {
                unsupportedType = YES;
            } break;
        }
        
        if (unsupportedType) {
            // Try with some dummy type...
            
            NSUInteger size = 0;
            NSGetSizeAndAlignment(type, &size, NULL);
            
#define case_size(_size_) \
else if (size <= 4 * _size_ ) { \
struct dummy { char tmp[4 * _size_]; }; \
struct dummy arg = va_arg(args, struct dummy); \
[inv setArgument:&arg atIndex:index]; \
}
            if (size == 0) { }
            case_size( 1) case_size( 2) case_size( 3) case_size( 4)
            case_size( 5) case_size( 6) case_size( 7) case_size( 8)
            case_size( 9) case_size(10) case_size(11) case_size(12)
            case_size(13) case_size(14) case_size(15) case_size(16)
            case_size(17) case_size(18) case_size(19) case_size(20)
            case_size(21) case_size(22) case_size(23) case_size(24)
            case_size(25) case_size(26) case_size(27) case_size(28)
            case_size(29) case_size(30) case_size(31) case_size(32)
            case_size(33) case_size(34) case_size(35) case_size(36)
            case_size(37) case_size(38) case_size(39) case_size(40)
            case_size(41) case_size(42) case_size(43) case_size(44)
            case_size(45) case_size(46) case_size(47) case_size(48)
            case_size(49) case_size(50) case_size(51) case_size(52)
            case_size(53) case_size(54) case_size(55) case_size(56)
            case_size(57) case_size(58) case_size(59) case_size(60)
            case_size(61) case_size(62) case_size(63) case_size(64)
            else {
                struct dummy {char tmp;};
                for (int i = 0; i < size; i++) va_arg(args, struct dummy);
            }
#undef case_size
            
        }
    }
}

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

static inline void tfy_swizzleDeallocIfNeed(Class swizzleClass){
    @synchronized (swizzleClass) {
        if (objc_getAssociatedObject(swizzleClass, RuntimeDeallocClassTag)) return;
        objc_setAssociatedObject(swizzleClass, RuntimeDeallocClassTag, @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        SEL deallocSelector = sel_registerName("dealloc");
        
        __block void (* oldImp) (__unsafe_unretained id, SEL) = NULL;
        
        id newImpBlock = ^ (__unsafe_unretained id self){
            
            NSMutableArray *deallocTask = objc_getAssociatedObject(self, RuntimeDeallocTasks);
            @synchronized (deallocTask) {
                if (deallocTask.count > 0) {
                    [deallocTask enumerateObjectsUsingBlock:^(tfy_deallocTask obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if (obj) {
                            obj(self);
                        }
                    }];
                    [deallocTask removeAllObjects];
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL))objc_msgSendSuper)(&supperInfo, deallocSelector);
            }else{
                oldImp(self,deallocSelector);
            }
        };
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        if (!class_addMethod(swizzleClass, deallocSelector, newImp, "v@:")) {
            Method deallocMethod = class_getInstanceMethod(swizzleClass, deallocSelector);
            oldImp = (__typeof__ (oldImp))method_getImplementation(deallocMethod);
            oldImp = (__typeof__ (oldImp))method_setImplementation(deallocMethod, newImp);
        }
    }
}

- (void)setAssociateValue:(id)value forKey:(void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAssociateWeakValue:(nullable id)value forKey:(void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
    [value addDeallocTask:^(id  _Nonnull object) {
        objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

- (id)getAssociateValueByKey:(void *)key{
     return objc_getAssociatedObject(self, key);
}

- (void)removeAllAssociatedValues{
    objc_removeAssociatedObjects(self);
}


//dealloc
- (NSMutableArray<tfy_deallocTask> *)tfy_deallocTasks{
    NSMutableArray *tasks = objc_getAssociatedObject(self, RuntimeDeallocTasks);
    if (tasks) return tasks;
    tasks = [NSMutableArray array];
    tfy_swizzleDeallocIfNeed(object_getClass(self));
    objc_setAssociatedObject(self, RuntimeDeallocTasks, tasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tasks;
}

- (void)addDeallocTask:(void (^)(id _Nonnull))task{
    @synchronized ([self tfy_deallocTasks]) {
        [[self tfy_deallocTasks] addObject:task];
    }
}
@end

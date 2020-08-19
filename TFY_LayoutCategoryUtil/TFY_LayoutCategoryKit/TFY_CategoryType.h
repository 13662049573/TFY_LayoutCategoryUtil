//
//  TFY_CategoryType.h
//  TFY_Category
//
//  Created by 田风有 on 2020/8/17.
//  Copyright © 2020 恋机科技. All rights reserved.
//

#ifndef TFY_CategoryType_h
#define TFY_CategoryType_h

#pragma mark-------------------------------------------属性对象---------------------------------------------
/**
 * BLOCK
 */
#define TFY_CATEGORY_CHAIN_BLOCK_PROPERTY @property (nonatomic, copy, nullable)
/**
 * assign
 */
#define TFY_CATEGORY_ASSIGN_PROPERTY @property(nonatomic , assign)
/**
 * weak
 */
#define TFY_CATEGORY_WEAK_PROPERTY @property(nonatomic , weak)

/**点语法*/
#pragma mark-------------------------------------------点语法---------------------------------------------

#define TFY_WSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//.h文件需求
#define TFY_StatementAndPropSetFuncStatement(className,propertyModifier,propertyPointerType,propertyName) \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName;\
- (className * (^) (propertyPointerType propertyName))propertyName##Set;
//.m文件需求
#define TFY_SetFuncImplementation(className,propertyPointerType, propertyName)  \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{ \
    TFY_WSelf(myself);\
    return ^(propertyPointerType propertyName){\
        myself.propertyName = propertyName;\
        return myself;\
    };\
}

#pragma mark-------------------------------------------线程---------------------------------------------
/***线程****/
#define TFY_queueGlobalStart dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
// 当所有队列执行完成之后
#define TFY_group_notify dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

#define TFY_queueMainStart dispatch_async(dispatch_get_main_queue(), ^{

#define TFY_QueueStartAfterTime(time) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){

#define TFY_queueEnd  });


// 创建队列组，可以使多个网络请求异步执行，执行完之后再进行操作
//这段放在for循环外
#define TFY_dispatch_group dispatch_group_t group = dispatch_group_create(); \
                          dispatch_queue_t queue = dispatch_get_global_queue(0, 0); \
                          dispatch_group_async(group, queue, ^{

//这段放在for循环中
#define TFY_Forwait   dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

//这段放在for循环任务执行中也是网络请求结果中使用
#define TFY_semaphore dispatch_semaphore_signal(semaphore);

//信号量减1，如果>0，则向下执行，否则等待
#define TFY_semaphore_wait  dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

//这段放在for循环结束
#define TFY_semaphoreEnd  });


#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr, "\n\n******(class)%s(begin)******\n(SEL)%s\n(line)%d\n(data)%s\n******(class)%s(end)******\n\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __FUNCTION__, __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String], [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String])

#else

#define NSLog(FORMAT, ...) nil

#endif


#pragma mark-------------------------------------------内联函数---------------------------------------------

/** 主窗口 */
CG_INLINE UIWindow* TFY_KeyWindow() {
    return [UIApplication sharedApplication].delegate.window;
}
/**主窗口*/
CG_INLINE void TFY_MakeKeyWindow() {
    return [[UIApplication sharedApplication].delegate.window makeKeyWindow];
}

/** 是否是竖屏*/
CG_INLINE BOOL TFY_isPortrait() {
    return  ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait ||  [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown ) ?YES:NO;
}

/**屏幕高*/
CG_INLINE CGFloat TFY_Height_H() {
    return [UIScreen mainScreen].bounds.size.height;
}
/**屏幕宽*/
CG_INLINE CGFloat TFY_Width_W() {
    return [UIScreen mainScreen].bounds.size.width;
}
/**等比宽*/
CG_INLINE CGFloat TFY_DEBI_width(CGFloat width) {
    return width *(TFY_isPortrait() ?(375/TFY_Width_W()):(TFY_Height_H()/375));
}
/**等比高*/
CG_INLINE CGFloat TFY_DEBI_height(CGFloat height) {
    return height *(TFY_isPortrait() ?(667/TFY_Height_H()):(TFY_Width_W()/667));
}

/**是否是苹果iPhoneX以上机型*/
CG_INLINE BOOL TFY_iPhoneX() {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ((NSInteger)(([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] currentMode].size.width)*100) == 216) : NO);
}
/**导航栏高度*/
CG_INLINE CGFloat TFY_kNavBarHeight() {
    return (TFY_iPhoneX() ? 88.0 : 64.0);
}
/**底部工具高度*/
CG_INLINE CGFloat TFY_kBottomBarHeight() {
    return (TFY_iPhoneX() ? 83.0 : 49.0);
}
/**导航栏状态栏高度*/
CG_INLINE CGFloat TFY_kNavTimebarHeight() {
    return (TFY_iPhoneX() ? 44.0 : 20.0);
}
/**去除导航栏和底部工具栏剩余高度*/
CG_INLINE CGFloat TFY_kContentHeight() {
    return (TFY_Height_H() - TFY_kNavBarHeight() - TFY_kBottomBarHeight());
}

/**弧度 --> 角度（ π --> 180° ）*/
CG_INLINE CGFloat TFY_RadianAngle(CGFloat radian) {
    return (radian * 180.0) / M_PI;
}

/**角度 --> 弧度（ 180° -->  π  ）*/
CG_INLINE CGFloat TFY_AngleRadian(CGFloat angle) {
    return (angle / 180.0) * M_PI;
}

/** 发送通知 */
CG_INLINE void TFY_PostNotification(NSNotificationName name,id obj,NSDictionary *info) {
    return [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info];
}
/** 监听通知 */
CG_INLINE void TFY_ObserveNotification(id observer,SEL aSelector,NSNotificationName aName,id obj) {
    return [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:obj];
}
/** 移除所有通知 */
CG_INLINE void TFY_RemoveNotification(id<WKHTTPCookieStoreObserver> observer) API_AVAILABLE(ios(11.0)) {
    return [[NSNotificationCenter defaultCenter] removeObserver:observer];
}
/** 移除一个已知通知 */
CG_INLINE void TFY_RemoveOneNotification(id observer,NSNotificationName aName,id obj) {
    return [[NSNotificationCenter defaultCenter] removeObserver:observer name:aName object:obj];
}


#pragma mark-------------------------------------------单例---------------------------------------------

#define  TFY_adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
     NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
     NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
     NSInteger argument = 2;\
     invocation.target = scrollView;\
     invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
     [invocation setArgument:&argument atIndex:2];\
     [invocation invoke];\
} else {\
    vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


/** 单例（声明）.h */
#define TFY_SingtonInterface + (instancetype)sharedInstance;

/** 单例（实现）.m */
#define TFY_SingtonImplement(class) \
\
static class *sharedInstance_; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance_ = [super allocWithZone:zone]; \
    }); \
    return sharedInstance_; \
} \
\
+ (instancetype)sharedInstance { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance_ = [[class alloc] init]; \
    }); \
    return sharedInstance_; \
} \
\
- (id)copyWithZone:(NSZone *)zone { \
    return sharedInstance_; \
}

/** weakSelf */
#ifndef tfy_weakify
   #if DEBUG
       #if __has_feature(objc_arc)
           #define tfy_weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
       #else
           #define tfy_weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
      #endif
   #else
#if __has_feature(objc_arc)
          #define tfy_weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
      #else
          #define tfy_weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
      #endif
   #endif
#endif

/** strongSelf */
#ifndef tfy_strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define tfy_strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define tfy_strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
#if __has_feature(objc_arc)
           #define tfy_strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
           #define tfy_strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* TFY_CategoryType_h */

/**
rand() ----随机数
abs() / labs() ----整数绝对值
fabs() / fabsf() / fabsl() ----浮点数绝对值
floor() / floorf() / floorl() ----向下取整
ceil() / ceilf() / ceill() ----向上取整
round() / roundf() / roundl() ----四舍五入
sqrt() / sqrtf() / sqrtl() ----求平方根
fmax() / fmaxf() / fmaxl() ----求最大值
fmin() / fminf() / fminl() ----求最小值
hypot() / hypotf() / hypotl() ----求直角三角形斜边的长度
fmod() / fmodf() / fmodl() ----求两数整除后的余数
modf() / modff() / modfl() ----浮点数分解为整数和小数
frexp() / frexpf() / frexpl() ----浮点数分解尾数和二为底的指数
sin() / sinf() / sinl() ----求正弦值
sinh() / sinhf() / sinhl() ----求双曲正弦值
cos() / cosf() / cosl() ----求余弦值
cosh() / coshf() / coshl() ----求双曲余弦值
tan() / tanf() / tanl() ----求正切值
tanh() / tanhf() / tanhl() ----求双曲正切值
asin() / asinf() / asinl() ----求反正弦值
asinh() / asinhf() / asinhl() ----求反双曲正弦值
acos() / acosf() / acosl() ----求反余弦值
acosh() / acoshf() / acoshl() ----求反双曲余弦值
atan() / atanf() / atanl() ----求反正切值
atan2() / atan2f() / atan2l() ----求坐标值的反正切值
atanh() / atanhf() / atanhl() ----求反双曲正切值
注:要消除链式编程的警告

要在Buildding Settings 把CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF 设为NO
*/

//
//  TFY_ChainDefine.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#ifndef TFY_ChainDefine_h
#define TFY_ChainDefine_h

#import <UIKit/UIKit.h>
#import <objc/message.h>

#define TFY_TansactionDisableActions(...)\
        [CATransaction begin];\
        [CATransaction setDisableActions:YES];\
        __VA_ARGS__\
        [CATransaction commit];

#pragma mark-------------------------------------------属性对象---------------------------------------------
//copy
#define TFY_CATEGORY_CHAIN_PROPERTY @property (nonatomic, copy, readonly)
//strong
#define TFY_CATEGORY_STRONG_PROPERTY @property (nonatomic, strong, readonly)


#pragma mark -------------------------------------------属性快速声明-------------------------------------------

#define TFY_PROPERTY_CHAIN @property (nonatomic, copy)
#define TFY_PROPERTY_STRONG @property (nonatomic, strong)
#define TFY_PROPERTY_ASSIGN @property(nonatomic , assign)
#define TFY_PROPERTY_WEAK @property(nonatomic , weak)
#define TFY_PROPERTY_CHAIN_BLOCK(name,action) @property(nonatomic, copy, nullable) void(^name)(action)

#define TFY_PROPERTY_BOOL(s) TFY_PROPERTY_ASSIGN BOOL  s
#define TFY_PROPERTY_NSString(s) TFY_PROPERTY_CHAIN NSString * s
#define TFY_PROPERTY_NSUInteger(s) TFY_PROPERTY_ASSIGN NSUInteger  s
#define TFY_PROPERTY_NSInteger(s) TFY_PROPERTY_ASSIGN NSInteger  s
#define TFY_PROPERTY_Float(s) TFY_PROPERTY_ASSIGN float  s
#define TFY_PROPERTY_LongLong(s) TFY_PROPERTY_ASSIGN long long s
#define TFY_PROPERTY_NSDictionary(s) TFY_PROPERTY_STRONG NSDictionary * s
#define TFY_PROPERTY_NSArray(s) TFY_PROPERTY_CHAIN NSArray * s
#define TFY_PROPERTY_NSMutableArray(s) TFY_PROPERTY_STRONG NSMutableArray * s
#define TFY_PROPERTY_NSData(s) TFY_PROPERTY_STRONG NSData * s
#define TFY_PROPERTY_NSMutableDictionary(s) TFY_PROPERTY_STRONG NSMutableDictionary * s

/**快捷创建对象属性 如 (Label) (name)*/
#define TFY_PROPERTY_OBJECT(object,name) TFY_PROPERTY_STRONG object  * name

/**点语法*/
#pragma mark-------------------------------------------点语法---------------------------------------------

#define TFY_CATEGORY_CHAIN_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass)\
- (TFY_ModelType  _Nonnull (^)(TFY_ParaType))TFY_Method {\
          return ^ (TFY_ParaType TFY_Method){\
                NSArray *array = self.effectiveObjects.copy;\
                for (TFY_PropertyClass * obj in array) {\
                        obj.TFY_Method = TFY_Method;\
                }\
         return self;\
    };\
}

#define TFY_CATEGORY_EXINTERFACE(TFY_Class, ModelType)\
CG_INLINE TFY_Class *TFY_Class##Set(void){\
       return [TFY_Class new];\
}\
CG_INLINE ModelType *TFY_Class##ModelSet(void){\
       return ((id (*)(id, SEL))objc_msgSend)([TFY_Class new],sel_registerName("makeChain"));\
}\
CG_INLINE ModelType *TFY_Class##NameSet(NSString *className){\
      Class clas = NSClassFromString(className);\
      if ([clas isKindOfClass:[TFY_Class class]]) {\
      return [clas new];\
      }\
    return nil;\
}\
CG_INLINE ModelType *TFY_Class##NameModelSet(NSString *className){\
      return ((id (*)(id, SEL))objc_msgSend)( TFY_Class##NameSet(className),sel_registerName("makeChain"));\
}\
TFY_CATEGORY_EXINTERFACE_(TFY_Class, ModelType)\
CG_INLINE ModelType * TFY_Class##ModelWithArray(NSArray <TFY_Class *>*objects)\
{\
    return ((id (*)(id, SEL,id,id))objc_msgSend)([ModelType alloc],sel_registerName("initWithModelObjects:modelClass:"),objects,[TFY_Class class]);\
}

#define TFY_CATEGORY_EXINTERFACE_(TFY_Class, ModelType)\
@interface TFY_Class(EXT)\
    TFY_CATEGORY_CHAIN_PROPERTY ModelType * makeChain;\
@end


#endif /* TFY_ChainDefine_h */

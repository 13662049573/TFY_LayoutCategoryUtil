//
//  TFY_BaseGestureChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ChainBaseModel.h"

#define TFY_CATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass) TFY_CATEGORY_CHAIN_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass)

#define TFY_CATEGORY_GESTURE_IMPLEMENTATION(TFY_Class, modelType)\
@implementation TFY_Class (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithGesture:self modelClass:[TFY_Class class]];\
}\
@end
NS_ASSUME_NONNULL_BEGIN

@interface TFY_BaseGestureChainModel<__covariant  ObjectType> : TFY_ChainBaseModel<ObjectType>

- (instancetype)initWithGesture:(UIGestureRecognizer *)gesture modelClass:(Class)modelClass;

@property (nonatomic, strong, readonly) __kindof UIGestureRecognizer * gesture;

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id<UIGestureRecognizerDelegate> delegate);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ enabled) (BOOL enabled);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ cancelsTouchesInView) (BOOL cancelsTouchesInView);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesBegan) (BOOL delaysTouchesBegan);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesEnded) (BOOL delaysTouchesEnded);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ allowedTouchTypes) (NSArray<NSNumber *> *allowedTouchTypes) API_AVAILABLE(ios(9));

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ allowedPressTypes) (NSArray<NSNumber *> *allowedPressTypes) API_AVAILABLE(ios(9));

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ requiresExclusiveTouchType) (BOOL requiresExclusiveTouchType)API_AVAILABLE(ios(9.2));

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name) API_AVAILABLE(ios(11));

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ requireGestureRecognizerToFail) (UIGestureRecognizer * requireGestureRecognizerToFail);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget) (id target, SEL action);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target, SEL action);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock) (void (^) (id gesture));

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlockWithTag) (void (^) (id gesture), NSString *tag);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeTargetBlockWithTag) (NSString *tag);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(void);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *view);
@end

NS_ASSUME_NONNULL_END

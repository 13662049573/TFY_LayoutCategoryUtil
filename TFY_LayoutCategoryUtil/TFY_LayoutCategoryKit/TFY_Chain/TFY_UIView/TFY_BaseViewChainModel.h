//
//  TFY_BaseViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ChainBaseModel.h"
#import "UIView+TFY_Tools.h"

#define TFY_CATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass) TFY_CATEGORY_CHAIN_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass)


#define TFY_CATEGORY_VIEW_IMPLEMENTATION(TFY_Class, modelType)\
@interface modelType(EffectiveEXT)\
@property (nonatomic, strong, readonly) NSMutableArray <TFY_Class *>* effectiveObjects;\
@end\
@implementation TFY_Class (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithTag:self.tag andView:self modelClass:[TFY_Class class]];\
}\
@end


NS_ASSUME_NONNULL_BEGIN

typedef void(^TFY_AssignViewLoad)(__kindof UIView *view);

@interface TFY_BaseViewChainModel<__covariant  ObjectType> : TFY_ChainBaseModel<ObjectType>

- (instancetype)initWithTag:(NSInteger)tag andView:(UIView *)view modelClass:(Class)modelClass;

@property (nonatomic, assign, readonly) NSInteger tag;

@property (nonatomic, strong, readonly) __kindof UIView *view;

@property (nonatomic, assign, readonly) Class viewClass;

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect);
#pragma mark - frame -
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ origin) (CGPoint);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ x) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ y) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ size) (CGSize);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ width) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ height) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ center) (CGPoint);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ centerX) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ centerY) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ top) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ left) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bottom) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ right) (CGFloat);


TFY_CATEGORY_CHAIN_PROPERTY CGFloat (^ visibleAlpha) (void);

TFY_CATEGORY_CHAIN_PROPERTY CGRect (^ convertRectTo) (CGRect, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY CGRect (^ convertRectFrom) (CGRect, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointTo) (CGPoint, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointFrom) (CGPoint, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY UIView *(^ viewWithTag) (NSInteger);

#pragma mark - show -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ tintColor) (UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alpha) (CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ clipsToBounds) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ userInteractionEnabled) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ multipleTouchEnabled) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ endEditing) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentMode) (UIViewContentMode);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CGAffineTransform);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizingMask) (UIViewAutoresizing);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizesSubviews) (BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ makeTag) (NSInteger);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ clipRadius) (CornerClipType,CGFloat);

#pragma mark - control -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addSubView) (UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGesture) (UIGestureRecognizer *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureBlock) (void (^ gestureBlock) (id));


TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeGesture) (UIGestureRecognizer *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureWithTag) (UIGestureRecognizer *, NSString *);

@property (nonatomic, strong, readonly) UIGestureRecognizer * (^ getGestureByTag) (NSString *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeGestureByTag) (NSString *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bringSubViewToFront) (UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ sendSubViewToBack) (UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubView) (UIView *, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubviewWithIndex) (NSInteger, NSInteger);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewBelow) (UIView*, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewAbove) (UIView*, UIView *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewIndex) (UIView*, NSInteger);


#pragma mark - layer -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpacity)(float);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerBackGroundColor)(UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpaque)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ border)(CGFloat, UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor)(CGColorRef);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint)(CGPoint);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize, CGFloat, UIColor *, CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor)(CGColorRef);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset)(CGSize);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerTransform)(CATransform3D);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef);

#pragma mark - method -



TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo)(TFY_AssignViewLoad);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ sizeToFit) (void);
TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeToFitSize) (CGSize);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeFormSuperView) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layoutIfNeeded) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsLayout) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplay) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplayRect) (CGRect);
@end

NS_ASSUME_NONNULL_END

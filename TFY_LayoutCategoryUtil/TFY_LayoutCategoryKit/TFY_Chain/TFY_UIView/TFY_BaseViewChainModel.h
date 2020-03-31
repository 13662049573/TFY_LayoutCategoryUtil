//
//  TFY_BaseViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ChainBaseModel.h"

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

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect frame);
#pragma mark - frame -
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ origin) (CGPoint origin);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ x) (CGFloat x);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ y) (CGFloat y);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ size) (CGSize size);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ width) (CGFloat width);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ height) (CGFloat height);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ center) (CGPoint center);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ centerX) (CGFloat centerX);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ centerY) (CGFloat centerY);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ top) (CGFloat top);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ left) (CGFloat left);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bottom) (CGFloat bottom);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ right) (CGFloat right);


TFY_CATEGORY_CHAIN_PROPERTY CGFloat (^ visibleAlpha) (void);

TFY_CATEGORY_CHAIN_PROPERTY CGRect (^ convertRectTo) (CGRect rect, UIView * toView);

TFY_CATEGORY_CHAIN_PROPERTY CGRect (^ convertRectFrom) (CGRect rect, UIView * toView);

TFY_CATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointTo) (CGPoint point, UIView * toView);

TFY_CATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointFrom) (CGPoint point, UIView * toView);

TFY_CATEGORY_CHAIN_PROPERTY UIView *(^ viewWithTag) (NSInteger tag);

#pragma mark - show -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (UIColor *backgroundColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ tintColor) (UIColor *tintColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ alpha) (CGFloat alpha);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ clipsToBounds) (BOOL clipsToBounds);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ userInteractionEnabled) (BOOL userInteractionEnabled);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ multipleTouchEnabled) (BOOL multipleTouchEnabled);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ endEditing) (BOOL endEditing);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentMode) (UIViewContentMode contentMode);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CGAffineTransform transform);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizingMask) (UIViewAutoresizing autoresizingMask);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizesSubviews) (BOOL autoresizesSubviews);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ makeTag) (NSInteger tag);

#pragma mark - control -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *superView);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addSubView) (UIView *subView);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGesture) (UIGestureRecognizer *gesture);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureBlock) (void (^ gestureBlock) (id gesture));


TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeGesture) (UIGestureRecognizer *gesture);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureWithTag) (UIGestureRecognizer *gesture, NSString *tag);

@property (nonatomic, strong, readonly) UIGestureRecognizer * (^ getGestureByTag) (NSString * tag);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeGestureByTag) (NSString *tag);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bringSubViewToFront) (UIView *view);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ sendSubViewToBack) (UIView *view);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubView) (UIView *front, UIView *backView);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubviewWithIndex) (NSInteger front, NSInteger back);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewBelow) (UIView* below, UIView * above);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewAbove) (UIView* above, UIView * below);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewIndex) (UIView* above, NSInteger index);


#pragma mark - layer -

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize)(BOOL shouldRasterize);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpacity)(float layerOpacity);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerBackGroundColor)(UIColor * backgroundColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpaque)(BOOL opaque);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale)(CGFloat rasterizationScale);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds)(BOOL masksToBounds);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius)(CGFloat cornerRadius);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ border)(CGFloat borderWidth, UIColor *borderColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth)(CGFloat borderWidth);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor)(CGColorRef borderColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition)(CGFloat zPosition);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint)(CGPoint anchorPoint);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor)(CGColorRef shadowColor);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity)(CGFloat shadowOpacity);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset)(CGSize shadowOffset);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius)(CGFloat shadowRadius);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layerTransform)(CATransform3D transform);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);

#pragma mark - method -



TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo)(TFY_AssignViewLoad assignTo);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ sizeToFit) (void);
TFY_CATEGORY_CHAIN_PROPERTY CGSize (^ sizeToFitSize) (CGSize size);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeFormSuperView) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ layoutIfNeeded) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsLayout) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplay) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplayRect) (CGRect rect);
@end

NS_ASSUME_NONNULL_END

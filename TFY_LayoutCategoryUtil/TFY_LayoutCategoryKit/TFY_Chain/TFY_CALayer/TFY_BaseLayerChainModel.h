//
//  TFY_BaseLayerChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ChainBaseModel.h"
#define TFY_CATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass) TFY_CATEGORY_CHAIN_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_ModelType, TFY_PropertyClass)

#define TFY_CATEGORY_LAYER_IMPLEMENTATION(TFY_Class, modelType)\
@implementation TFY_Class (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithLayer:self modelClass:[TFY_Class class]];\
}\
@end
NS_ASSUME_NONNULL_BEGIN
typedef void(^TFY_AssignLayerLoad)(__kindof CALayer *layer);

@interface TFY_BaseLayerChainModel<__covariant  ObjectType> : TFY_ChainBaseModel<ObjectType>

- (instancetype)initWithLayer:(CALayer *)layer modelClass:(Class)modelClass;

@property (nonatomic, strong, readonly) __kindof CALayer * layer;

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect bounds);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ position) (CGPoint position);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition) (CGFloat zPosition);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint) (CGPoint anchorPoint);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPointZ) (CGFloat anchorPointZ);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CATransform3D transform);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ affineTransform) (CGAffineTransform affineTransform);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ doubleSided) (BOOL doubleSided);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ geometryFlipped) (BOOL geometryFlipped);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeFromSuperlayer) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperLayer) (CALayer * layer);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerBelow) (CALayer *layer, CALayer * below);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerIndex) (CALayer *layer, NSInteger index);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerAbove) (CALayer *layer, CALayer *above);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ relpaceSublayer) (CALayer *oldLayer, CALayer *newLayer);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ setToMask) (CALayer * toLayer);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ mask) (CALayer * maskLayer);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds) (BOOL masksToBounds);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contents) (id contents);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentsRect) (CGRect contentsRect);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentsGravity) (CALayerContentsGravity contentsGravity);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentsScale) (CGFloat contentsScale);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentsCenter) (CGRect contentsCenter);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ contentsFormat) (CALayerContentsFormat contentsFormat) API_AVAILABLE(ios(10.0));
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilter) (CALayerContentsFilter minificationFilter);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ magnificationFilter) (CALayerContentsFilter magnificationFilter);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilterBias) (float minificationFilterBias);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ needsDisplayOnBoundsChange) (BOOL needsDisplayOnBoundsChange);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ drawsAsynchronously) (BOOL drawsAsynchronously);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ edgeAntialiasingMask) (CAEdgeAntialiasingMask edgeAntialiasingMask);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ allowsEdgeAntialiasing) (BOOL allowsEdgeAntialiasing);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (CGColorRef backgroundColor);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius) (CGFloat cornerRadius);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ maskedCorners) (CACornerMask maskedCorners) API_AVAILABLE(ios(11.0));
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth) (CGFloat borderWidth);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor) (CGColorRef borderColor);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ opacity) (float opacity);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ allowsGroupOpacity) (BOOL allowsGroupOpacity);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ compositingFilter) (id compositingFilter);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ filters) (NSArray* filters);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundFilters) (NSArray* backgroundFilters);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize) (BOOL shouldRasterize);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale) (CGFloat rasterizationScale);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor) (CGColorRef shadowColor);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity) (float shadowOpacity);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset) (CGSize shadowOffset);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius) (CGFloat shadowRadius);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ actions) (NSDictionary<NSString *, id<CAAction>> * actions);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ addAnimation) (CAAnimation *animation, NSString *key);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeAnimation) (NSString * key);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllAnimation) (void);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <CALayerDelegate> delegate);
TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ style) (NSDictionary * style);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo) (TFY_AssignLayerLoad assignTo);

TFY_CATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity);
@end

NS_ASSUME_NONNULL_END

//
//  TFY_SegmentedControlChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_SegmentedControlChainModel;
@interface TFY_SegmentedControlChainModel : TFY_BaseControlChainModel<TFY_SegmentedControlChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ momentary) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ apportionsSegmentWidthsByContent) (BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ removeAllSegments) (void);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ insertSegmentWithTitle) (NSString * title, NSUInteger index, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ insertSegmentWithImage) (UIImage * image, NSUInteger index, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ removeSegmentAtIndex) (NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setTitle) (NSString *, NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setImage) (UIImage *, NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setWidth) (CGFloat, NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setContentOffset) (CGSize, NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setEnabled) (BOOL, NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ selectedSegmentIndex) (NSInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setBackgroundImage) (UIImage *, UIControlState, UIBarMetrics);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setDividerImage) (UIImage *, UIControlState, UIControlState, UIBarMetrics);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setTitleTextAttributes) (NSDictionary <NSAttributedStringKey ,id>* attributes, UIControlState);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setContentPositionAdjustment) (UIOffset, UISegmentedControlSegment, UIBarMetrics);

@end

TFY_CATEGORY_EXINTERFACE(UISegmentedControl, TFY_SegmentedControlChainModel)

NS_ASSUME_NONNULL_END

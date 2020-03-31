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

TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ momentary) (BOOL momentary);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ apportionsSegmentWidthsByContent) (BOOL apportionsSegmentWidthsByContent);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ removeAllSegments) (void);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ insertSegmentWithTitle) (NSString * title, NSUInteger index, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ insertSegmentWithImage) (UIImage * image, NSUInteger index, BOOL animated);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ removeSegmentAtIndex) (NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setTitle) (NSString *title, NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setImage) (UIImage *image, NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setWidth) (CGFloat width, NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setContentOffset) (CGSize offset, NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setEnabled) (BOOL enable, NSUInteger index);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ selectedSegmentIndex) (NSInteger selectedSegmentIndex);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setBackgroundImage) (UIImage *image, UIControlState state, UIBarMetrics barMetrics);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setDividerImage) (UIImage *image, UIControlState leftState, UIControlState rightState, UIBarMetrics barMetrics);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setTitleTextAttributes) (NSDictionary <NSAttributedStringKey ,id>* attributes, UIControlState state);
TFY_CATEGORY_CHAIN_PROPERTY TFY_SegmentedControlChainModel* (^ setContentPositionAdjustment) (UIOffset adjustment, UISegmentedControlSegment leftCenterRightOrAlone, UIBarMetrics barMetrics);

@end

TFY_CATEGORY_EXINTERFACE(UISegmentedControl, TFY_SegmentedControlChainModel)

NS_ASSUME_NONNULL_END

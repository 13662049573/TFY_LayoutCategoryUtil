//
//  TFY_TagsView.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/5/15.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFY_TagsView;

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN const CGFloat TagsViewAutomaticDimension; // 使用sizeToFit

typedef NS_ENUM(NSInteger, TagsViewTextFieldAlign) { // Align是相对于最后一个标签的
  TagsViewTextFieldAlignTop,
  TagsViewTextFieldAlignCenter,
  TagsViewTextFieldAlignBottom,
};

@protocol TagsViewDelegate <NSObject>
@optional
/// 使用默认标签按钮，如果没有实现
- (UIButton *)tagsView:(TFY_TagsView *)tagsView buttonForTagAtIndex:(NSInteger)index;
/// 按空格键时调用。返回NO以忽略标记
- (BOOL)tagsView:(TFY_TagsView *)tagsView shouldAddTagWithText:(NSString *)text;
/// 按下标签时调用。返回NO以禁止选择标签
- (BOOL)tagsView:(TFY_TagsView *)tagsView shouldSelectTagAtIndex:(NSInteger)index;
/// 按下选定标签时调用。返回NO以禁止取消选择标签
- (BOOL)tagsView:(TFY_TagsView *)tagsView shouldDeselectTagAtIndex:(NSInteger)index;
/// 当按下'退格'键时调用。返回NO以禁止移除标签
- (BOOL)tagsView:(TFY_TagsView *)tagsView shouldRemoveTagAtIndex:(NSInteger)index;
/// 当用户添加或删除标记时调用
- (void)tagsViewDidChange:(TFY_TagsView *)tagsView;
- (void)tagsViewContentSizeDidChange:(TFY_TagsView *)tagsView;

@end

@interface TFY_TagsView : UIView
/// 没有使用scrollView委托
@property (nonatomic, strong, readonly) UIScrollView *scrollView;
/// 没有使用文本域委托
@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic, copy, readonly) NSArray<NSString *> *tags;
@property (nonatomic, copy, readonly) NSArray<NSNumber *> *selectedTagIndexes;
@property (nonatomic, weak, nullable) IBOutlet id<TagsViewDelegate> delegate;
@property (nonatomic, readonly) CGSize contentSize;

@property (nonatomic, strong) UIFont *font; // 默认是来自textfield的字体
@property (nonatomic) IBInspectable BOOL editable; // 默认为YES
@property (nonatomic) IBInspectable BOOL selectable; // 默认为YES
@property (nonatomic) IBInspectable BOOL allowsMultipleSelection; //默认为YES
@property (nonatomic) IBInspectable BOOL selectBeforeRemoveOnDeleteBackward; // 默认为YES
@property (nonatomic) IBInspectable BOOL deselectAllOnEdit; //默认为YES
@property (nonatomic) IBInspectable BOOL deselectAllOnEndEditing; //默认为YES
@property (nonatomic) IBInspectable BOOL scrollsHorizontally; //默认为NO

@property (nonatomic) IBInspectable CGFloat lineSpacing; // 默认 10
@property (nonatomic) IBInspectable CGFloat interitemSpacing; // d默认 10
@property (nonatomic) IBInspectable CGFloat tagButtonHeight; // 默认为自动
@property (nonatomic) IBInspectable CGFloat textFieldHeight; // 默认为自动
@property (nonatomic) TagsViewTextFieldAlign textFieldAlign; // 默认为居中

@property (nonatomic, strong) NSCharacterSet* deliminater; // 默认是[ncharacter set whitespacecharcharacter set]

- (NSInteger)indexForTagAtScrollViewPoint:(CGPoint)point; // 如果没有找到NSNotFound
- (nullable __kindof UIButton *)buttonForTagAtIndex:(NSInteger)index;
- (void)reloadButtons;

- (void)addTag:(NSString *)tag;
- (void)insertTag:(NSString *)tag atIndex:(NSInteger)index;
- (void)moveTagAtIndex:(NSInteger)index toIndex:(NSInteger)newIndex; // 可以动画化
- (void)removeTagAtIndex:(NSInteger)index;
- (void)removeAllTags;

- (void)selectTagAtIndex:(NSInteger)index;
- (void)deselectTagAtIndex:(NSInteger)index;
- (void)selectAll;
- (void)deselectAll;

@end

NS_ASSUME_NONNULL_END

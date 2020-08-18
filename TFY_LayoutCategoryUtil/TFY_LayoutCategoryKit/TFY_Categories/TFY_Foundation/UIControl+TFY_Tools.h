//
//  UIControl+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^controlTargeAction)(id sender);

@interface UIControl (TFY_Tools)
/**
 移除所有点击事件
 */
- (void)removeAllEvents;

/**
 添加一个点击事件
 */
- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events;

/**
 移除所有事件，并添加一个新的事件
 */
- (void)setTarget:(id)target eventAction:(SEL)action forControlEvents:(UIControlEvents)events;


/**
 是否包含某个tag
 
 */
- (BOOL)containsEventBlockForKey:(NSString *)key;
/**
 添加点击block
 @param key 键值
 */
- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events ForKey:(NSString *)key;

/**
 移除点击block
 
 @param key 键值
 */
- (void)removeEventBlockForKey:(NSString *)key event:(UIControlEvents)events;

/**
 移除所有block，并添加一个新的block
 */
- (void)setEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events;

/**
 移除所有block事件
 */
- (void)removeAllEventBlocksForEvents:(UIControlEvents)controlEvents;
@end

NS_ASSUME_NONNULL_END

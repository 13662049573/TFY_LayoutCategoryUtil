//
//  TFY_SnapshotManager.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SnapshotType) {
    SnapshotTypeDefault = 0,//default
    SnapshotTypeSplice,
};

@interface TFY_SnapshotManager : NSObject

// max count of snapshot,default is 50
@property (nonatomic, assign) NSUInteger maxScreenCount;

// max size of image,default is 4096*4096
@property (nonatomic, assign) NSUInteger maxImageSize;

// delay time,default is 0.3s, unit is second
@property (nonatomic, assign) CGFloat delayTime;

@property (nonatomic, assign) SnapshotType snapshotType;

+ (TFY_SnapshotManager *)defaultManager;

@end

NS_ASSUME_NONNULL_END

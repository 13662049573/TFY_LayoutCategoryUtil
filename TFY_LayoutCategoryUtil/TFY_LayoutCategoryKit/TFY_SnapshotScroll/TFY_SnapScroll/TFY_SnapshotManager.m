//
//  TFY_SnapshotManager.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/4/12.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "TFY_SnapshotManager.h"

@implementation TFY_SnapshotManager
static TFY_SnapshotManager *_manager = nil;

+ (TFY_SnapshotManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TFY_SnapshotManager alloc]init];
        [_manager initData];
    });
    return _manager;
}

- (void )initData{
    self.maxScreenCount = 50;
    self.maxImageSize = 4096 * 4096;
    self.delayTime = 0.3;
}

@end

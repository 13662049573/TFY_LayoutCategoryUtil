//
//  UIDevice+TFY_Tools.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (TFY_Tools)
/**版本号*/
+ (double)systemVersion;

+ (NSString *)localVersion;

+ (NSString *)localBuild;
/**跳转下载地址*/
+ (NSString *)storeUrlWithAppId:(NSString *)appId;

@property (nonatomic, readonly) BOOL isJailbroken;

@property (nonatomic, readonly) BOOL isPad;

@property (nonatomic, readonly) BOOL isSimulator;

@property (nullable, nonatomic, readonly) NSString *machineModel;

@property (nullable, nonatomic, readonly) NSString *machineModelName;

/**
 系统启动时间
 */
@property (nonatomic, readonly) NSDate *systemUptime;

@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");
/**
 wifi IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressWIFI;

/**
 cell IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressCell;

typedef NS_OPTIONS(NSUInteger, NetworkTrafficType) {
    NetworkTrafficTypeWWANSent     = 1 << 0,
    NetworkTrafficTypeWWANReceived = 1 << 1,
    NetworkTrafficTypeWIFISent     = 1 << 2,
    NetworkTrafficTypeWIFIReceived = 1 << 3,
    NetworkTrafficTypeAWDLSent     = 1 << 4,
    NetworkTrafficTypeAWDLReceived = 1 << 5,
    
    NetworkTrafficTypeWWAN = NetworkTrafficTypeWWANSent | NetworkTrafficTypeWWANReceived,
    NetworkTrafficTypeWIFI = NetworkTrafficTypeWIFISent | NetworkTrafficTypeWIFIReceived,
    NetworkTrafficTypeAWDL = NetworkTrafficTypeAWDLSent | NetworkTrafficTypeAWDLReceived,
    
    NetworkTrafficTypeALL = NetworkTrafficTypeWWAN |
    NetworkTrafficTypeWIFI |
    NetworkTrafficTypeAWDL,
};

- (uint64_t)getNetworkTrafficBytes:(NetworkTrafficType)types;


#pragma mark - Disk Space


@property (nonatomic, readonly) int64_t diskSpace;

@property (nonatomic, readonly) int64_t diskSpaceFree;

@property (nonatomic, readonly) int64_t diskSpaceUsed;

#pragma mark - Memory Information

@property (nonatomic, readonly) int64_t memoryTotal;

@property (nonatomic, readonly) int64_t memoryUsed;

@property (nonatomic, readonly) int64_t memoryFree;

@property (nonatomic, readonly) int64_t memoryActive;

@property (nonatomic, readonly) int64_t memoryInactive;

@property (nonatomic, readonly) int64_t memoryWired;

@property (nonatomic, readonly) int64_t memoryPurgable;

@property (nonatomic, readonly) NSUInteger cpuCount;

@property (nonatomic, readonly) float cpuUsage;

@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *cpuUsagePerProcessor;
@end

NS_ASSUME_NONNULL_END

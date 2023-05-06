//
//  TFY_AppVersion.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/5/6.
//  Copyright © 2023 田风有. All rights reserved.
//

#import "TFY_AppVersion.h"
#import "TFY_Scene.h"
#import "UIApplication+TFY_Tools.h"

#ifndef dispatch_main_async_safe
#define appVwesion_dispatch_main_async_safe(block)\
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }
#endif

@implementation TFY_AppVersion

// 本地版本号
+ (NSString *)locationVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *nowVersion = [infoDictionary valueForKey:@"CFBundleShortVersionString"];
    return nowVersion;
}

// Appstore 版本号
+ (void)isUpdataApp:(NSString *)appId getNewVersion:(void(^)(BOOL success, NSDictionary *result))block
{
    NSString *urlstr = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", appId];
    NSURL *url = [NSURL URLWithString:urlstr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:10];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            if (!error) {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                NSArray *results = [dictionary valueForKey:@"results"];
                if (results.count > 0) {
                    NSDictionary *dic = results.firstObject;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (block) {
                            block(YES, dic);
                        }
                    });
                    return ;
                } else {
                    // 已是最新版本
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (block) {
                            block(YES, nil);
                        }
                    });
                    return;
                }
            }
        }
        // 请求失败
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(NO, nil);
            }
        });
        
    }];
    [task resume];
}

// 比较版本号
+ (BOOL)shouldUpdateNowVersion:(NSString *)nowVersion newVersion:(NSString *)newVersion
{
    NSComparisonResult result = [newVersion compare:nowVersion options:NSNumericSearch];
    switch (result) {
        case NSOrderedDescending:
            return YES;
        default:
            return NO;
    }
}

// 检测版本并回调
+ (void)isUpdataApp:(NSString *)appId checkNewVersionNotificationBlock:(void(^)(BOOL success, NSDictionary *_Nullable result))block
{
    [self isUpdataApp:appId getNewVersion:^(BOOL success, NSDictionary *result) {
        if (success) {
            if (result) {
                NSString *newVersion = [result valueForKey:@"version"];
                NSString *nowVersion = [self locationVersion];
                BOOL shouldUpdate = [self shouldUpdateNowVersion:nowVersion newVersion:newVersion];
                if (shouldUpdate) {
                    // 版本不同则有更新
                    appVwesion_dispatch_main_async_safe(^{
                        if (block) {
                            block(success, result);
                        }
                    });
                    return;
                }
            }
        }
        appVwesion_dispatch_main_async_safe(^{
            if (block) {
                block(success, nil);
            }
        });
    }];
}

// 弹出提示信息
+ (void)showUpdateTips:(NSDictionary *)dictionary
{
    [self showUpdateTips:dictionary completion:nil];
}

// 弹出提示信息并回调
+ (void)showUpdateTips:(NSDictionary *)dictionary completion:(void(^__nullable)(BOOL success,NSString *trackId,NSURL *trackViewUrl))block
{
    NSString *version = [dictionary objectForKey:@"version"];
    NSString *releaseNotes = [dictionary valueForKey:@"releaseNotes"];
    if (releaseNotes.length == 0) {
        releaseNotes = @" ";
    }
    releaseNotes = [releaseNotes stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSString *trackViewUrl = [dictionary valueForKey:@"trackViewUrl"];
    
    NSString *title = [NSString stringWithFormat:@"版本更新(v%@)", version];
    NSString *message = [NSString stringWithFormat:@"%@\n现在更新？", releaseNotes];
    NSString *trackId = [NSString stringWithFormat:@"%@",dictionary[@"trackId"]];
    //有新版本
    UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *buttonAct = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block(YES,trackId,[NSURL URLWithString:trackViewUrl]);
        }
    }];
    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block(NO,trackId,[NSURL URLWithString:trackViewUrl]);
        }
    }];
    [alertCtr addAction:buttonAct];
    [alertCtr addAction:cancelAct];
    [self.currentViewController presentViewController:alertCtr animated:YES completion:nil];
}

+ (UIWindow *)LastWindow {
    NSEnumerator  *frontToBackWindows = [[TFY_Scene defaultPackage].windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha>0;
        BOOL windowLevelSupported = (window.windowLevel >= UIWindowLevelNormal && window.windowLevel <= UIWindowLevelNormal);
        BOOL windowKeyWindow = window.isKeyWindow;
        if (windowOnMainScreen && windowIsVisible && windowLevelSupported && windowKeyWindow) {return window;}
    }
    return [UIApplication tfy_keyWindow];
}

+ (UIViewController *)currentViewController {
    UIViewController* currentViewController = self.LastWindow.rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else {
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            } else {
                break;
            }
        }
    }
    return currentViewController;
}

@end

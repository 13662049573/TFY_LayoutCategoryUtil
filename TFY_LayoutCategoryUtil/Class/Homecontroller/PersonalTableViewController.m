//
//  PersonalTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PersonalTableViewController.h"

@interface PersonalTableViewController ()
TFY_PROPERTY_OBJECT_WEAK(UIButton, *btn);
TFY_PROPERTY_OBJECT_WEAK(UILabel, *label2);
@end

@implementation PersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *URL = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"];
    
    TFY_ImageView *imageView = [TFY_ImageView new];
    imageView.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).offset(0);
        make.size.mas_equalTo(CGSizeMake(TFY_Width_W()/2, TFY_Width_W()/2));
    }];
    
    [self loadAnimatedImageWithURL:URL completion:^(TFY_AnimatedImage *animatedImage) {
        imageView.animatedImage = animatedImage;
        imageView.userInteractionEnabled = YES;
    }];
}

- (void)loadAnimatedImageWithURL:(NSURL *const)url completion:(void (^)(TFY_AnimatedImage *animatedImage))completion
{
    NSString *const filename = url.lastPathComponent;
    NSString *const diskPath = [NSHomeDirectory() stringByAppendingPathComponent:filename];
    
    NSData * __block animatedImageData = [[NSFileManager defaultManager] contentsAtPath:diskPath];
    TFY_AnimatedImage * __block animatedImage = [[TFY_AnimatedImage alloc] initWithAnimatedGIFData:animatedImageData];
    
    if (animatedImage) {
        if (completion) {
            completion(animatedImage);
        }
    } else {
        [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            animatedImageData = data;
            animatedImage = [[TFY_AnimatedImage alloc] initWithAnimatedGIFData:animatedImageData];
            if (animatedImage) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(animatedImage);
                    });
                }
                [data writeToFile:diskPath atomically:YES];
            }
        }] resume];
    }
}
@end

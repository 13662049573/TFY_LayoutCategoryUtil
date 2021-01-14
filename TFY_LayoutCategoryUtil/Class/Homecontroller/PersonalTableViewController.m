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
    
    UIButtonModelSet()
    .backgroundColor(UIColor.yellowColor)
    .text(@"点击", UIControlStateNormal)
    .font([UIFont systemFontOfSize:15])
    .textColor(UIColor.orangeColor, UIControlStateNormal)
    .addTarget(self, @selector(btnClick), UIControlEventTouchUpInside)
    .addToSuperView(self.view)
    .assignTo(^(__kindof UIButton * _Nonnull btn) {
        btn
        .tfy_LeftSpace(30)
        .tfy_TopSpace(30)
        .tfy_RightSpace(30)
        .tfy_Height(50);
    });
    
    
    UILabelModelSet()
    .backgroundColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:18])
    .textAlignment(NSTextAlignmentLeft)
    .numberOfLines(2)
    .addToSuperView(self.view)
    .assignTo(^(__kindof UILabel * _Nonnull label) {
        self.label2 = label;
        label
        .tfy_LeftSpace(30)
        .tfy_TopSpace(TFY_kNavBarHeight())
        .tfy_RightSpace(30)
        .tfy_Height(50);
    });
    
    self.label2.attributedText = [self attributedText:@"按数据库恢复卡合法后方可哈" cared:@"afkafk" Lable:self.label2];
}

- (void)btnClick {
    self.label2.attributedText = [self attributedText:@"按数据库恢复卡合法ashgfakjgfkafaf后方可哈" cared:@"固化复合敬爱个" Lable:self.label2];
}

- (NSAttributedString *)attributedText:(NSString *)models cared:(NSString *)caed Lable:(UILabel *)label {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.lineHeightMultiple = 1;
    NSString *title_s = models;
    NSInteger lines = [TFY_Utils getLinesArrayOfStringInrowsOfString:title_s withFont:[UIFont systemFontOfSize:18] withWidth:TFY_Width_W()-60].count;
    if (lines >= 2) {
        lines = 2.f;
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(lines * 25);
    }];
    
    NSMutableDictionary *attributes = [@{NSParagraphStyleAttributeName:paragraphStyle} mutableCopy];
    // 创建一个富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:title_s attributes:attributes];
    [attri addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, title_s.length)];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    CGSize size = [self getLinesWithString:caed LabelWidth:TFY_Width_W()/2 Font:[UIFont systemFontOfSize:11]];
    
    attch.image = [self imageWithString:caed font:[UIFont systemFontOfSize:11] width:TFY_Width_W()/2 textAlignment:NSTextAlignmentLeft];
    // 设置图片大小

    attch.bounds = CGRectMake(0, 0, size.width, 18);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //在文字下标第几个添加图片  0就是文字前面添加图片
    NSAttributedString *strs = [[NSAttributedString alloc] initWithString:@" "];
    [attri insertAttributedString:string atIndex:0];
    [attri insertAttributedString:strs atIndex:1];
    return attri;
}

- (CGSize)getLinesWithString:(NSString*)string LabelWidth:(CGFloat)labelWidth Font:(UIFont*)font {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 2;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *textAttrs = @{
                                NSFontAttributeName : font,
                                NSParagraphStyleAttributeName : paragraphStyle
                                };
    CGSize size = [string boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:textAttrs context:nil].size;
    return size;
}

- (UIImage *)imageWithString:(NSString *)string font:(UIFont *)font width:(CGFloat)width textAlignment:(NSTextAlignment)textAlignment
{
    NSDictionary *attributeDic = @{NSFontAttributeName:font};
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                    attributes:attributeDic
                                       context:nil].size;
    
    if ([UIScreen.mainScreen respondsToSelector:@selector(scale)])
    {
        if (UIScreen.mainScreen.scale == 2.0)
        {
            UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
        } else
        {
            UIGraphicsBeginImageContext(size);
        }
    }
    else
    {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor orangeColor] set];
    
    CGRect rect = CGRectMake(0, 0, size.width, 18);
    
    CGContextFillRect(context, rect);
    
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = textAlignment;
    
    NSDictionary *attributes = @ {
    NSForegroundColorAttributeName:[UIColor whiteColor],
    NSFontAttributeName:font,
    NSParagraphStyleAttributeName:paragraph
    };
    
    [string drawInRect:rect withAttributes:attributes];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
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

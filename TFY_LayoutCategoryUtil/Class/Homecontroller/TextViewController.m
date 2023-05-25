//
//  TextViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2022/4/1.
//  Copyright © 2022 田风有. All rights reserved.
//

#import "TextViewController.h"
#import "TFY_TextblanksField.h"
#import "EmptyTableViewController.h"
@interface TextViewController ()<TextTagCollectionViewDelegate,TagCollectionViewDataSource,TagCollectionViewDelegate>
@property (nonatomic, strong) TFY_TextView *textView;
@property(strong,nonatomic) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;
@property(strong,nonatomic) TFY_GCDTimer *timer;

@property(strong,nonatomic) UIImageView *view1;
@property(strong,nonatomic) UIImageView *view2;
@property(strong,nonatomic) UIImageView *view3;

@property (strong, nonatomic)  TFY_TagCollectionView *tagCollectionView;
@property (strong, nonatomic)  TFY_TextTagCollectionView *textTagCollectionView2;

@property (strong, nonatomic) NSMutableArray <UIView *> *tagViews;

@property (strong, nonatomic) NSArray *tags;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barItemDoneAction)];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"是否编辑:NO" style:UIBarButtonItemStylePlain target:self action:@selector(barItemEditAction:)];
    self.navigationItem.rightBarButtonItems = @[editItem,doneItem];
    
    UIBarButtonItem *lefteditItem = [[UIBarButtonItem alloc]initWithTitle:@"GCD" style:UIBarButtonItemStylePlain target:self action:@selector(leftbarItemEditAction:)];
    self.navigationItem.leftBarButtonItem = lefteditItem;
//    TFY_GCD_QUEUE_TIME(2, ^{
//        [self addTextView];
//    });
    
    _tagViews = [NSMutableArray new];
    
    self.tagCollectionView.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(TFY_Height_H()/3);
    });
    
    self.textTagCollectionView2.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.tagCollectionView.mas_bottom).offset(20);
        make.bottom.equalTo(self.view).offset(-TFY_kBottomBarHeight());
    });
    
    _tags = @[
            @"AutoLayoutAutoLayoutAutoLayoutAutoLayoutAutoLayoutAutoLayoutAutoLayoutAutoLayoutAutoLayout",
            @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
            @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
            @"on", @"constraints", @"placed", @"on", @"those", @"views",
            @"For", @"example", @"you", @"can", @"constrain", @"a", @"button",
            @"so", @"that", @"it", @"is", @"horizontally", @"centered", @"with",
            @"an", @"Image", @"view", @"and", @"so", @"that", @"the", @"button’s",
            @"top", @"edge", @"always", @"remains", @"8", @"points", @"below", @"the",
            @"image’s", @"bottom", @"If", @"the", @"image", @"view’s", @"size", @"or",
            @"position", @"changes", @"the", @"button’s", @"position", @"automatically", @"adjusts", @"to", @"match"
    ];
    
    TFY_TextTagStringContent *content = [TFY_TextTagStringContent new];
    TFY_TextTagStringContent *selectedContent = [TFY_TextTagStringContent new];
    TFY_TextTagStyle *style = [TFY_TextTagStyle new];
    TFY_TextTagStyle *selectedStyle = [TFY_TextTagStyle new];
    // Style2
    content.textFont = [UIFont systemFontOfSize:18.0f];
    selectedContent.textFont = [UIFont systemFontOfSize:20.0f];

    content.textColor = [UIColor whiteColor];
    selectedContent.textColor = [UIColor greenColor];

    style.extraSpace = CGSizeMake(12, 12);
    selectedStyle.extraSpace = CGSizeMake(12, 12);
    
    style.backgroundColor = [UIColor colorWithRed:0.10 green:0.53 blue:0.85 alpha:1.00];
    selectedStyle.backgroundColor = [UIColor colorWithRed:0.21 green:0.29 blue:0.36 alpha:1.00];
    
    style.cornerRadius = 12.0f;
    style.cornerBottomRight = true;
    style.cornerBottomLeft = false;
    style.cornerTopRight = false;
    style.cornerTopLeft = true;

    selectedStyle.cornerRadius = 8.0f;
    selectedStyle.cornerBottomRight = true;
    selectedStyle.cornerBottomLeft = false;
    selectedStyle.cornerTopRight = true;
    selectedStyle.cornerTopLeft = false;
    
    style.borderWidth = 1;
    selectedStyle.borderWidth = 4;
    
    style.borderColor = [UIColor redColor];
    selectedStyle.borderColor = [UIColor orangeColor];

    style.shadowColor = [UIColor blackColor];
    style.shadowOffset = CGSizeMake(0, 4);
    style.shadowOpacity = 0.3f;
    style.shadowRadius = 4;

    selectedStyle.shadowColor = [UIColor redColor];
    selectedStyle.shadowOffset = CGSizeMake(0, 1);
    selectedStyle.shadowOpacity = 0.3f;
    selectedStyle.shadowRadius = 2;

    NSMutableArray *tags = [NSMutableArray new];
    for (NSString *string in _tags) {
        TFY_TextTagStringContent *stringContent = [content copy];
        stringContent.text = string;
        TFY_TextTagStringContent *selectedStringContent = [selectedContent copy];
        selectedStringContent.text = [string stringByAppendingString:@"!"];
        TFY_TextTag *tag = [TFY_TextTag new];
        tag.content = stringContent;
        tag.selectedContent = selectedStringContent;
        tag.style = style;
        tag.selectedStyle = selectedStyle;
        [tags addObject:tag.copy];
    }
    [_textTagCollectionView2 addTags:tags];

    [_textTagCollectionView2 updateTagAtIndex:0 selected:YES];
    [_textTagCollectionView2 updateTagAtIndex:4 selected:YES];
    [_textTagCollectionView2 updateTagAtIndex:6 selected:YES];
    [_textTagCollectionView2 updateTagAtIndex:17 selected:YES];
    
    [_textTagCollectionView2 reload];
    
    
    UIColor *backgroundColor1 = [UIColor colorWithRed:0.30 green:0.72 blue:0.53 alpha:1.00];
    UIColor *backgroundColor2 = [UIColor colorWithRed:0.10 green:0.53 blue:0.85 alpha:1.00];
    UIColor *backgroundColor3 = [UIColor colorWithRed:0.97 green:0.64 blue:0.27 alpha:1.00];
    
    [_tagViews addObject:[self newLabelWithText:@"AutoLayout" fontSize:14.0f textColor:[UIColor whiteColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button1" fontSize:18.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_1"]]];
    [_tagViews addObject:[self newLabelWithText:@"dynamically" fontSize:20.0f textColor:[UIColor whiteColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button2" fontSize:16.0f backgroundColor:backgroundColor3]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button3" fontSize:15.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_2"]]];
    [_tagViews addObject:[self newLabelWithText:@"the" fontSize:16.0f textColor:[UIColor blackColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button4" fontSize:22.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_3"]]];
    [_tagViews addObject:[self newLabelWithText:@"views" fontSize:12.0f
                                      textColor:[UIColor colorWithRed:0.21 green:0.29 blue:0.36 alpha:1.00]
                                backgroundColor:backgroundColor3]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button5" fontSize:15.0f backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_4"]]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_4"]]];

    [_tagCollectionView reload];
}

- (void)yyyyyyy {
    [TFY_GCDQueue executeInGlobalQueue:^{
      
      //处理业务逻辑
      NSString *url = @"https://tj-data-bak-to-test20221028.oss-cn-hangzhou.aliyuncs.com/uploadFiles/images/avatar/5ccc935c-23b6-4b1d-86a7-60b82863ca5b.png";
      NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
      NSData *picData = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:nil
                                                          error:nil];
      NSLog(@"处理业务逻辑");
      //获取图片；
      self.image = [UIImage imageWithData:picData];
      [TFY_GCDQueue executeInMainQueue:^{
        
        NSLog(@"更新UI");
        //更新UI
        [self.imageView setImage:self.image];
      }];
    }];
      
      //主线程；
      [TFY_GCDQueue executeInMainQueue:^{
        NSLog(@"GCD实现延迟操作");
      } afterDelaySecs:2.f];
}

- (TFY_TagCollectionView *)tagCollectionView {
    if (!_tagCollectionView) {
        _tagCollectionView = [[TFY_TagCollectionView alloc] initWithFrame:CGRectMake(0, 0, TFY_Width_W(), TFY_Height_H()/3)];
        _tagCollectionView.delegate = self;
        _tagCollectionView.dataSource = self;
    }
    return _tagCollectionView;
}

- (TFY_TextTagCollectionView *)textTagCollectionView2 {
    if (!_textTagCollectionView2) {
        _textTagCollectionView2 = TFY_TextTagCollectionView.new;
        _textTagCollectionView2.delegate = self;
        _textTagCollectionView2.showsVerticalScrollIndicator = NO;
        _textTagCollectionView2.horizontalSpacing = 8;
        _textTagCollectionView2.verticalSpacing = 8;
        _textTagCollectionView2.alignment = TagCollectionAlignmentFillByExpandingWidthExceptLastLine;
    }
    return _textTagCollectionView2;
}

- (void)ggggggggggg {
    self.view1 = [self setImageViewFrame:CGRectMake(0, 0, 300, 200)];
    self.view2 = [self setImageViewFrame:CGRectMake(0, 200, 300, 200)];
    self.view3 = [self setImageViewFrame:CGRectMake(0, 400, 300, 200)];
    
    NSString *url01 = @"https://tj-data-bak-to-test20221028.oss-cn-hangzhou.aliyuncs.com/uploadFiles/images/avatar/5ccc935c-23b6-4b1d-86a7-60b82863ca5b.png";
    NSString *url02 = @"https://tj-data-bak-to-test20221028.oss-cn-hangzhou.aliyuncs.com/uploadFiles/images/avatar/5ccc935c-23b6-4b1d-86a7-60b82863ca5b.png";
    NSString *url03 = @"https://tj-data-bak-to-test20221028.oss-cn-hangzhou.aliyuncs.com/uploadFiles/images/avatar/5ccc935c-23b6-4b1d-86a7-60b82863ca5b.png";

    TFY_GCDSemaphore *semaphore = [[TFY_GCDSemaphore alloc] init];
    TFY_GCDSemaphore *semaphore2 = [[TFY_GCDSemaphore alloc] init];
    
    //开启三个异步线程；
    [TFY_GCDQueue executeInGlobalQueue:^{
      
      UIImage *image01 = [self accessDataByNetwork:url01];
      [TFY_GCDQueue executeInMainQueue:^{
        
        [UIView animateWithDuration:2.0f
                         animations:^{
                           self.view1.image = image01;
                           [self.view1 setAlpha:1.0f];
                         } completion:^(BOOL finished) {
                           //通知第1个信号量；
                           [semaphore signal];
                         }];
      }];
    }];

    [TFY_GCDQueue executeInGlobalQueue:^{
      
      UIImage *image02 = [self accessDataByNetwork:url02];
      //第1个信号量等待；
      [semaphore wait];
      [TFY_GCDQueue executeInMainQueue:^{
        
        [UIView animateWithDuration:2.0f
                         animations:^{
                           self.view2.image = image02;
                           [self.view2 setAlpha:1.0f];
                         } completion:^(BOOL finished) {
                           //通知第2个信号量；
                           [semaphore2 signal];
                         }];
      }];
    }];
    
    [TFY_GCDQueue executeInGlobalQueue:^{
      
      UIImage *image03 = [self accessDataByNetwork:url03];
      //第2个信号量等待；
      [semaphore2 wait];
      [TFY_GCDQueue executeInMainQueue:^{
        
        [UIView animateWithDuration:2.0f
                         animations:^{
                           self.view3.image = image03;
                           [self.view3 setAlpha:1.0f];
                         } completion:^(BOOL finished) {
                           
                         }];
      }];
    }];
}

- (void)ffffffffff {
    //  //创建信号量
    TFY_GCDSemaphore *semaphore = [[TFY_GCDSemaphore alloc] init];
      //线程1； - 异步
      //无法确定这两个线程哪个先执行，因为是异步线程。
      [TFY_GCDQueue executeInGlobalQueue:^{

        NSLog(@"线程1");
        //发送信号量；
        [semaphore signal];
      }];
      //线程1； - 异步
      [TFY_GCDQueue executeInGlobalQueue:^{
        
        //等待信号；
        [semaphore wait];
        NSLog(@"线程2");
      }];
}

- (void)runGCDTimer{
  //初始化定时器
  self.timer = [[TFY_GCDTimer alloc] initInQueue:[TFY_GCDQueue mainQueue]];
  //指定时间间隔以及要执行的事件；
  [self.timer event:^{
    //在这里写入需要重复执行的代码；
    NSLog(@"GCD定时器");
  } timeIntervalWithSecs:1.f];
  //运行
  [self.timer start];
}

- (void)ssssssss1 {
    //初始化线程组；
    TFY_GCDGroup *group = [[TFY_GCDGroup alloc] init];
    //创建一个线程队列；
    TFY_GCDQueue *queue = [[TFY_GCDQueue alloc] initConcurrent];
    //让线程在group中执行；(线程1)
    [queue execute:^{

      sleep(1);//延迟1s；
      NSLog(@"线程1执行完毕");
    } inGroup:group];
    //让线程在group中执行；（线程2）
    [queue execute:^{

      sleep(3);//延迟3s；
      NSLog(@"线程2执行完毕");
    } inGroup:group];
    
    //监听线程组是否执行结束，然后执行线程3；
    [queue notify:^{
      NSLog(@"线程3执行完毕");
    } inGroup:group];
}

//并发队列；
- (void)concurrent{
  //创建出队列；
    TFY_GCDQueue *queue = [[TFY_GCDQueue alloc] initConcurrent];
  
  //执行队列中的线程；
  [queue execute:^{
    
    NSLog(@"1");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"2");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"3");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"4");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"5");
    
  }];
  
}



//串行队列；
- (void)serailQueue{

  //创建出队列；
    TFY_GCDQueue *queue = [[TFY_GCDQueue alloc] initSerial];
  
  //执行队列中的线程；
  [queue execute:^{
    
    NSLog(@"1");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"2");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"3");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"4");
    
  }];
  
  
  [queue execute:^{
    
    NSLog(@"5");
    
  }];
  
}

//设置图片大小位置和透明度；alpha = 0表示完全透明；
- (UIImageView *)setImageViewFrame:(CGRect)frame{
  
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
  imageView.alpha = 0.f;
    imageView.backgroundColor = UIColor.redColor;
  [self.view addSubview:imageView];
  return imageView;
}

//进行网络请求；
- (UIImage *)accessDataByNetwork:(NSString *)string{

  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
  
  return [UIImage imageWithData:data];
}


- (void)addTextView {
    TFY_TextView *textView = [[TFY_TextView alloc]initWithFrame:CGRectMake(0, TFY_kNavBarHeight(), CGRectGetWidth(self.view.frame), 250)];
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:16];
    textView.ignoreAboveTextRelatedPropertys = YES;
    textView.attributedText = [self attributedString];
    textView.layer.borderWidth = 1.0;
    textView.layer.borderColor = [UIColor blackColor].CGColor;
    textView.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:textView];
    _textView = textView;
}

- (NSMutableAttributedString *)attributedString {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]init];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:@"\t\t\t\t蒹葭-云歌\n"];
    attString.tfy_color = TFY_ColorRGB(51, 51, 51);
    NSRange range = [attString.string rangeOfString:@"蒹葭"];
    [attString tfy_addFont:[UIFont systemFontOfSize:18] range:range];
    [attString tfy_addColor:TFY_ColorRGB(206, 39, 206) range:range];
    [text appendAttributedString:attString];
    
    attString = [[NSMutableAttributedString alloc]initWithString:@"\t蒹葭苍苍，[@]。所谓伊人，在水一方。溯洄从之，道阻且长，溯游从之，宛在水中央。\n\t蒹葭萋萋，白露未晞。[@]，在水之湄。溯洄从之，[@]。溯游从之，宛在水中坻。\n\t[@]，[@]。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，[@]。\n注解:\n\t出自《诗经·国风·秦风》，是一首描写对意中人深深的[@]和求而不得的惆怅的诗。\n"];
    attString.tfy_color = TFY_ColorRGB(51, 51, 51);
    
    NSArray *array = [self matcheInString:attString.string regularExpressionWithPattern:@"\\[@\\]"];
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult *match, NSUInteger idx, BOOL * _Nonnull stop) {
        TFY_TextblanksField *textField = [[TFY_TextblanksField alloc]initWithFrame:CGRectMake(0, 0, 80, 18)];
        textField.textColor = [UIColor colorWithRed:255.0/255 green:155.0/255 blue:26.0/255 alpha:1];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.font = [UIFont systemFontOfSize:16];
        
        TFY_TextAttachment *attachmentView = [[TFY_TextAttachment alloc]init];
        attachmentView.view = textField;
        attachmentView.size = textField.frame.size;
        attachmentView.verticalAlignment = AttachmentAlignmentCenter;
        [attString replaceCharactersInRange:[match range] withAttributedString:[NSAttributedString attributedStringWithAttachment:attachmentView]];
    }];
    range = [attString.string rangeOfString:@"注解:"];
    [attString tfy_addColor:TFY_ColorRGB(209, 162, 74) range:range];
    [attString tfy_addFont:[UIFont systemFontOfSize:17] range:range];
    
    range = [attString.string rangeOfString:@"《诗经·国风·秦风》"];
    TFY_TextAttribute *textAttribute = [[TFY_TextAttribute alloc] init];
    textAttribute.color = TFY_ColorRGB(209, 162, 74);
    [attString addTextAttribute:textAttribute range:range];
    TFY_TextHighlight *textHighlight = [[TFY_TextHighlight alloc] init];
    textHighlight.color = TFY_ColorRGB(206, 39, 206);
    textHighlight.backgroundColor = [UIColor lightGrayColor];
    [attString addTextHighlightAttribute:textHighlight range:range];
    [text appendAttributedString:attString];
    text.tfy_font = [UIFont systemFontOfSize:16];
    text.tfy_lineSpacing = 2;
    return text;
}

-(NSArray *)matcheInString:(NSString *)string regularExpressionWithPattern:(NSString *)regularExpressionWithPattern
{
    NSError *error;
    NSRange range = NSMakeRange(0,[string length]);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpressionWithPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray* matches = [regex matchesInString:string options:0 range:range];
    return matches;
}

- (void)buttonAction:(UIButton *)sender {
    if (!_textView.editable) {
        return;
    }
    if (![_textView isFocused]) {
        [_textView becomeFirstResponder];
    }
    NSAttributedString *attString = nil;
    if (sender.tag == 0) {
        TFY_TextAttachment *attachMent = [[TFY_TextAttachment alloc]init];
        attachMent.size = CGSizeMake(60, 60);
        attachMent.image = [UIImage imageNamed:@"avatar"];
        //attachMent.verticalAlignment = TYAttachmentAlignmentCenter;
        attString = [NSAttributedString attributedStringWithAttachment:attachMent];
    }else if (sender.tag == 1) {
        UISwitch *switchView = [[UISwitch alloc]init];
        TFY_TextAttachment *attachMent = [[TFY_TextAttachment alloc]init];
        attachMent.view = switchView;
        attachMent.size = switchView.bounds.size;
        //attachMent.verticalAlignment = TYAttachmentAlignmentCenter;
        attString = [NSAttributedString attributedStringWithAttachment:attachMent];
    }
    [_textView insertAttributedText:attString];
}

- (void)barItemDoneAction {
    [_textView resignFirstResponder];
}

- (void)barItemEditAction:(UIBarButtonItem *)item {
    if ([item.title isEqualToString:@"Edit:YES"]) {
        _textView.delaysContentTouches = NO;
//        _textView.selectable = NO;
        _textView.editable = NO;
        [_textView resignFirstResponder];
        item.title = @"Edit:NO";
    }else {
        _textView.delaysContentTouches = YES;
        _textView.selectable = YES;
        _textView.editable = YES;
        [_textView becomeFirstResponder];
        item.title = @"Edit:YES";
    }
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscapeRight;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationLandscapeRight;
//}

- (void)leftbarItemEditAction:(UIBarButtonItem *)item {
    [self ggggggggggg];
}

#pragma mark - TagCollectionViewDelegate

- (CGSize)tagCollectionView:(TFY_TagCollectionView *)tagCollectionView sizeForTagAtIndex:(NSUInteger)index {
    CGSize size = _tagViews[index].frame.size;
    return size;
}

- (void)tagCollectionView:(TFY_TagCollectionView *)tagCollectionView didSelectTag:(UIView *)tagView atIndex:(NSUInteger)index {
    NSLog(@"=====:%@",[NSString stringWithFormat:@"Tap tag: %@, at: %ld", tagView.class, (long) index]);
}

#pragma mark - TagCollectionViewDataSource

- (NSUInteger)numberOfTagsInTagCollectionView:(TFY_TagCollectionView *)tagCollectionView {
    return _tagViews.count;
}

- (UIView *)tagCollectionView:(TFY_TagCollectionView *)tagCollectionView tagViewForIndex:(NSUInteger)index {
    return _tagViews[index];
}

#pragma mark - Private methods

- (UILabel *)newLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroudColor {
    UILabel *label = [UILabel new];

    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = backgroudColor;
    [label sizeToFit];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4.0f;

    [self expandSizeForView:label extraWidth:12 extraHeight:8];

    return label;
}

- (UIButton *)newButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroudColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroudColor;
    [button sizeToFit];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;

    [self expandSizeForView:button extraWidth:12 extraHeight:8];

    [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (UIImageView *)newImageViewWithImage:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView sizeToFit];
    return imageView;
}

- (void)expandSizeForView:(UIView *)view extraWidth:(CGFloat)extraWidth extraHeight:(CGFloat)extraHeight {
    CGRect frame = view.frame;
    frame.size.width += extraWidth;
    frame.size.height += extraHeight;
    view.frame = frame;
}

#pragma mark - Action

- (void)onTap:(UIButton *)button {
   
}


@end


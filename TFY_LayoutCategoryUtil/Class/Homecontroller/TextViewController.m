//
//  TextViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2022/4/1.
//  Copyright © 2022 田风有. All rights reserved.
//

#import "TextViewController.h"
#import "TFY_TextblanksField.h"

@interface TextViewController ()
@property (nonatomic, strong) TFY_TextView *textView;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barItemDoneAction)];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"是否编辑:NO" style:UIBarButtonItemStylePlain target:self action:@selector(barItemEditAction:)];
    self.navigationItem.rightBarButtonItems = @[editItem,doneItem];
    
//    TFY_GCD_QUEUE_TIME(2, ^{
//        [self addTextView];
//    });
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

@end


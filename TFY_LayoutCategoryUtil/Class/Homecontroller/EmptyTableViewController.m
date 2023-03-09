//
//  EmptyTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2021/3/13.
//  Copyright © 2021 田风有. All rights reserved.
//

#import "EmptyTableViewController.h"

@interface EmptyTableViewController ()<UITextFieldDelegate>

@end

@implementation EmptyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    for (int i = 0; i < 4; i++)
    {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.frame = CGRectMake(50, 0 + i * 50, 200, 40);
        textfield.layer.cornerRadius = 5;
        textfield.layer.borderColor = [UIColor redColor].CGColor;
        textfield.layer.borderWidth = 1;
        textfield.backgroundColor = [UIColor lightGrayColor];
        textfield.tag = 200 + i;
        textfield.delegate = self;
        textfield.returnKeyType = i==3?UIReturnKeyDefault:UIReturnKeyNext;
        [self.view addSubview:textfield];
    }
    NSArray<NSDictionary *> *titleArr = @[
        @{@"name":@"+自己配餐",@"image":@"catering_2",@"type":@(ButtonDirectionCenterImageTop)},
        @{@"name":@"+智能配餐",@"image":@"catering_3",@"type":@(ButtonDirectionCenterImageLeft)},
        @{@"name":@"+运动记录",@"image":@"catering_3",@"type":@(ButtonDirectionCenterImageRight)},
        @{@"name":@"+运动记录",@"image":@"catering_2",@"type":@(ButtonDirectionCenterImageBottom)},
        @{@"name":@"+运动记录",@"image":@"catering_2",@"type":@(ButtonDirectionLeftImageLeft)},
        @{@"name":@"+运动记录",@"image":@"catering_3",@"type":@(ButtonDirectionLeftImageRight)},
        @{@"name":@"+运动记录",@"image":@"catering_3",@"type":@(ButtonDirectionRightImageLeft)},
        @{@"name":@"+运动记录",@"image":@"catering_2",@"type":@(ButtonDirectionRightImageRight)}];
    
    CGFloat width_w = TFY_Width_W()/3;
    [titleArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = UIButtonSet();
        NSNumber *number = obj[@"type"];
        btn.makeChain
        .frame(CGRectMake(100, 200+idx * 70 ,width_w, 60))
        .font([UIFont systemFontOfSize:12 weight:UIFontWeightRegular])
        .text(obj[@"name"], UIControlStateNormal)
        .image([UIImage imageNamed:obj[@"image"]], UIControlStateNormal)
        .imageDirection(number.integerValue, 3)
        .textColor(UIColor.blackColor, UIControlStateNormal)
        .backgroundColor(UIColor.orangeColor)
        .makeTag(idx+1)
        .addToSuperView(self.view);
    }];
    
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    if (textField.text.length >= 11) {
        [self textFieldShouldReturn:textField];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField    {
   UIView *superView = [textField superview];
   BOOL foundCurrent = false;
   for (UITextField *tf in superView.subviews) {
      if (foundCurrent) {
         [tf becomeFirstResponder];
         return NO;
      }
     if ([tf isEqual:textField]) {
         foundCurrent = true;
      }
   }
   return YES;
}

@end

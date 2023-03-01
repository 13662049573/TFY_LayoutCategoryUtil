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
        textfield.frame = CGRectMake(50, 300 + i * 50, 200, 40);
        textfield.layer.cornerRadius = 5;
        textfield.layer.borderColor = [UIColor redColor].CGColor;
        textfield.layer.borderWidth = 1;
        textfield.backgroundColor = [UIColor lightGrayColor];
        textfield.tag = 200 + i;
        textfield.delegate = self;
        textfield.returnKeyType = i==3?UIReturnKeyDefault:UIReturnKeyNext;
        [self.view addSubview:textfield];
    }
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

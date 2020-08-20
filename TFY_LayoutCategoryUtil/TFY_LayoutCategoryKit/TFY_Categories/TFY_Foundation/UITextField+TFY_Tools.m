//
//  UITextField+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UITextField+TFY_Tools.h"
#import "UIControl+TFY_Tools.h"
#import <objc/runtime.h>

@implementation UITextField (TFY_Tools)

- (void)tfy_addLeftViewBlock:(UIView * (^) (UITextField *))leftBlock mode:(UITextFieldViewMode)mode{
    if (leftBlock) {
        self.leftView = leftBlock(self);
        self.leftViewMode = mode;
    }
}
- (void)tfy_addRightViewBlock:(UIView * (^) (UITextField *))rightBlock mode:(UITextFieldViewMode)mode{
    if (rightBlock) {
        self.rightView = rightBlock(self);
        self.rightViewMode = mode;
    }
}

- (NSRange)tfy_selectedRange
{
    UITextPosition *beginning = self.beginningOfDocument;
    
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    
    NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)tfy_selectedText
{
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)tfy_setSelectedRange:(NSRange)range
{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


- (void)setTfy_editedText:(void (^)(NSString * _Nonnull))tfy_editedText{
    objc_setAssociatedObject(self, @selector(tfy_editedText), tfy_editedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addObserver];
}

- (void (^)(NSString * _Nonnull))tfy_editedText{
    return objc_getAssociatedObject(self, @selector(tfy_editedText));
}

- (NSUInteger)limitLength{
    return [objc_getAssociatedObject(self, @selector(limitLength)) integerValue];
}

- (void)setLimitLength:(NSUInteger)limitLength{
    objc_setAssociatedObject(self, @selector(limitLength), @(limitLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addObserver];
    
}


- (void)addObserver{
    if ([self tfy_containsEventBlockForKey:NSStringFromClass([self class])]) return;
    __weak typeof(self)weakSelf = self;
    [self tfy_addEventBlock:^(id  _Nonnull sender) {
        [weakSelf textFieldTextDidChange];
    } forEvents:UIControlEventEditingChanged ForKey:NSStringFromClass([self class])];
}

- (void)textFieldTextDidChange{
    NSString *toBeString = self.text;
    NSUInteger limit = self.limitLength;
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    NSInteger loction = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start];
    if (self.tfy_editedText) {
        if (!position) {
            self.tfy_editedText(toBeString);
        }else{
            self.tfy_editedText([toBeString substringToIndex:loction]);
        }
    }
    if (!position && (limit > 0 && toBeString.length > limit)) {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:limit];
        if (rangeIndex.length == 1) {
            self.text = [toBeString substringToIndex:limit];
        }
        else {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, limit)];
            NSInteger tmpLength;
            if (rangeRange.length > limit) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }
            else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }else{
        if (loction >= limit) {
            self.text = [toBeString substringWithRange:NSMakeRange(0, limit)];
        }
    }
}
@end

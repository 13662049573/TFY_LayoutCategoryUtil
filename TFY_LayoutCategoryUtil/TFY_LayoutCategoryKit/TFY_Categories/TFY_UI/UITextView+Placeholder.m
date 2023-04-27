//
//  UITextView+Placeholder.m
//  shore
//
//  Created by 田风有 on 2023/4/27.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

// 占位文字
static const void *PlaceholderViewKey = &PlaceholderViewKey;
// 占位文字颜色
static const void *PlaceholderColorKey = &PlaceholderColorKey;

@implementation UITextView (Placeholder)

+ (void)load {
    // 交换dealoc
    Method dealoc = class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc"));
    Method myDealoc = class_getInstanceMethod(self.class, @selector(myDealoc));
    method_exchangeImplementations(dealoc, myDealoc);
}
 
- (void)myDealoc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    UITextView *placeholderView = objc_getAssociatedObject(self, PlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        NSArray *propertys = @[@"frame", @"bounds", @"font", @"text", @"textAlignment", @"textContainerInset"];
        for (NSString *property in propertys) {
            @try {
                [self removeObserver:self forKeyPath:property];
            } @catch (NSException *exception) {}
        }
    }
    [self myDealoc];
}

#pragma mark - set && get
- (UITextView *)placeholderView {
    
    // 为了让占位文字和textView的实际文字位置能够完全一致，这里用UITextView
    UITextView *placeholderView = objc_getAssociatedObject(self, PlaceholderViewKey);
    
    if (!placeholderView) {
        
        placeholderView = [[UITextView alloc] init];
        placeholderView.hidden = (self.text.length > 0 && self.text);
        // 动态添加属性的本质是: 让对象的某个属性与值产生关联
        objc_setAssociatedObject(self, PlaceholderViewKey, placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        placeholderView = placeholderView;
        
        // 设置基本属性
        self.scrollEnabled = placeholderView.scrollEnabled = placeholderView.showsHorizontalScrollIndicator = placeholderView.showsVerticalScrollIndicator = placeholderView.userInteractionEnabled = NO;
        placeholderView.textColor = [UIColor lightGrayColor];
        placeholderView.backgroundColor = [UIColor clearColor];
        [self refreshPlaceholderView];
        [self addSubview:placeholderView];
        
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextChange) name:UITextViewTextDidChangeNotification object:self];
        
        // 这些属性改变时，都要作出一定的改变，尽管已经监听了TextDidChange的通知，也要监听text属性，因为通知监听不到setText：
        NSArray *propertys = @[@"frame", @"bounds", @"font", @"text", @"textAlignment", @"textContainerInset"];
        
        // 监听属性
        for (NSString *property in propertys) {
            [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:nil];
        }
        
    }
    return placeholderView;
}
- (void)setPlaceholder:(NSString *)placeholder
{
    // 为placeholder赋值
    [self placeholderView].text = placeholder;
}
 
- (NSString *)placeholder
{
    // 如果有placeholder值才去调用，这步很重要
    if (self.placeholderExist) {
        return [self placeholderView].text;
    }
    return nil;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    self.placeholderView.textColor = placeholderColor;
    
}
 
- (UIColor *)placeholderColor {
    
    return self.placeholderView.textColor;
}
#pragma mark - KVO监听属性改变
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self refreshPlaceholderView];
    if ([keyPath isEqualToString:@"text"]) [self textViewTextChange];
}
 
- (void)refreshPlaceholderView {
    
    UITextView *placeholderView = objc_getAssociatedObject(self, PlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        self.placeholderView.frame = self.bounds;
        self.placeholderView.font = self.font;
        self.placeholderView.textAlignment = self.textAlignment;
        self.placeholderView.textContainerInset = self.textContainerInset;
    }
}
 
- (void)textViewTextChange {
    UITextView *placeholderView = objc_getAssociatedObject(self, PlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        self.placeholderView.hidden = (self.text.length > 0 && self.text);
    }
    if (!self.isFirstResponder) [self becomeFirstResponder];
}
 
// 判断是否有placeholder值，这步很重要
- (BOOL)placeholderExist {
    
    // 获取对应属性的值
    UITextView *placeholderView = objc_getAssociatedObject(self, PlaceholderViewKey);
    
    // 如果有placeholder值
    if (placeholderView) return YES;
    
    return NO;
}


@end

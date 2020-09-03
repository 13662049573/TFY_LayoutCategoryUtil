//
//  CommonNavigationBar.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2020/9/2.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "CommonNavigationBar.h"

@interface CommonNavigationBar (){
    CGFloat _lineHeight;
}
TFY_PROPERTY_OBJECT_STRONG(UIView, leftView);
TFY_PROPERTY_OBJECT_STRONG(UIView, rightView);
TFY_PROPERTY_NSArray(buttonClass);
TFY_PROPERTY_NSMutableDictionary(statusDic);
TFY_PROPERTY_NSInteger(currentTag);

@end

@implementation CommonNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _lineHeight = 0.5;
    _currentTag = -999;
    self.backgroundColor = [UIColor whiteColor];
    if ([self.delegate respondsToSelector:@selector(navigationClick:)]) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(naviTap)]];
    }
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(_lineHeight);
    }];
}

- (void)naviTap{
    [self.delegate navigationClick:self];
}

- (NSMutableDictionary *)statusDic{
    if (!_statusDic) {
        _statusDic = [NSMutableDictionary dictionary];
    }
    return _statusDic;
}



- (void)setDelegate:(id<CommonNavigationBarDelegate>)delegate{
    if (!delegate) return;
    _delegate = delegate;
    if ([_delegate respondsToSelector:@selector(buttonClasses)]) {
        self.buttonClass = [delegate buttonClasses];
    }else{
        self.buttonClass = @[@"",@"",@""];
    }
}

- (UIButton *)leftButton{
    if (!_leftButton && _delegate) {
        _leftButton = [[self getButtonClassIndex:0] buttonWithType:UIButtonTypeCustom];
        _leftButton.makeChain
        .textColor(TFY_ColorHexString(@"666666"), UIControlStateNormal)
        .font([UIFont tfy_PingFangSCRegularAndSize:17])
        .userInteractionEnabled(NO)
        .addToSuperView(self.leftView)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(15);
            make.centerY.equalTo(self.leftView);
            make.right.mas_offset(-20);
        });
        [_leftButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _leftButton;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
        _leftView.makeChain
        .addToSuperView(self)
        .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewTap)])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(0);
            make.bottom.mas_offset(-self->_lineHeight);
            make.top.mas_offset(kStatusBarHeight);
            make.width.lessThanOrEqualTo(@(100));
        });
     
    }
    return _leftView;
}

- (void)leftViewTap{
    if ([self.delegate respondsToSelector:@selector(leftButtonTap:)]) {
        [self.delegate leftButtonTap:self.leftButton];
    }
}

- (UIButton *)middleButton{
    if (!_middleButton) {
        _middleButton = [[self getButtonClassIndex:1] buttonWithType:UIButtonTypeCustom];
        _middleButton.makeChain
        .font([UIFont tfy_PingFangSCRegularAndSize:17])
        .textColor(TFY_ColorHexString(@"1a1d1e"), UIControlStateNormal)
        .addToSuperView(self)
        .addTarget(self, @selector(middleButtonTap), UIControlEventTouchUpInside)
        .lineBreakMode(NSLineBreakByWordWrapping)
        .numberOfLines(1)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.equalTo(self);
            make.width.lessThanOrEqualTo(@(TFY_Width_W() - 200 *TFY_SCALE()));
            make.top.mas_offset(kStatusBarHeight);
            make.bottom.mas_offset(-self->_lineHeight);
        });
    }
    return _middleButton;
}


- (void)middleButtonTap{
    if ([self.delegate respondsToSelector:@selector(middleButtonTap:)]) {
        [self.delegate middleButtonTap:self.middleButton];
    }
}

- (UIButton *)rightButton{
    if (!_rightButton && _delegate) {
        _rightButton = [[self getButtonClassIndex:2] buttonWithType:UIButtonTypeCustom];
        _rightButton.makeChain
        .textColor(TFY_ColorHexString(@"474747"), UIControlStateNormal)
        .font([UIFont tfy_PingFangSCRegularAndSize:17])
        .userInteractionEnabled(NO)
        .addToSuperView(self.rightView)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(20);
            make.centerY.equalTo(self.rightView);
            make.right.mas_offset(-15);
        });
        [_rightButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _rightButton;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
        _rightView.makeChain
        .addToSuperView(self)
        .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewTap)])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.right.mas_offset(0);
            make.bottom.mas_offset(-self->_lineHeight);
            make.top.mas_offset(kStatusBarHeight);
            make.width.lessThanOrEqualTo(@(100 *TFY_SCALE()));
        });
        
    }
    return _rightView;
}

- (void)rightViewTap{
    if ([self.delegate respondsToSelector:@selector(rightButtonTap:)]) {
        [self.delegate rightButtonTap:self.rightButton];
    }
}

- (Class)getButtonClassIndex:(NSInteger)index{
    if (self.buttonClass.count <= index || index < 0) return [UIButton class];
    
    NSString *clas = self.buttonClass[index];
    Class class;
    if (clas.length == 0) {
        class = [UIButton class];
    }else{
        class = NSClassFromString(clas);
        if (!class || ![class isKindOfClass:[UIButton class]]) {
            class = [UIButton class];
        }
    }
    return class;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new].makeChain
        .backgroundColor(TFY_ColorHexString(@"dbdbdb"))
        .addToSuperView(self).view;
    }
    return _line;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([self.delegate respondsToSelector:@selector(navigationEventsShoulass)]) {
        if ([self.delegate navigationEventsShoulass]) {
            if (hitView == self) {
                return nil;
            }
        }
    }
    return hitView;
}

- (void)setTag:(NSInteger)tag{
    if (self.currentTag == tag) return;
    nav_Block block = _statusDic[@(tag)];
    if (block) {
        self.currentTag = tag;
        block(self);
    }
}

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block{
    if (block) {
        [self.statusDic setObject:block forKey:@(tag)];
    }else{
        [self.statusDic removeObjectForKey:@(tag)];
    }
}


- (void)resetLayout:(UIEdgeInsets)edge{
    
    [self.line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(edge.left);
        make.right.mas_offset(-edge.right);
    }];
    [self.middleButton mas_updateConstraints:^(MASConstraintMaker *make) {
       make.top.mas_offset(kStatusBarHeight);
    }];
    [self.leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kStatusBarHeight);
        make.left.mas_offset(edge.left);
    }];
    [self.rightView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kStatusBarHeight);
        make.right.mas_offset(-edge.right);
    }];
}


@end

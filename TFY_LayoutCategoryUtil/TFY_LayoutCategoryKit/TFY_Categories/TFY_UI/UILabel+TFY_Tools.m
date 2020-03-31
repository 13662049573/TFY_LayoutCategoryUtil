//
//  UILabel+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UILabel+TFY_Tools.h"
#import "NSString+TFY_Tools.h"

@implementation UILabel (TFY_Tools)

- (CGSize)sizeWithoutLimitSize{
    return [self sizeWithLimitSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (CGSize)sizeWithLimitSize:(CGSize)size{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font} limitSize:size];
}
@end

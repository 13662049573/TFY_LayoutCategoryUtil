//
//  UILabel+TFY_Tools.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "UILabel+TFY_Tools.h"

@implementation UILabel (TFY_Tools)

- (CGSize)sizeWithoutLimitSize{
    return [self sizeWithLimitSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (CGSize)sizeWithLimitSize:(CGSize)size{
    CGRect strRect = [self.text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.font} context:nil];
    return strRect.size;
}
@end

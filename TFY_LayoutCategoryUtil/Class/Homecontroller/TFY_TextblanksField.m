//
//  TFY_TextblanksField.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2022/4/1.
//  Copyright © 2022 田风有. All rights reserved.
//

#import "TFY_TextblanksField.h"

@implementation TFY_TextblanksField

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画一条底部线
    CGContextSetRGBStrokeColor(context, 13/255, 14/255, 1113/255, 1);//线条颜色
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width,rect.size.height);
    CGContextStrokePath(context);
}

@end

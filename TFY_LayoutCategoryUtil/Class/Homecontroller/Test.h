//
//  Test.h
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2023/2/1.
//  Copyright © 2023 田风有. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct
{
    int i;
    double j;
    long k;
} YY;


@interface Test : NSObject

+ (NSArray *)test:(id)test p1:(NSString *)p1 p2:(unsigned int)p2 p3:(double)p3 p4:(CGSize)p4 p5:(NSNull *)p5 p6:(void(^)(void))p6 p7:(BOOL)p7 p8:(char)p8 p9:(char *)p9 p10:(YY)p10 p11:(SEL)p11 p12:(void **)p12 p13:(void ***)p13 p14:(Class)p14 p15:(IMP)p15;

+ (void)test:(int)i;
+ (int)testReturnInt;
+ (double)testReturnDouble;
+ (char)testReturnChar;
+ (char *)testReturnStr;
+ (char **)testReturnP;
+ (Class)testReturnClass;
+ (IMP)testReturnIMP;
+ (SEL)testReturnSEL;
+ (CGSize)testReturnCGSize;
+ (void(^)(void))testReturnBlock;
+ (YY)testReturnStruct;

- (void)test;

@end

NS_ASSUME_NONNULL_END

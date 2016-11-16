//
//  AppUtils.m
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

+(CAGradientLayer *)getGradientLayer:(CGRect)rect{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = rect;
    gradient.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,
                       (id)[UIColor grayColor].CGColor,
                       (id)[UIColor clearColor].CGColor,nil];
    return gradient;
}

@end

//
//  Device.m
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/17.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "Device.h"

@implementation Device

- (NSString *)description
{
    return [NSString stringWithFormat:@"device age = %@,name = %@,sex = %@,height = %@", self.age,self.name,self.sex,self.height];
}

@end

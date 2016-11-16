//
//  ActionBar.h
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import <UIKit/UIKit.h>


//  下方标签栏
@interface ActionBar : UIView

@property (nonatomic, strong) NSArray *items;

@property(nonatomic,assign)BOOL isGradientLine;

@end

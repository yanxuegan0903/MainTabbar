//
//  MaintabbarController.h
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaintabbarController : UITabBarController

@property(nonatomic,assign)BOOL supportOrientation;

- (void)setSelectedIndex:(NSUInteger)selectedIndex;  // 选中按钮方法


@end

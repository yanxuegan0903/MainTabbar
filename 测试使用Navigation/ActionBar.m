//
//  ActionBar.m
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "ActionBar.h"
#import "Masonry.h"
#import "AppUtils.h"



@implementation ActionBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}


-(void)setItems:(NSArray *)items
{
    _items = items;
    UIView *lastView;
    UIView *lastItem;
    for (UIView *item in items)
    {
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            
            if (lastView)
            {
                make.left.equalTo(lastView.mas_right);
            }else
            {
                make.left.mas_equalTo(0);
            }
            
            if (item == [items lastObject])
            {
                make.right.mas_equalTo(0);
            }
            
            if (lastItem)
            {
                make.width.equalTo(lastItem.mas_width);
            }
        }];
        lastItem = item;
        /**
         *  隐藏按钮之间的分割线
         */
        if (items.count != 1)
        {
            if (item != [items lastObject])
            {
                UIView *line = [UIView new];
                line.hidden = YES;
                [self addSubview:line];
                if (self.isGradientLine)
                {
                    CAGradientLayer *lineLayer = [AppUtils getGradientLayer:CGRectMake(0, 5, 1, 36)];
                    [line.layer addSublayer:lineLayer];
                }else
                {
                    line.backgroundColor = [UIColor grayColor];
                }
                
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                    make.width.mas_equalTo(0.5);
                    make.bottom.mas_equalTo(0);
                    make.left.equalTo(item.mas_right);
                }];
                lastView = line;
            }
        }
        
    }

}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (!self.isGradientLine)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0.5);
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, rect.size.width,0);
        CGContextStrokePath(context);
    }
}

@end

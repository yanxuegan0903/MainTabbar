//
//  MaintabbarController.m
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "MaintabbarController.h"
#import "BaseNavigationController.h"
#import "VC1.h"
#import "VC2.h"
#import "VC3.h"
#import "ActionBar.h"
#import "Masonry.h"

@interface MaintabbarController ()

@property (nonatomic, strong) ActionBar *actionBar;

@end

@implementation MaintabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _supportOrientation = NO;
    VC1 * vc1 = [VC1 new];
    BaseNavigationController * nc1 = [[BaseNavigationController alloc]initWithRootViewController:vc1];
    VC2 * vc2 = [VC2 new];
    BaseNavigationController * nc2 = [[BaseNavigationController alloc]initWithRootViewController:vc2];
    VC3 * vc3 = [VC3 new];
    BaseNavigationController * nc3 = [[BaseNavigationController alloc]initWithRootViewController:vc3];
    
    [self setViewControllers:@[nc1,nc2,nc3]];
    
//    self.tabBar.backgroundImage = [UIImage imageFromColor:[UIColor clearColor]];
//    self.tabBar.shadowImage = [UIImage imageFromColor:[UIColor clearColor]];

    self.tabBar.backgroundColor = [UIColor clearColor];
    
    
    ActionBar * bottomBar = [[ActionBar alloc]initWithFrame:CGRectMake(0, 0, self.tabBar.bounds.size.width, self.tabBar.bounds.size.height)];
    bottomBar.backgroundColor = [UIColor whiteColor];
    bottomBar.userInteractionEnabled = YES;
    [self.tabBar addSubview:bottomBar];
    self.actionBar = bottomBar;
    
    NSArray * images = [self images];
    NSArray * selectImages = [self selectImages];
    NSArray * titles = [self titles];
    
    NSMutableArray * items = [NSMutableArray new];
    
    for (int i = 0; i<images.count; i++) {
        [items addObject:[self createBarItem:images[i] selectedImage:selectImages[i] title:titles[i]]];
    }
    [bottomBar setItems:items];
    
    [self setSelectedIndex:0];
    
}

-(UIView *)createBarItem:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    UIButton *button = [UIButton new];
    
    [button addTarget:self action:@selector(selectBarItem:) forControlEvents:UIControlEventTouchDown];
    
    
    
    UILabel *label = [UILabel new];
    label.tag = 1;
    label.text = title;
    label.textColor = [UIColor grayColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-2);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    label.font = [UIFont systemFontOfSize:11];
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:image];
    [button addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 2;
    
    return button;
}

/**
 *  选中按钮处理事件
 */
-(void)selectBarItem:(UIButton *)buttom
{
    NSInteger i = [self.actionBar.items indexOfObject:buttom];
    [self setSelectedIndex:i];
}

/**
 *  修改选中按钮字的显隐性
 */
-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    for (UIButton *button in self.actionBar.items)
    {
        NSInteger i = [self.actionBar.items indexOfObject:button];
        if (i == selectedIndex)
        {
            [button setSelected:YES];
        }else
        {
            [button setSelected:NO];
        }
        
        UILabel *label = (UILabel *)[button viewWithTag:1];
        label.alpha = button.selected ? (1):(0.6);
        
        label.textColor = button.selected ? [UIColor blueColor] : [UIColor grayColor];
        
        UIImageView *imageView = (UIImageView *)[button viewWithTag:2];
        
        imageView.image = button.selected ? [UIImage imageNamed:[[self selectImages] objectAtIndex:i]] : [UIImage imageNamed:[[self images] objectAtIndex:i]];
    }
    [super setSelectedIndex:selectedIndex];
}
-(NSArray *)images
{
    return @[@"tab_icon_camera_un_sel",@"tab_icon_family_zone_un_sel",@"tab_icon_steward_un_sel"];
}
-(NSArray *)selectImages
{
    return @[@"tab_icon_camera_sel",@"tab_icon_family_zone_sel",@"tab_icon_steward_sel"];
}
-(NSArray *)titles
{
    return @[@"VC1",@"VC2",@"VC3"];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate
{
    return _supportOrientation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  VC1.m
//  测试使用Navigation
//
//  Created by vsKing on 2016/11/16.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "VC1.h"
#import "PushVC.h"
#import "Device.h"
#import <objc/runtime.h>// 导入运行时文件



@interface VC1 ()

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    self.view.alpha = 0.5;
    
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 80, 45)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    
    
    
    
    NSDictionary * dic = @{
                           
                           @"name":@"john",
                           @"sex":@"man",
                           @"age":@18,
                           @"height":@180
                           };
    
    
    
    
    Device * device = [Device new];
    
    
    
    NSArray * propertys = [self getProperties:[device class]];
    for (NSString * key in dic)
    {
        if ([propertys containsObject:key])
        {
            [device setValue:dic[key] forKeyPath:key];
        }
    }
    
    NSLog(@"%@",device);

}



- (NSArray*)getProperties:(Class)cls{
    
    // 获取当前类的所有属性
    unsigned int count;// 记录属性个数
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    // 遍历
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    
    return mArray.copy;
}



-(void)clickBtn:(UIButton *)sender
{
    PushVC * vc = [PushVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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

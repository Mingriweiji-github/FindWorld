//
//  ZhuceViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ZhuceViewController.h"

@interface ZhuceViewController ()

@end

@implementation ZhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"LastMinute_TitleBar_375"];
    
    UIGraphicsBeginImageContext(CGSizeMake(kScreenWidth, kScreenHeight));
    [image drawInRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    //头部
    [self _initHeaderView];

#warning 数据持久化测试代码
    
    
    
}
//头部
- (void)_initHeaderView
{
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 30, 35, 35);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_pic.jpg"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftBtn];
}
- (void)backBtnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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

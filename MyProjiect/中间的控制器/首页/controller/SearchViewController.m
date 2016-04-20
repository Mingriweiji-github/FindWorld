//
//  SearchViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SearchViewController.h"
#import "YoulunViewController.h"
#import "FlightViewController.h"
#import "FreeViewController.h"
#import "SecureViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //隐藏导航栏返回的按钮
    self.navigationItem.hidesBackButton=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.alpha=0.8;
    //创建视图
    [self _initViews];
    
    
}

- (void)_initViews
{
   
    //取消按钮
    _cancle=[UIButton buttonWithType:UIButtonTypeCustom];
    _cancle.frame=CGRectMake(kScreenWidth-60, 10, 50, 25);
    [_cancle setTitle:@"取消" forState:UIControlStateNormal];
    [_cancle addTarget:self action:@selector(cancleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_cancle];
    
    //热门搜索
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 30, 150, 30)];
    
    label.text=@"热门搜索";
    label.font=[UIFont boldSystemFontOfSize:18];
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
    
    //循环创建button
    self.data= @[@"邮轮",
                 @"租车",
                 @"保险",
                 @"当地游",
                 @"欧铁票",
                 @"香港",
                 @"台湾",
                 @"泰国",
                 @"日本",
                 @"韩国",
                 @"新加坡",
                 @"马尔代夫",
                 @"澳大利亚"
                 ];
    for (int i = 0; i < _data.count; i ++) {
        
        NSInteger row = i / 4 ;
        NSInteger colum = i % 4;

        int width = kScreenWidth / 4 - 3 * 5;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake( colum * width + 5 , row * 50 +20+40, width, 50);
        [btn setTitle:[NSString stringWithFormat:@"%@",_data[i]] forState:UIControlStateNormal];
        btn.tag = 100 +i;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];

        
    }
}

- (void)cancleClick:(UIButton *)btn
{
    
    [_searchTF resignFirstResponder];
    
    [_searchTF removeFromSuperview];
    
    [_cancle removeFromSuperview];
    
    [self.navigationController popViewControllerAnimated:YES];

    
}
- (void)buttonClick:(UIButton *)btn
{
    NSInteger index =  btn.tag -100;
    
    if (index == 0) {
        //邮轮
        YoulunViewController *youVC=[[YoulunViewController alloc] init];
        youVC.navigationController.navigationBarHidden = YES;
        youVC.navigationItem.hidesBackButton=YES;
        
        [self.navigationController pushViewController:youVC animated:YES];
        
    }if (index == 1) {
        //租车
        FreeViewController *freeVC=[[FreeViewController alloc] init];
        freeVC.navigationController.navigationBarHidden = YES;
        freeVC.navigationItem.hidesBackButton=YES;
        
        [self.navigationController pushViewController:freeVC animated:YES];
        
    }if (index == 2) {
        //保险
        SecureViewController *secureVC=[[SecureViewController alloc] init];
        secureVC.navigationController.navigationBarHidden = YES;
        secureVC.navigationItem.hidesBackButton=YES;
        
        [self.navigationController pushViewController:secureVC animated:YES];
        
    }if (index == 3) {
        //当地游
        FlightViewController *flightVC=[[FlightViewController alloc] init];
        flightVC.navigationController.navigationBarHidden = YES;
        flightVC.navigationItem.hidesBackButton=YES;
        
        [self.navigationController pushViewController:flightVC animated:YES];
        
    }if (index == 4) {
        //哦贴票
        
    }if (index == 5) {
        //香港
        
    }if (index == 6) {
        //台湾
        
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    _cancle.hidden=YES;
    [_searchTF removeFromSuperview];

}

- (void)viewWillAppear:(BOOL)animated
{
    //头部
    _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(45, 10, kScreenWidth-100, 30)];
    _searchTF.placeholder=@"输入你想要的折扣";
    _searchTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTF.borderStyle = UITextBorderStyleRoundedRect;
    [_searchTF becomeFirstResponder];
    [self.navigationController.navigationBar addSubview:_searchTF];
    
    _cancle.hidden=NO;
    _searchTF.hidden = NO;
//    [_searchTF becomeFirstResponder];

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

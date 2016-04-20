//
//  BaseViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchViewController.h"
@interface BaseViewController ()
{
    UIButton *backBtn;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //二级界面的返回按钮
    backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    backBtn.frame=CGRectMake(10, 10, 35, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_pic.jpg"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.backgroundColor=[UIColor orangeColor];
    backBtn.hidden = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    if (self.navigationController.viewControllers.count >= 2) {

        backBtn.hidden = NO;

    }else{
    
        backBtn.hidden = YES;
        

    }
    

}
#pragma mark //加载提示
- (void)showHud:(NSString *)title
{
    if (_hud == nil) {
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    
    //背景
    _hud.dimBackground=YES;
    
    //设置文本
    _hud.labelText=title;
    
}
#pragma mark 加载完成提示
- (void)comleteLoading:(NSString *)title
{
    _hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    _hud.mode=MBProgressHUDModeCustomView;
    
    _hud.labelText=title;
    
    [_hud hide:YES afterDelay:1];
}
//二级界面返回
- (void)backBtnClick:(UIButton *)btn
{
//    self.navigationController.
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

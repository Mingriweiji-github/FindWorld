//
//  BaseNavigationController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MainTabBarViewController.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //取消导航栏透明
    self.navigationBar.translucent=NO;
    self.navigationBar.hidden = NO;
    self.delegate=self;
    
    //初始化导航栏
    [self _initNavigationBar];
    
    
}

- (void)_initNavigationBar
{
    UIImage *image=[UIImage imageNamed:@"LastMinute_TitleBar_320.png"];
    
    UIGraphicsBeginImageContext(CGSizeMake(kScreenWidth, 44));
     [image drawInRect:CGRectMake(0, 0, kScreenWidth, 44)];
     image= UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *status = [[UIButton alloc]
                      initWithFrame:CGRectMake(0, -20, kScreenWidth, 20)];
    UIGraphicsBeginImageContext(CGSizeMake(kScreenWidth, 20));
    [image drawInRect:CGRectMake(0, 0, kScreenWidth, 20)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [status setBackgroundImage:image forState:UIControlStateNormal];
    
    [self.navigationBar addSubview:status];
    
    
}

#pragma mark UINavigationControllerDelegate  将要显示视图控制器的方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    MainTabBarViewController *mainTB=(MainTabBarViewController *)self.tabBarController;
    NSInteger count = self.viewControllers.count;
    if (count == 1) {
        
        mainTB.tabBarView.hidden=NO;
        
    }else if(count >= 2){
    
        mainTB.tabBarView.hidden=YES;
    
    
    }
        
    
}



//设置状态栏
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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

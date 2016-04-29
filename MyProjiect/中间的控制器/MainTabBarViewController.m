//
//  MainTabBarViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "WFFirstOpenView.h"
@interface MainTabBarViewController ()
{
    
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //自定义tabBarView
    [self _initTabBarView];
    
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"FrrstLaunch"]) {
        
        NSLog(@"第一次启动");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FrrstLaunch"];
        
        WFFirstOpenView *myView = [[WFFirstOpenView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        
        [self.view addSubview:myView];
        
        
        
    }else{
        
        NSLog(@"不是第一次启动");
        
        
        
    }
}

#pragma mark 自定义tabBarView
- (void)_initTabBarView
{
    //第一步
    self.tabBar.hidden=YES;
    
    //自定义tabBar
    _tabBarView=[[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 55, kScreenWidth, 55)];
    _tabBarView.backgroundColor=[UIColor whiteColor];
    
    
    
    //开启触摸响应
    _tabBarView.userInteractionEnabled = YES;
    
    [self.view addSubview:_tabBarView];
    
    
    //循环创建按钮标签
    NSArray *imageNames = @[@"home_tab_icon_1.png",@"home_tab_icon_2.png",@"home_tab_icon_3.png",@"home_tab_icon_4.png"];
    
    for (int i = 0; i < imageNames.count; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = 100 + i;
        button.frame = CGRectMake(kScreenWidth / 4 * i , 3, kScreenWidth / 4 , 55);
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *imgName=[NSString stringWithFormat:@"%@",imageNames[i]];
        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [_tabBarView addSubview:button];
    }
    
    //创建选中按钮的背景图片
    UIImageView *selectedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 55)];
    selectedImgView.tag = 123;
    selectedImgView.image = [UIImage imageNamed:@"home_bottom_tab_arrow.png"];
    [_tabBarView addSubview:selectedImgView];
    
    
    
}

- (void)buttonAction:(UIButton *)btn
{
    self.selectedIndex = btn.tag - 100;
    UIImageView *selectImageView=(UIImageView *)[_tabBarView viewWithTag:123];
    
    [UIView animateWithDuration:0.3
                         animations:^{
                             
                             selectImageView.center=btn.center;
                             
                         }];
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

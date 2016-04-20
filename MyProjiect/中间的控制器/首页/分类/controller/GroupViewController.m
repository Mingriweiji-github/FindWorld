//
//  GroupViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "GroupViewController.h"
#import "FlightViewController.h"
#import "HotelsViewController.h"
#import "FreeViewController.h"
#import "VisaViewController.h"
#import "YoulunViewController.h"
#import "CarViewController.h"
#import "SecureViewController.h"
#import "PhoneViewController.h"
//#import "CItyPlayViewController.h"
@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    
    self.title=@"分类";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建视图
    [self _initViews];
}
- (void)_initViews
{

    NSArray *imgName1=@[@"0.jpg",@"11.jpg",@"12.jpg"];
    NSArray *imgName2=@[@"13.jpg",@"14.jpg",@"15.jpg"];
    NSArray *imgName3=@[@"16.jpg",@"17.jpg",@"18.jpg"];
    NSArray *arr1=@[@"机票",@"酒店",@"自由行"];
    NSArray *arr2=@[@"签证",@"邮轮",@"租车"];
    NSArray *arr3=@[@"保险",@"城市游玩",@"wifi/电话卡"];
    
    for (int i=0; i < 3; i++) {
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(20+kScreenWidth / 3 *i, 20 , kScreenHeight / 8, kScreenHeight/8);
        UIImage *img=[UIImage imageNamed:imgName1[i]];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor clearColor];
        btn.tag=100 +i;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(btn.left-8*KWidth_Scale, btn.bottom, 100*KWidth_Scale, 30)];
        label.text=arr1[i];
        
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor orangeColor];
        label.font=[UIFont boldSystemFontOfSize:14];
        
        [self.view addSubview:label];
        [self.view addSubview:btn];
    }
    for (int i=0; i < 3; i++) {
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(20+kScreenWidth / 3 *i, 20+kScreenHeight / 8*2 , kScreenHeight / 8, kScreenHeight/8);
        UIImage *img=[UIImage imageNamed:imgName2[i]];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor clearColor];
        btn.tag=103 +i;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(btn.left - 8*KWidth_Scale, btn.bottom, 100*KWidth_Scale, 30)];
        label.text=arr2[i];
        
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor orangeColor];
        label.font=[UIFont boldSystemFontOfSize:14];
        
        [self.view addSubview:label];
        [self.view addSubview:btn];
    }
    for (int i=0; i < 3; i++) {
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(20+kScreenWidth / 3 *i, 20+kScreenHeight / 8 * 4 , kScreenHeight / 8, kScreenHeight/8);
        UIImage *img=[UIImage imageNamed:imgName3[i]];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor clearColor];
        btn.tag=106 +i;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(btn.left-8*KWidth_Scale, btn.bottom, 100*KWidth_Scale, 30)];
        label.text=arr3[i];
        
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor orangeColor];
        label.font=[UIFont boldSystemFontOfSize:14];
        
        [self.view addSubview:label];
        [self.view addSubview:btn];
    }
    
    
}

- (void)buttonClick:(UIButton *)btn
{
    NSInteger index=btn.tag - 100;
    
    if (index == 0) {//机票
        
        FlightViewController *flightVC=[[FlightViewController alloc] init];
        [self.navigationController pushViewController:flightVC animated:YES];
    }if (index == 1) {//酒店
        
        HotelsViewController *hotelVC=[[HotelsViewController alloc] init];
        
        [self.navigationController pushViewController:hotelVC animated:YES];
        
        
    }if (index == 2) {//自由行
        
        FreeViewController *freeVC=[[FreeViewController alloc] init];
        
        [self.navigationController pushViewController:freeVC animated:YES];
        
    }if (index == 3) {//签证
        
        VisaViewController *visaVC=[[VisaViewController alloc] init];
        
        [self.navigationController pushViewController:visaVC animated:YES];
        
        
    }if (index == 4) {//邮轮
        
        YoulunViewController *youlunVC=[[YoulunViewController alloc] init];
        
        [self.navigationController pushViewController:youlunVC animated:YES];
        
        
    }if (index == 5) {//租车
        
        CarViewController *carVC=[[CarViewController alloc] init];
        
        [self.navigationController pushViewController:carVC animated:YES];
        
        
    }if (index == 6) {//保险
        SecureViewController *secureVC=[[SecureViewController alloc] init];
        
        [self.navigationController pushViewController:secureVC animated:YES];
        
        
    }if (index == 7) {//城市玩乐
//        CItyPlayViewController *cityVC=[[CItyPlayViewController alloc] init];
//        
//        [self.navigationController pushViewController:cityVC animated:YES];
        
        
        
    }if (index == 8) {//wifi/电话卡
        
        PhoneViewController *phone=[[PhoneViewController alloc] init];
        
        [self.navigationController pushViewController:phone animated:YES];
        
    }
    
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

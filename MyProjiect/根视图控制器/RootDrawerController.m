//
//  RootDrawerController.m
//  Project_Weibo47
//
//  Created by keyzhang on 15/9/11.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "RootDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"

@interface RootDrawerController ()

@end

@implementation RootDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //清除黑色的背景颜色
    self.view.backgroundColor = [UIColor clearColor];
    
    //从故事板中获取控制器对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //设置左侧的视图控制器
//    self.leftDrawerViewController = [storyboard instantiateViewControllerWithIdentifier:@"LeftVC"];
    
    //设置中间的视图控制器
    self.centerViewController = [storyboard instantiateViewControllerWithIdentifier:@"CenterVC"];
    
    //设置右侧的视图控制器
//    self.rightDrawerViewController = [storyboard instantiateViewControllerWithIdentifier:@"RightVC"];
    
    //设置阴影
    [self setShowsShadow:YES];
    
    //设置显示左右的宽度
    [self setMaximumRightDrawerWidth:160.0];
    [self setMaximumLeftDrawerWidth:100.0];
    
    //设置手势的作用区域---关闭显示两侧
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    
    
    //配置动画的回调函数
    [self
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    
    //获取UserDefaults
//    NSUserDefaults *userDefalts = [NSUserDefaults standardUserDefaults];
//    NSDictionary *dic = [userDefalts objectForKey:kDrawAnimationType];
//    NSNumber *type = [dic objectForKey:kDrawLeftType];

    //设置动画
//    [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:[type integerValue]];
//    [[MMExampleDrawerVisualStateManager sharedManager] setRightDrawerAnimationType:[type integerValue]];
    
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

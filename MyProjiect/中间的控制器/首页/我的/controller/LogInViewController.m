//
//  LogInViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LogInViewController.h"
#import "ZhuceViewController.h"
//#import "UMSocial.h"
@interface LogInViewController ()
{
    UITextField *tf1;
    UITextField *passwordTF;
}
@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"LastMinute_TitleBar_375"];
    
    UIGraphicsBeginImageContext(CGSizeMake(kScreenWidth, kScreenHeight));
    [image drawInRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    //头部
    [self _initHeaderView];
}
 //头部
- (void)_initHeaderView
{
    //返回
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 30, 35, 35);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_pic.jpg"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftBtn];
    
    //注册
    UIButton *zhuceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    zhuceBtn.frame = CGRectMake(kScreenWidth - 70, 30, 50, 30);
    [zhuceBtn setBackgroundImage:[UIImage imageNamed:@"b.jpg"] forState:UIControlStateNormal];
    
    [zhuceBtn addTarget:self action:@selector(zhuceClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:zhuceBtn];
    
    //手机号登录
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 2 -20, 110, 60, 60)];
    label.text=@"登录";//手机号
    label.font=[UIFont boldSystemFontOfSize:16];
    label.textColor=[UIColor whiteColor];
    [self.view addSubview:label];
    //用户名
    tf1 = [[UITextField alloc] initWithFrame:CGRectMake(100, 160, 200, 30)];
    [tf1 setBorderStyle:UITextBorderStyleRoundedRect];
//    tf1.autocapitalizationType=UITextAutocapitalizationTypeNone;
    
    tf1.placeholder=@"输入邮箱/用户名";
    tf1.clearButtonMode=UITextFieldViewModeWhileEditing;
    tf1.delegate=self;
    [tf1 becomeFirstResponder];
    [self.view addSubview:tf1];
    //密码
    passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [passwordTF setBorderStyle:UITextBorderStyleRoundedRect];
    passwordTF.placeholder=@"输入密码(纯数字)";
    passwordTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTF.delegate=self;
    [passwordTF becomeFirstResponder];
    
    passwordTF.secureTextEntry = YES;//密码保护
    [self.view addSubview:passwordTF];
    
    //忘记密码
    UIButton *tipButton=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 70, passwordTF.bottom +10, 160, 30)];
    [tipButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [tipButton addTarget:self action:@selector(findPassWord:) forControlEvents:UIControlEventTouchUpInside];
    tipButton.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:tipButton];
    
    
    //登录
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(kScreenWidth / 2 -40, passwordTF.bottom + 50, 100, 40);
    [button setBackgroundImage:[UIImage imageNamed:@"c.jpg"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    //新浪帐号登录
    UIButton *xinlang = [UIButton buttonWithType:UIButtonTypeCustom];
    xinlang.frame= CGRectMake(kScreenWidth / 2 -40, passwordTF.bottom + 250, 100, 40);
    [xinlang setTitle:@"新浪帐号登录" forState:UIControlStateNormal];
    //    [button setBackgroundImage:[UIImage imageNamed:@"c.jpg"] forState:UIControlStateNormal];
    [xinlang addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:xinlang];
    
    //分享
    UIButton *fenxiangbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    fenxiangbutton.frame= CGRectMake(kScreenWidth / 2 -40, passwordTF.bottom + 150, 100, 40);
    [fenxiangbutton setTitle:@"分享" forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"c.jpg"] forState:UIControlStateNormal];
    [fenxiangbutton addTarget:self action:@selector(fenxiang:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fenxiangbutton];

    
    
}
- (void)backBtnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)zhuceClick:(UIButton *)btn
{
    ZhuceViewController *zhuceVC=[[ZhuceViewController alloc] init];
    
    [self.navigationController pushViewController:zhuceVC animated:YES];
    
}

- (void)denglu:(UIButton *)btn
{
    //使用新浪帐号
    UMSocialSnsPlatform *snsPlatForm = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatForm.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES, ^(UMSocialResponseEntity *response){
        
        NSLog(@"response is %@",response);
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
    //获取accestoken以及新浪用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
    
}

- (void)fenxiang:(UIButton *)btn
{
    
    //第三方分享
    
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56178027e0f55ac9f3003b9c"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                       delegate:self];

}
- (void)findPassWord:(UIButton *)btn
{
    WebViewController *webVC=[[WebViewController alloc] init];
    
    webVC.htmlString = @"http://m.qyer.com/login/getpass.php";
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [tf1 resignFirstResponder];
    [passwordTF resignFirstResponder];
    
    return YES;
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

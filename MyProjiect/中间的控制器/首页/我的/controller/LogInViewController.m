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
#import "SSKeychain.h"
#import "PersonViewController.h"
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

    
    //手机号登录
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 2 -20, 110, 60, 60)];
    label.text=@"登录";//手机号
    label.font=[UIFont boldSystemFontOfSize:16];
    label.textColor=[UIColor whiteColor];
    [self.view addSubview:label];
    //用户名
    tf1 = [[UITextField alloc] initWithFrame:CGRectMake(75*KWidth_Scale, 160, 200, 30)];
    [tf1 setBorderStyle:UITextBorderStyleRoundedRect];
    tf1.placeholder=@"输入手机号/用户名";
    tf1.clearButtonMode=UITextFieldViewModeWhileEditing;
    tf1.delegate=self;
    [tf1 becomeFirstResponder];
    [self.view addSubview:tf1];
    //密码
    passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(75*KWidth_Scale, 200, 200, 30)];
    [passwordTF setBorderStyle:UITextBorderStyleRoundedRect];
    passwordTF.placeholder=@"输入密码(纯数字)";
    passwordTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTF.delegate=self;
    [passwordTF becomeFirstResponder];
    
    passwordTF.secureTextEntry = YES;//密码保护
    [self.view addSubview:passwordTF];
    
    
    
    //新浪登录
    UIButton *tipButton=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 70, passwordTF.bottom +10, 160, 30)];
    [tipButton setTitle:@"新浪登录" forState:UIControlStateNormal];
    [tipButton addTarget:self action:@selector(Xinadenglu:) forControlEvents:UIControlEventTouchUpInside];
    tipButton.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:tipButton];
    
    
    //登录
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(kScreenWidth / 2 -40, passwordTF.bottom + 50, 100, 40);
    [button setBackgroundImage:[UIImage imageNamed:@"c.jpg"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

    
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

- (void)Xinadenglu:(UIButton *)btn
{
    //使用新浪帐号
    UMSocialSnsPlatform *snsPlatForm = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatForm.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES, ^(UMSocialResponseEntity *response){
        
        NSLog(@"response is %@",response);
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {//成功获取的标示
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
            
//            [[NSUserDefaults standardUserDefaults] setObject:snsAccount.userName forKey:KUserName];
            [[NSNotificationCenter defaultCenter] postNotificationName:KSinaName object:snsAccount.userName];
            
            
        }});
    
    
    NSLog(@"namei is %@",[[NSUserDefaults standardUserDefaults] objectForKey:KUserName]);
    
    //获取accestoken以及新浪用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
        
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popToViewController:[[PersonViewController alloc] init] animated:YES];


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

- (void)logIn:(UIButton *)btn
{
    
    NSLog(@"手机号tf1:%@  密码passWoid:%@",tf1.text,passwordTF.text);
    
    if ([self isMobileNumber:tf1.text]) {
        
        NSLog(@"号码满足");
        NSDictionary *mDic = @{@"name":tf1.text,@"passWord":passwordTF.text};
        [[NSNotificationCenter defaultCenter] postNotificationName:KUserNameSuccess object:mDic];
        
        if (![[NSUserDefaults standardUserDefaults] objectForKey:@"firstLogIN"]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLogIN"];
            NSLog(@"第一次");

            
            [[NSUserDefaults standardUserDefaults] setObject:tf1.text forKey:@"PhoneNum"];


        }else{
        
            NSLog(@"不是第一次");
            
        
        }
        
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }else{
        NSLog(@"号码不满足");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"输入手机号码不符" message:@"请重新输入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
        
    }
 

}

#pragma mark textFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *checkString;
    
    if (range.location == 11) {
        
        return NO;
    
    }else{
        
        if (![string isEqualToString:@""]) {
            
            checkString=[tf1.text stringByAppendingString:string];
        
        }else{
            
            checkString=[checkString stringByDeletingLastPathComponent];
        
        }
        
        if ([self isMobileNumber:checkString]) {
            
            NSLog(@"号码满足");
            NSLog(@"checkStr:%@",checkString);
        
        
        }else{
            NSLog(@"号码不满足");
        
        }
        
        return YES;
    
    }

}

- (BOOL)isMobileNumber:(NSString *)mobileNum{
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobileNum];

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

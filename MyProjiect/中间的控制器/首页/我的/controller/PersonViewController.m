//
//  PersonViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PersonViewController.h"
#import "LogInViewController.h"

#import "PassengerViewController.h"
#import "SSKeychain.h"
@interface PersonViewController ()
{
    UIImageView *_headerView;
    UILabel *label;
    NSString *password;
}
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=NO;//隐藏导航栏
    //初始化表视图
    [self _initViews];
    //数据
    self.data = @[@[@"我的订单",@"我的优惠"],@[@"常用旅客",@"退出"]];
    
    
    
}
#pragma mark 表视图
- (void)_initViews
{
    //表视图
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    //头部视图
    UIImage *image=[UIImage imageNamed:@"LastMinute_TitleBar_320"];
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _headerView.image=image;
    //头像
    _headerView.userInteractionEnabled = YES;
    UIButton *userBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.tag=100;
    userBtn.frame=CGRectMake(kScreenWidth / 2 - 40*KWidth_Scale , 30*KWidth_Scale, 75*KWidth_Scale, 75*KWidth_Scale);
    
    [userBtn addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
    [userBtn setBackgroundImage:[UIImage imageNamed:@"a.jpg"] forState:UIControlStateNormal];
    [_headerView addSubview:userBtn];
    //用户名点击登录提示
    label = [[UILabel alloc] initWithFrame:CGRectMake(userBtn.left-10, userBtn.bottom+10*KWidth_Scale, 150*KWidth_Scale, 20)];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:15];
    
    label.userInteractionEnabled = YES;
    //手势
    UITapGestureRecognizer *gasture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(denglu:)];
    gasture.delegate = self;
    gasture.numberOfTapsRequired = 1;
    gasture.numberOfTouchesRequired = 1;
    
    [label addGestureRecognizer:gasture];
  
    
    

    
    label.text=@"点击头像登录";
    
    [_headerView addSubview:label];
    _tableView.tableHeaderView = _headerView;
    
   
    
//        NSString *pw = [SSKeychain passwordForService:KeyPassWord account:Keychain_account];
//        NSString *phoneNum =[SSKeychain passwordForService:KeyName account:Keychain_account];//用户名
//        NSLog(@"钥匙串  phone :%@ pw:%@",phoneNum,pw);
//        if (phoneNum) {
//            
//            label.text = phoneNum;
//            
//        
//    }
    NSString *phone = [[NSUserDefaults standardUserDefaults] objectForKey:@"PhoneNum"];
    if (phone) {
        label.text = phone;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSinaUserName:) name:KSinaName object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTextFieltName:) name:KUserNameSuccess object:nil];
    
    
    if (![label.text isEqualToString:@""]) {
        
        label.userInteractionEnabled = NO;
        _headerView.userInteractionEnabled = NO;

    }else{
    
        label.userInteractionEnabled = YES;
        _headerView.userInteractionEnabled = YES;

    }
}

- (BOOL)isMobileNumber:(NSString *)mobileNum{
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobileNum];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KUserNameSuccess object:nil];
}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    
}

-(void) getSinaUserName:(NSNotification *)notify
{
    NSLog(@"输入最新 notify ;%@",notify.object);
    
    label.text = [NSString stringWithFormat:@"%@",notify.object];


    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KUserNameSuccess object:nil];


}
- (void)getTextFieltName:(NSNotification *)notification
{
    NSLog(@"object:%@",notification.object);
    if ([self isMobileNumber:[notification.object objectForKey:@"name"]]) {
        label.text= [notification.object objectForKey:@"name"];
    }else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请重新输入" message:@"手机号不对" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
    
}
#pragma mark 点击登录
- (void)denglu:(UIButton *)btn
{
   
    LogInViewController *logVC=[[LogInViewController alloc] init];
    
    [self.navigationController pushViewController:logVC animated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 2;
//    }else{
//    
//        return 1;
//    }
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
//    NSLog(@"_data[indexPath.row] is %@",_data[indexPath.row]);
//    cell.textLabel.text = _data[indexPath.row];
    
    cell.textLabel.text = _data[indexPath.section][indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section:%ld row:%ld",indexPath.section,indexPath.row);
    if (indexPath.section ==0 && indexPath.row == 0) {
        NSLog(@"我的订单");
    } if (indexPath.section == 0 && indexPath.row == 1) {
        NSLog(@"我的优惠");
    }
    if (indexPath.section ==1 && indexPath.row == 0) {
        NSLog(@"常用旅客");
        PassengerViewController *fw = [[PassengerViewController alloc] init];
        [self.navigationController pushViewController:fw animated:YES];
    }if (indexPath.section ==1 && indexPath.row == 1) {
        NSLog(@"退出");
//        BOOL isOut= [SSKeychain setPassword:@"" forService:KeyName account:Keychain_account];
//        if (isOut) {
//            
//            label.text = [SSKeychain passwordForService:KeyName account:Keychain_account];
//        }
        
        label.text = @"";
        label.userInteractionEnabled = YES;
        _headerView.userInteractionEnabled = YES;

    }
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

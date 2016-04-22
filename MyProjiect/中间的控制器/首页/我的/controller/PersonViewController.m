//
//  PersonViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PersonViewController.h"
#import "LogInViewController.h"
@interface PersonViewController ()
{
    UIImageView *_headerView;
}
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=YES;//隐藏导航栏
    //初始化表视图
    [self _initViews];
    //数据
    self.data = @[@[@"我的订单",@"我的优惠"],@[@"常用旅客信息",@"常用联系人"]];
    
    
    
}
#pragma mark 表视图
- (void)_initViews
{
    //表视图
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    //头部视图
    UIImage *image=[UIImage imageNamed:@"LastMinute_TitleBar_320"];
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _headerView.image=image;
    //头像
    _headerView.userInteractionEnabled = YES;
    UIButton *userBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.tag=100;
    userBtn.frame=CGRectMake(kScreenWidth / 2 - 30, 30, 75, 75);
    
    [userBtn addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
//    userBtn.backgroundColor=[UIColor purpleColor];
    [userBtn setBackgroundImage:[UIImage imageNamed:@"a.jpg"] forState:UIControlStateNormal];
    [_headerView addSubview:userBtn];
    //点击登录提示
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 2-50, userBtn.bottom, 200, 20)];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:15];
    label.text=@"点击登录，体验更多";
    [_headerView addSubview:label];
    _tableView.tableHeaderView = _headerView;
    
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
    return self.data.count;
    
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
    } if (indexPath.section == 1 && indexPath.row == 1) {
        NSLog(@"常用联系人");
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

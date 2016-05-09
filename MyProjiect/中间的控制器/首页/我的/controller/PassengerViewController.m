//
//  FWPassengerViewController.m
//  FindWorld
//
//  Created by Mr.Li on 16/4/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "PassengerViewController.h"
#import "WFPassengerCell.h"
@interface PassengerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableViewCellEditingStyle    _editingStyle;
    
    NSInteger count;
    UIButton *backBtn;
}

@end

@implementation PassengerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //自定义导航栏
    self.navigationController.navigationBarHidden=NO;//隐藏导航栏

    
    //增加游客信息
//    UIButton *add = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    add.frame = CGRectMake(kScreenWidth / 2 -50*KWidth_Scale, 0 , 150*KWidth_Scale, 20);
//    [add setTitle:@"新建账号" forState:UIControlStateNormal];
//    [add addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:add];
//    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight - 44 - 20) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
  
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserNameSuccess:) name:KUserNameSuccess object:nil];
    
}

-(void) getUserNameSuccess:(NSNotification *)notify
{
    NSLog(@"notify ;%@",notify.object);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KUserNameSuccess object:nil];
    
    
}
- (void)backBtnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editBtnClick:(UIButton *)btn
{
    [self addData];
    //    [self deleteData];
    
}

- (void)addData
{
    count ++;
    
    _editingStyle = UITableViewCellEditingStyleInsert;
    
    BOOL isEditing = self.tableView.isEditing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    [self.tableView reloadData];
}
#pragma mark delegete

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier=@"Cell";
    WFPassengerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        
        cell = [[WFPassengerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text= [NSString stringWithFormat:@"%u",arc4random() / 2];
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"section:%ld , row:%ld",indexPath.section,indexPath.row);
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark 编辑状态
// 指定哪一行可以编辑 哪行不能编辑

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"count:%ld row:%ld",count,indexPath.row);
    //    if (indexPath.section == 0 && indexPath.row == count-1) {
    //
    //        return NO;
    //
    //    }else{
    //
    //        return NO;
    //    }
    return NO;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#pragma mark 测试cell移动 如不需要请注销
    _editingStyle = UITableViewCellEditingStyleInsert;//测试cell移动
    
    return _editingStyle;
}

@end

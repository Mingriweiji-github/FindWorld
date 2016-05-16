//
//  PickedViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PickedViewController.h"
#import "PickerTableViewCell.h"
#import "PickedModel.h"
#import "PickDetailViewController.h"
#import "JapenViewController.h"
#import "SingaporeViewController.h"
#import "ChiangMaiViewController.h"
#import "PhuketViewController.h"
#import "ParisViewController.h"
#import "USAViewController.h"
#import "NewlandViewController.h"
#import "KoreaViewController.h"
#import "BangkokViewController.h"
#import "BaliViewController.h"
#import "TuikeyViewController.h"
#import "CamBodiaViewController.h"
#import "LundunViewController.h"
@interface PickedViewController ()
{
    NSString *imgString;
}
@end

@implementation PickedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"精选";
    //初始化表视图
    [self _initViews];
    
    //请求数据
    [self requestData];
    //加载提示
    [self showHud:@"加载中ing..."];
    
}
#pragma mark 初始化表视图
-(void) _initViews
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49-44) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
    
}
#pragma mark 请求数据
- (void)requestData
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    
//    [WebDataService requestAFData:get_play_and_fun
//                       httpMethod:@"GET"
//                           params:params
//                 completionHandle:^(id result) {
//                     
//                     NSLog(@"result is %@",result);
//                     
//                 }];
    [WebDataService requestData:get_play_and_fun
                    htttpMethod:@"GET"
                         params:params
               completionHandle:^(id result) {
                  
                   NSArray *data = result[@"data"];
                                        NSLog(@"精选data result is %@",data);

                   NSMutableArray *mArr=[NSMutableArray array];
                   
                   for (NSDictionary *dic in data) {
                       
                       PickedModel *model=[[PickedModel alloc] initContentWithDic:dic];
                       
                       [mArr addObject:model];
                      
                       imgString = [dic objectForKey:@"img"];
                       [_imgArr addObject:imgString];

                       
                    
                   }
                   
                   _data = mArr;
                   [_tableView reloadData];
                   
                   //加载完成
                   [self comleteLoading:@"OK"];
               }];
    
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    
    PickerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
//        cell = [[PickerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
      cell = [[[NSBundle mainBundle] loadNibNamed:@"PickerTableViewCell" owner:nil options:nil] lastObject];
        cell.backgroundColor= [UIColor clearColor];
    }
    
    cell.model = _data[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PickerTableViewCell *cell=(PickerTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0 ) {//台湾
        PickDetailViewController *pickVC=[[PickDetailViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 1 ) {//日本
        JapenViewController *pickVC=[[JapenViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 2 ) {//新加坡
        SingaporeViewController *pickVC=[[SingaporeViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 3 ) {//清迈
        ChiangMaiViewController *pickVC=[[ChiangMaiViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 4 ) {//普吉岛
        PhuketViewController *pickVC=[[PhuketViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 5 ) {//巴黎
        ParisViewController *pickVC=[[ParisViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 6 ) {//美国
        USAViewController *pickVC=[[USAViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 7 ) {//新西兰
        NewlandViewController *pickVC=[[NewlandViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 8 ) {//韩国
        KoreaViewController *pickVC=[[KoreaViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 9 ) {//曼谷
        BangkokViewController *pickVC=[[BangkokViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 10 ) {//巴厘岛
        BaliViewController *pickVC=[[BaliViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 11 ) {//土耳其
        TuikeyViewController *pickVC=[[TuikeyViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 12 ) {//柬埔寨
        CamBodiaViewController *pickVC=[[CamBodiaViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 13 ) {//伦敦
        LundunViewController *pickVC=[[LundunViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }
    
    if (indexPath.row == 14 ) {//日本
        JapenViewController *pickVC=[[JapenViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
    }if (indexPath.row == 15 ) {//日本
        JapenViewController *pickVC=[[JapenViewController alloc] init];
        pickVC.img = cell.model.img;
        [self.navigationController pushViewController:pickVC animated:YES];
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

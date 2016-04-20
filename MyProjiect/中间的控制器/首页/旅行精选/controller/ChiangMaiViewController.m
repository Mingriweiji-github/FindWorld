//
//  PickDetailViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ChiangMaiViewController.h"
#import "MyCollectionViewCell.h"
@interface ChiangMaiViewController ()
{
    UICollectionView *_collectionView;
    UIImageView *headerView ;
}
@end

@implementation ChiangMaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    //初始化瀑布流视图
    [self _initViews];
    //请求数据
    [self requeData];
    
    //加载提示
    [self showHud:@"拼命加载 ing"];
    
    
}

- (void)_initViews
{
    //头部
    headerView = [[UIImageView alloc] initWithFrame:CGRectMake(14, -150 -50, kScreenWidth,200)];
    [headerView sd_setImageWithURL:[NSURL URLWithString:_img]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kScreenWidth - 20 - 15) / 2, 220);
    layout.minimumInteritemSpacing=0;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-10, kScreenHeight )  collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
    //设置头部
    _collectionView.contentInset = UIEdgeInsetsMake(200+10, 0, 0, 0);//上左下右
    [_collectionView addSubview:headerView];
    
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
    
    
}

#pragma mark 请求数据-地区
- (void)requeData
{
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObject:@"46960,53948,55168,55169,39491,39781,39790,39890,40201,40958,45026,42023,41244,41216,52635,52608,52606,52579,52575,52566,52560,49001,48993,50279,39897,45103,55260,55259,54708,54724,54728,54744,54733,54753,54722,54703,54770,54767,40970,40795,52567,51389,52650,51595,45134,40131,51905,51812,44821,45010" forKey:@"id"];
    
    [WebDataService requestData:get_list_by_id_vtwo
                    htttpMethod:@"POST"
                         params:params
               completionHandle:^(id result) {
                   NSDictionary *data=result[@"data"];
                   NSArray *lastminutes=[data objectForKey:@"lastminutes"];
                   NSMutableArray *mArr=[NSMutableArray array];
                   for (NSDictionary *dic in lastminutes) {
                       
                       CollectionModel *model = [[CollectionModel alloc] initContentWithDic:dic];
                       
                       [mArr addObject:model];
                   }
                   
                   _data = mArr;
                   
                   
                   [_collectionView reloadData];
                   
                   [self comleteLoading:@"OK"];
               }];
    
    
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    
    MyCollectionViewCell *cell=[[MyCollectionViewCell alloc] init];
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = _data[indexPath.row];
    
    return cell;
}

//选中操作
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell=(MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    WebViewController *webVC=[[WebViewController alloc] init];
    
    webVC.htmlString = cell.model.url;
    
    [self.navigationController pushViewController:webVC animated:YES];
    
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

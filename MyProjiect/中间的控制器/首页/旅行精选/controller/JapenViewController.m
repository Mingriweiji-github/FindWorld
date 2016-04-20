//
//  PickDetailViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "JapenViewController.h"
#import "MyCollectionViewCell.h"
@interface JapenViewController ()
{
    UICollectionView *_collectionView;
    UIImageView *headerView ;
}
@end

@implementation JapenViewController

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
    headerView = [[UIImageView alloc] initWithFrame:CGRectMake(14, -200, kScreenWidth, 200)];
    [headerView sd_setImageWithURL:[NSURL URLWithString:_img]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kScreenWidth - 20 - 20) / 2, 220);
    layout.minimumInteritemSpacing=0;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-10, kScreenHeight )  collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
    //设置头部
    _collectionView.contentInset = UIEdgeInsetsMake(200 +10, 0, 0, 0);
    [_collectionView addSubview:headerView];
    
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
    
    
}

#pragma mark 请求数据-日本
- (void)requeData
{
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObject:@"50234,50262,50239,50260,50529,50432,50509,48153,50639,44776,50662,50968,45760,49817,46505,53800,44773,54018,54019,49063,53013,53341,54301,46116,49655,54028,52670,53334,52961,53019,52674,52009,50601,53801,53788,53785,53776,53775,49184,49110,49112,53317,49903,53267,53293,53297,49913,53254,53252,53265" forKey:@"id"];
    
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

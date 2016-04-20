//
//  PhoneViewController.m
//  MyProjiect
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PhoneViewController.h"
#import "FlightCollectionViewCell.h"
#import "TypeModel.h"
@interface PhoneViewController ()
{
    UICollectionView *_collectionView;
    UIView *view;//头部视图
    
    BOOL isClose;
    NSInteger lastIndex;//标记
    NSInteger _index;
    
    UIView *myView;//type的遮挡视图
    UIView *departView;//出发地视图
    UIView *timeView;//时间视图
    UIView *destinationView;//出发地洲视图
    UIView *detailView;//出发地详细视图
    
    TypeModel *dicModel;//测试
}

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"wifi/电话卡";
    
    self.view.backgroundColor=[UIColor whiteColor];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kScreenWidth -20-20)/2, 200);
    layout.minimumInteritemSpacing =5;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth - 20 -10, kScreenHeight - 50) collectionViewLayout:layout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
    //注册
    //    [_collectionView registerClass:[FlightCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    //nib注册
    [_collectionView registerNib:[UINib nibWithNibName:@"FlightCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
    
    
    //头部视图
    [self _initHeaderView];
    
    
    [self _requestThisPage];
    
}


#pragma mark 头部视图
- (void)_initHeaderView
{
   view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    view.backgroundColor=[UIColor whiteColor];
    
    //机票
    UIButton *tickBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    tickBtn.tag=10;
    tickBtn.frame=CGRectMake(15, 15, kScreenWidth / 4 -10, 25);
    [tickBtn setTitle:@"电话卡" forState:UIControlStateNormal];
    
    [tickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    tickBtn.selected=YES;
    lastIndex=tickBtn.tag;
    [tickBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];    //        tickBtn.selected = ! tickBtn.selected;
    
    [tickBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:tickBtn];
    
    UIImageView *imgView1=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 -10 -40+5+10, 1, 20, 24)];
    imgView1.image=[UIImage imageNamed:@"223.png"];
    imgView1.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView1];
    
    //出发地
    UIButton *goBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    goBtn.tag=11;
    goBtn.frame=CGRectMake(15+kScreenWidth / 4 -10, 15 , kScreenWidth / 4 -10, 25);
    [goBtn setTitle:@"出发地" forState:UIControlStateNormal];
    [goBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    //    [goBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [goBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:goBtn];
    
    UIImageView *imgView2=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 *2 -10 -40+5+10 , 1, 20, 24)];
    imgView2.image=[UIImage imageNamed:@"223.png"];
    imgView2.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView2];
    //目的地
    UIButton *tarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    tarBtn.tag=12;
    tarBtn.frame=CGRectMake(15+ (kScreenWidth / 4 -10) *2, 15 , kScreenWidth / 4 -10, 25);
    [tarBtn setTitle:@"目的地" forState:UIControlStateNormal];
    [tarBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    //    [tarBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [tarBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:tarBtn];
    UIImageView *imgView3=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 * 3 -10 -40 , 1, 20, 24)];
    imgView3.image=[UIImage imageNamed:@"223.png"];
    imgView3.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView3];
    //旅行时间
    UIButton *intervalBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    intervalBtn.tag=13;
    intervalBtn.frame=CGRectMake(15+ (kScreenWidth / 4 -10) *3, 15, kScreenWidth / 4 -10, 25);
    [intervalBtn setTitle:@"旅行时间" forState:UIControlStateNormal];
    [intervalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    [intervalBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:intervalBtn];
    
    UIImageView *imgView4=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 * 4 -10 -40 , 1, 20, 24)];
    imgView4.image=[UIImage imageNamed:@"223.png"];
    imgView4.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView4];
    [self.view addSubview:view];
}

- (void)buttonClick:(UIButton *)btn
{
    btn.selected = ! btn.selected;
    
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];//选中变-绿色
    NSInteger index=btn.tag;
    if (index == 10) {
        //机票
        
        
    } if (index == 11) {
        //出发地
    } if (index == 12) {
        //目的地
    } if (index == 13) {
        //旅行时间
    } if (index == 10) {
        //机票
    }
    
    
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier=@"Cell";
    
    
    FlightCollectionViewCell *cell=[[FlightCollectionViewCell alloc] init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor clearColor];
    
    cell.model = _data[indexPath.row];
    
    return cell;
}
//FlightCollectionViewCell被点击了
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FlightCollectionViewCell *cell=(FlightCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    WebViewController *webVC=[[WebViewController alloc] init];
    webVC.htmlString=cell.model.url;
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}
#pragma mark 签证的数据
- (void)_requestThisPage
{
    
    //请求本地JSON
    id json=[LocalDataRequest requestLocalData:@"电话卡"];
    
    NSMutableArray *mArr=[NSMutableArray array];
    //    NSLog(@"json is %@",json);
    NSDictionary *data=[json objectForKey:@"data"];
    NSArray *lastminutes = [data objectForKey:@"lastminutes"];
    for (NSDictionary *dic in lastminutes) {
        
        TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
        [mArr addObject:model];
        
    }
    
    _data=mArr;
    
    [_collectionView reloadData];//刷新UI
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

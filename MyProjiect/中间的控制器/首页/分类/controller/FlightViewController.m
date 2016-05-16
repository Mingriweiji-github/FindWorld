//
//  FlightViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FlightViewController.h"
#import "FlightCollectionViewCell.h"
#import "TicketModel.h"
#import "WebDataService.h"

#import "WebViewController.h"
#import "TypeModel.h"
@interface FlightViewController ()
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

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.title=@"机票";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kScreenWidth -20- 20)/2, 200);
    layout.minimumInteritemSpacing =10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth-20, kScreenHeight - 50) collectionViewLayout:layout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
    //注册
//    [_collectionView registerClass:[FlightCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    //nib注册
    [_collectionView registerNib:[UINib nibWithNibName:@"FlightCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
    //头部视图
    [self _initHeaderView];
    
    //请求本页面数据
    [self _requestThisPage];
    
    
    //type数据请求
    [self typeDataRequest];
    //初始化tabelView
    [self _iniTabelViews];
   
    
}
#pragma mark 头部视图
- (void)_initHeaderView
{
    view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    view.backgroundColor=[UIColor whiteColor];
    
       //机票
    UIButton *tickBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    tickBtn.tag=10;
    tickBtn.frame=CGRectMake(10 * KWidth_Scale, 15, kScreenWidth / 4 -10*KWidth_Scale, 25);
    [tickBtn setTitle:@"机票" forState:UIControlStateNormal];
    tickBtn.font = FontHT(14*KWidth_Scale);
    
    lastIndex = tickBtn.tag;
    tickBtn.selected = YES;

    [tickBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [tickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    [tickBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:tickBtn];
    
    UIImageView *imgView1=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 -30*KWidth_Scale, 1, 20, 24)];
    imgView1.image=[UIImage imageNamed:@"223.png"];
    imgView1.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView1];
    
    //出发地
    UIButton *goBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    goBtn.tag=11;
    goBtn.frame=CGRectMake(kScreenWidth / 4 +5*KWidth_Scale, 15 , kScreenWidth / 4 -10*KWidth_Scale, 25);
    [goBtn setTitle:@"出发地" forState:UIControlStateNormal];
    [goBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    goBtn.font = FontHT(14*KWidth_Scale);

    //字体为黑色
    [goBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:goBtn];
    
    UIImageView *imgView2=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 *2 -10 -40+5+10 , 1, 20, 24)];
    imgView2.image=[UIImage imageNamed:@"223.png"];
    imgView2.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView2];
    //目的地
    UIButton *tarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    tarBtn.tag=12;
    tarBtn.frame=CGRectMake(10+ (kScreenWidth / 4 -10) *2, 15 , kScreenWidth / 4 -10*KWidth_Scale, 25);
    [tarBtn setTitle:@"目的地" forState:UIControlStateNormal];
    [tarBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tarBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    tarBtn.font = FontHT(14*KWidth_Scale);

    [view addSubview:tarBtn];
    UIImageView *imgView3=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 * 3 -10 -40 , 1, 20, 24)];
    imgView3.image=[UIImage imageNamed:@"223.png"];
    imgView3.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView3];
    //旅行时间
    UIButton *intervalBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    intervalBtn.tag=13;
    intervalBtn.frame=CGRectMake(15+ (kScreenWidth / 4 -10) *3, 15, kScreenWidth / 4 -10*KWidth_Scale, 25);
    [intervalBtn setTitle:@"旅行时间" forState:UIControlStateNormal];
    intervalBtn.font = FontHT(14*KWidth_Scale);

    [intervalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//字体为黑色
    [intervalBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:intervalBtn];
    
    UIImageView *imgView4=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 * 4 -10 -40 , 1, 20, 24)];
    imgView4.image=[UIImage imageNamed:@"223.png"];
    imgView4.userInteractionEnabled=YES;
    [tickBtn addSubview:imgView4];
    [self.view addSubview:view];
}
#pragma mark 下拉的单元格视图
- (void)_iniTabelViews
{
    
    myView=[[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-64)];
    _typeTableV = [[UITableView alloc] initWithFrame:myView.bounds style:UITableViewStylePlain];
    _typeTableV.delegate=self;
    _typeTableV.dataSource=self;
    [myView addSubview:_typeTableV];
    
    myView.hidden=YES;//一开始隐藏view
    [self.view addSubview:myView];
    
    
    departView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-64)];
    _departTabelV = [[UITableView alloc] initWithFrame:departView.bounds style:UITableViewStylePlain];
    _departTabelV.delegate=self;
    _departTabelV.dataSource=self;
    [departView addSubview:_departTabelV];
    
    departView.hidden=YES;
    [self.view addSubview:departView];
    
    //时间视图
    timeView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-64)];
    _timeTabelV = [[UITableView alloc] initWithFrame:timeView.bounds style:UITableViewStylePlain];
    _timeTabelV.delegate=self;
    _timeTabelV.dataSource=self;
    
    [timeView addSubview:_timeTabelV];
    timeView.hidden=YES;
    [self.view addSubview:timeView];
    
    //目的地
    destinationView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-64)];
    _destinationTabelV = [[UITableView alloc] initWithFrame:destinationView.bounds style:UITableViewStylePlain];
    _destinationTabelV.delegate=self;
    _destinationTabelV.dataSource=self;
    [destinationView addSubview:_destinationTabelV];
    
    destinationView.hidden=YES;
    [self.view addSubview:destinationView];
    
}
#pragma mark 头部按钮点击了
- (void)buttonClick:(UIButton *)btn
{
    if (lastIndex != btn.selected) {
        
        UIButton *lastBtn=(UIButton *)[view viewWithTag:lastIndex];
        lastBtn.selected = NO;
        [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        
    }
    
    btn.selected = !btn.selected;
    isClose = ! isClose;
    lastIndex= btn.tag;//根据tag值标记
    NSInteger index=btn.tag;
    if (index == 10 ) { //机票--全部type
        
            [UIView animateWithDuration:0.3
                             animations:^{
                                 departView.hidden=YES;
                                 destinationView.hidden=YES;
                                 timeView.hidden=YES;
                                 myView.hidden = NO;

                             }];
       
        if (!isClose) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 
                                  myView.hidden=YES;

                             }];

            
        }
        
        
    } if (index == 11) { //出发地
       
            [UIView animateWithDuration:0.3
                             animations:^{
                                 
                                 departView.hidden = NO;
                                 myView.hidden = YES;
                                 destinationView.hidden=YES;
                                 timeView.hidden=YES;
                                 
                             }];
        
        if (!isClose) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 
                                 departView.hidden=YES;
                             }];
        }
        
    } if (index == 12) { //目的地
       
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             destinationView.hidden = NO;
                             detailView.hidden=NO;
                             
                             myView.hidden = YES;
                             departView.hidden=YES;
                             timeView.hidden=YES;
                             
                         }];
        if (!isClose) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 
                                 destinationView.hidden=YES;
                                 detailView.hidden=YES;
                             }];
        }
    } if (index == 13) {
        //旅行时间
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             timeView.hidden = NO;
                             myView.hidden = YES;
                             departView.hidden=YES;
                             destinationView.hidden=YES;
                             
                         }];
        if (!isClose) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 
                                 timeView.hidden=YES;
                             }];
        }
    }

}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier=@"Cell";

    
   FlightCollectionViewCell *cell=[[FlightCollectionViewCell alloc] init];
   cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
   cell.backgroundColor=[UIColor clearColor];
    
    cell.model=self.data[indexPath.row];
    
   return cell;
}

//FlightCollectionViewCell被点击了-->跳转WebView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FlightCollectionViewCell *cell=(FlightCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    WebViewController *webVC=[[WebViewController alloc] init];
    webVC.htmlString=cell.model.url;
    
    [self.navigationController pushViewController:webVC animated:YES];
 
}
#pragma mark 机票的数据
- (void)_requestThisPage
{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"ra_referer": @"app_lastminute_list"};
    NSDictionary *dict2=@{@"page_size":@"10"};
    NSDictionary *dict3=@{@"page":@"1"};
    NSDictionary *dict4=@{@"product_type":@"1061"};
    NSDictionary *dict5=@{@"continent_id":@"0"};
    NSDictionary *dict6=@{@"country_id":@"0"};
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    [params setDictionary:dict];
    [params setDictionary:dict2];
    [params setDictionary:dict3];
    [params setDictionary:dict4];
    [params setDictionary:dict5];
    [params setDictionary:dict6];

   [WebDataService requestAFData:app_lastminute_list
                      httpMethod:@"POST"
                          params:params
                completionHandle:^(id result) {
                    NSDictionary *data=result[@"data"];
                    
                                        NSLog(@"机票Iresult is %@",data);

                    NSArray *lastminutes = [data objectForKey:@"lastminutes"];
                    
                     NSMutableArray *mArr=[NSMutableArray array];
                    for (NSDictionary *dic in lastminutes) {
                        
                        TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
                        
                        [mArr addObject:model];
                    }
                    
                    self.data=mArr;
                    
                    [_collectionView reloadData];
                }];
    //测试  本地JSON数据
    //请求本地JSON
    
    //    NSLog(@"_jsonName is %@",_jsonName);
//    id json=[LocalDataRequest requestLocalData:@"机票"];
//    NSMutableArray *mArr=[NSMutableArray array];
//    NSDictionary *data=[json objectForKey:@"data"];
//    NSArray *lastminutes = [data objectForKey:@"lastminutes"];
//    
//    for (NSDictionary *dic in lastminutes) {
//        TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
//        [mArr addObject:model];
//        
//    }
//    
//    _data=mArr;
//    
//    [_collectionView reloadData];//刷新UI
 
}
#pragma mark -头部单元格数据请求
- (void)typeDataRequest
{
    
    NSMutableDictionary *params= [NSMutableDictionary dictionary];
    
    [WebDataService requestAFData:get_all_categorys
                       httpMethod:@"GET"
                           params:params
                 completionHandle:^(id result) {
                     
                     NSDictionary *data = result[@"data"];
                     
                     NSArray *type = [data objectForKey:@"type"];
                     NSArray *departure = [data objectForKey:@"departure"];
                     NSArray *times_drange=[data objectForKey:@"times_drange"];
                     NSArray *poi = [data objectForKey:@"poi"];
                     
                     
                     NSMutableArray *mArr=[NSMutableArray array];
                     NSMutableArray *departArr=[NSMutableArray array];
                     NSMutableArray *timeArr=[NSMutableArray array];
                     NSMutableArray *destinationArr=[NSMutableArray array];
//                     NSMutableArray *detailArr=[NSMutableArray array];
                     for (NSDictionary *dic in type) {
                         
                         TypeModel *model=[[TypeModel alloc] initContentWithDic:dic];
                         
                         [mArr addObject:model];
                     }
                     for (NSDictionary *dic in departure) {
                         
                         TypeModel *model=[[TypeModel alloc] initContentWithDic:dic];
                         
                         [departArr addObject:model];
                     }
                     for (NSDictionary *dic in times_drange) {//旅行时间
                         
//                         TypeModel *model=[[TypeModel alloc] initContentWithDic:dic];
                         
                      NSString *timeStr = [dic objectForKey:@"description"];
                         
                         [timeArr addObject:timeStr];
                         
                         
                     }
                     for (NSDictionary *dic in poi) {//目的地-左侧
                    
                         
                         TypeModel *model=[[TypeModel alloc] initContentWithDic:dic];
                         
                         [destinationArr addObject:model];
                         
                         
                     }

                     
                     _typeData = mArr;
                     [_typeTableV reloadData];
                     
                     _departData = departArr;
                     [_departTabelV reloadData];
                     
                     _destinationData = destinationArr;
                     [_destinationTabelV reloadData];//左侧单元格
                     
//                     _detailData = detailArr;
//                     [_detailTableView reloadData];//右侧单元格
                     
                     _timeData = timeArr;
                     [_timeTabelV reloadData];
                     
                 }];
    
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _typeTableV) {
        return _typeData.count-1;

    }else if (tableView == _departTabelV){
    
        return _departData.count;
        
    }else if (tableView == _destinationTabelV){
    
        return _destinationData.count;
    
    }else if (tableView == _timeTabelV){
        
        return 5;
        
    }else if (tableView == _detailTableView){
        
        return _detailData.count;
        
    }
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.backgroundColor=[UIColor clearColor];
    
    
    TypeModel *model=[[TypeModel alloc] init];
    
    
    if (tableView == _typeTableV) {
        
        model = _typeData[indexPath.row];
        cell.textLabel.text=model.catename;

    }else if (tableView == _departTabelV){
    
        model = _departData[indexPath.row];
        cell.textLabel.text=model.city_des;

    }else if (tableView == _timeTabelV){//时间
//        
//        model = _timeData[indexPath.row];
//        //测试
//        cell.textLabel.text=model.myDescription;
        
        cell.textLabel.text = _timeData[indexPath.row];
        
    }else if (tableView == _destinationTabelV){//目的地-左侧
        
        model = _destinationData[indexPath.row];
        cell.textLabel.text=model.continent_name;
        
        
    }else if (tableView == _detailTableView){//目的地-右侧
        
//        NSString *text = _detailData[indexPath.row];
//        cell.textLabel.text=text;

        cell.textLabel.text=_detailData[indexPath.row];
        cell.backgroundColor=[UIColor whiteColor];
    }

    return cell;
    
}
//选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中的cell
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    if (tableView == self.typeTableV) {//全部类型

        NSString *typeName=cell.textLabel.text;
        
        id json=[LocalDataRequest requestLocalData:typeName];
        NSMutableArray *mArr=[NSMutableArray array];
        NSDictionary *data=[json objectForKey:@"data"];
        NSArray *lastminutes = [data objectForKey:@"lastminutes"];
        for (NSDictionary *dic in lastminutes) {
            TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
            [mArr addObject:model];
            
        }
        _data=mArr;
        [_collectionView reloadData];//刷新UI
        UIButton *btn=(UIButton *)[view viewWithTag:10];//隐藏单元格，改变头部按钮title
        [btn setTitle:typeName forState:UIControlStateNormal];
        [self buttonClick:btn];
        
    }if (tableView == self.departTabelV) {//全部出发地
        
        NSString *departName = cell.textLabel.text;
        
        if (indexPath.row == 1) {
            departName=@"北京:天津";
        }if (indexPath.row == 2) {
            departName=@"上海:杭州";
        }if (indexPath.row == 3) {
            departName=@"成都:重庆";
        }if (indexPath.row == 4) {
            departName=@"广州:深圳";
        }
        
        id json=[LocalDataRequest requestLocalData:departName];
        NSMutableArray *mArr=[NSMutableArray array];
        NSDictionary *data=[json objectForKey:@"data"];
        NSArray *lastminutes = [data objectForKey:@"lastminutes"];
        for (NSDictionary *dic in lastminutes) {
            TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
            [mArr addObject:model];
            
        }
        _data=mArr;
        [_collectionView reloadData];//刷新UI
        UIButton *btn=(UIButton *)[view viewWithTag:11];
        [btn setTitle:departName forState:UIControlStateNormal];//隐藏单元格，改变头部按钮title
        [self buttonClick:btn];
        
    
    }
    
    if (tableView == self.destinationTabelV ){
         //目的地
        //1.5太平洋
        TypeModel *model = _destinationData[indexPath.row];
        _detailData = model.country;
        NSMutableArray *mArr=[NSMutableArray array];
        for (NSDictionary *nameDic in _detailData){
           //此处不再需要model的封装，而是要根据选择的洲给出country中的country_name,但是country中又是一个个小的dic因此要遍历才能取出来
            NSArray *name = [nameDic objectForKey:@"country_name"];
              [mArr addObject:name];
        }
        
    

            //国家详情
            if (detailView == nil) {
                
                detailView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth / 2, 0, kScreenWidth / 2, kScreenHeight -50-64)];
                [_destinationTabelV addSubview:detailView]; //国家view放在_destinationTabelV上


            }
        
        
        if (_detailTableView == nil) {
            
            _detailTableView = [[UITableView alloc] initWithFrame:detailView.bounds style:UITableViewStylePlain];

            _detailTableView.delegate=self;
            _detailTableView.dataSource=self;
            _detailTableView.backgroundColor=[UIColor whiteColor];
            [detailView addSubview:_detailTableView];
        }

            NSLog(@" %@ 国家：%@",cell.textLabel.text,mArr);
            _detailData=mArr;

            [_detailTableView reloadData];//国家列表刷新UI

        // 取消前一个选中的，就是单选啦
        NSIndexPath *_lastIndex = [NSIndexPath indexPathForRow:_index inSection:0];
        UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:_lastIndex];
        lastCell.accessoryType = UITableViewCellAccessoryNone;
        // 选中操作
        //    UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        // 保存选中的
        _index = indexPath.row;

        }
    
    
    if (self.detailTableView == tableView) {
        
        [_collectionView reloadData];//_collection刷新UI

        
        
        destinationView.hidden = YES;
        detailView.hidden = YES;
     
    }


    
    NSString *detailName  =  cell.textLabel.text;
    NSLog(@"detailName is %@",detailName);
//    //刷新数据
//    id json=[LocalDataRequest requestLocalData:detailName];
//    NSMutableArray *mArr=[NSMutableArray array];
//    NSDictionary *data=[json objectForKey:@"data"];
//    NSArray *lastminutes = [data objectForKey:@"lastminutes"];
//    for (NSDictionary *dic in lastminutes) {
//        TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
//        [mArr addObject:model];
//    }
//    _data=mArr;
//    [_collectionView reloadData];//刷新UI
//    
//    UIButton *btn = (UIButton *)[view viewWithTag:12];
//    [btn setTitle:detailName forState:UIControlStateNormal];//改变button的title
//    [self buttonClick:btn];

    

    if (tableView == self.timeTabelV) {//4.旅行时间
        
        NSString *time =  cell.textLabel.text;
        NSLog(@"time %@",time);
        //刷新数据
        id json=[LocalDataRequest requestLocalData:cell.textLabel.text];
        
        NSMutableArray *mArr=[NSMutableArray array];
        NSDictionary *data=[json objectForKey:@"data"];
        NSArray *lastminutes = [data objectForKey:@"lastminutes"];
        if (lastminutes.count==0) {
            return;
        }
        
        for (NSDictionary *dic in lastminutes) {
            
           
            TicketModel *model=[[TicketModel alloc] initContentWithDic:dic];
            if (model == nil) {
                return;
            }
            [mArr addObject:model];
            
        }
        _data=mArr;
        [_collectionView reloadData];//刷新UI
        
        UIButton *btn = (UIButton *)[view viewWithTag:13];
        [btn setTitle:time forState:UIControlStateNormal];
        [self buttonClick:btn];
        
        
    }

//    // 取消前一个选中的，就是单选啦
//    NSIndexPath *_lastIndex = [NSIndexPath indexPathForRow:_index inSection:0];
//    UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:_lastIndex];
//    lastCell.accessoryType = UITableViewCellAccessoryNone;
//    // 选中操作
//    //    UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    // 保存选中的
//    _index = indexPath.row;

}
- (void)creatDetailCity
{
    
    
}
@end

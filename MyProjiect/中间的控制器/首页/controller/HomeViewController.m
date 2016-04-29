//
//  HomeViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "HomeViewController.h"
#import "ADmodel.h"
#import "WebViewController.h"
#import "GroupViewController.h"
#import "JingxuanTableViewCell.h"
#import "IndexDataService.h"
#import "JingxuanModel.h"
#import "MJRefresh.h"
#import "SearchViewController.h"
#import "WFFirstOpenView.h"
@interface HomeViewController ()
{
    UIPageControl *pageCtrl;
    UIImageView *adView;
    UIButton *adBtn;
    NSArray *adArrarys;//广告循环
    NSTimer *timer;//循环的定时器
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //初始化导航栏按钮
    [self _initNavigationItem];
    
    //请求头部数据
    [self _requestAD];

    //初始化tableView
    [self _inittabelViews];
    
    //精选产品数据
    
    [self requestCellData];
    
    //开启加载提示
    [self showHud:@"拼命加载..."];
    


    
    
}
- (void)_inittabelViews
{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -20) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //初始化头部视图
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 450)];
    _headerView.backgroundColor=[UIColor whiteColor];
     //一定开启触摸
    _headerView.userInteractionEnabled = YES;
    
    _tableView.tableHeaderView=_headerView;//头视图
    [self.view addSubview:_tableView];
    //初始化头部
    [self _initHeaderView];

    //下拉刷新
//    [_tableView  addHeaderWithTarget:self action:@selector(headerRereshing)];
    //上拉刷新
//    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];


}


#pragma mark 2.上拉刷新
- (void)footerRereshing
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary ];
    
    if (_moreData.count > 0) {
        
        JingxuanModel *model = [_moreData lastObject];
        
    }
    [IndexDataService requestCellData:@"app_selected_product"
                           httpMethod:@"GET"
                               params:params
                       finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                           
                           NSMutableArray *jingxuanModels=[NSMutableArray array];
                           NSArray *data = result[@"data"];
                           
                           for (NSDictionary *dic in data) {
                               
                               JingxuanModel *model=[[JingxuanModel alloc] initContentWithDic:dic];
                               
                               [jingxuanModels addObject:model];
                           }
                           
                           if (jingxuanModels.count > 1) {
                               
                               [jingxuanModels removeObjectAtIndex:0];
                               
                               [self.moreData addObject:jingxuanModels];
                               
                               _data = self.moreData;
                               //刷新
                               [_tableView reloadData];
                               
                           }else{
                           //移除上拉控件
                            [_tableView removeFooter];
                               
                           }
                           
                           [_tableView footerEndRefreshing];

                           
//                           [_tableView reloadData];//记得刷新数据
                           
                           //关闭提示加载
                           [self comleteLoading:@"OK"];
                           
                       }
                      failuerdidBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                          
                          NSLog(@"indexCelldata Error");
                          
                          //2,自动结束刷新
                          [self.tableView footerEndRefreshing];

                      }];
    
    
}
#pragma  mark _initHeaderView
- (void)_initHeaderView
{
//    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
//    _scrollView.delegate=self;
//    _scrollView.backgroundColor=[UIColor redColor];
//    _scrollView.pagingEnabled=YES;
//    _scrollView.contentSize=CGSizeMake(kScreenWidth * 7, 0);
//    _scrollView.scrollEnabled=YES;
//    _scrollView.showsHorizontalScrollIndicator=NO;
//    _scrollView.showsVerticalScrollIndicator=NO;
//    _scrollView.bounces = NO;
//    _scrollView.tag=300;
    
    //1.广告视图

    
    //2.分类按钮视图
    NSArray *imgArray=@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    NSArray *imgNames=@[@"旅行",@"机票",@"玩乐",@"签证"];
    for (int i= 0; i< 4; i++) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag=100 + i;
        button.frame=CGRectMake(kScreenWidth / 4 * i+15 , 155, 50, 40);
        NSString *imgStr=imgArray[i];
        
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(button.left+10, button.bottom, 100, 20)];
        label.text = imgNames[i];
        label.font=[UIFont systemFontOfSize:15];
        [_headerView addSubview:label];
        [button setBackgroundImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_headerView addSubview:button];

    }

    //3.每周推荐
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
        button1.tag=105;
    button1.frame=CGRectMake(10, 225, kScreenWidth-20, 100);
    [button1 setBackgroundImage:[UIImage imageNamed:@"h1.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button1];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag=106;
    button2.frame=CGRectMake(5, 330, (kScreenWidth-20)/2, 100);
    [button2 setBackgroundImage:[UIImage imageNamed:@"h2.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button2];
    
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
    button3.tag=107;
    button3.frame=CGRectMake((kScreenWidth-20)/2 + 10, 330, (kScreenWidth-20)/2, 100);
    [button3 setBackgroundImage:[UIImage imageNamed:@"h3.png"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button3];
    
    
}

#pragma mark 页面跳转
- (void)buttonClick:(UIButton *)btn
{
 
    NSInteger index=btn.tag - 100;
    if (index ==0)
    {//自由行
        
        WebViewController *freelVC=[[WebViewController alloc] init];
        
        freelVC.htmlString=@"http://m.qyer.com/z/zt/zszapp&source=app&campaign=zkapp&category=zksy_zszapp/";
        
        [self.navigationController pushViewController:freelVC animated:nil];
        
    
    }else if (index == 1)
    {//机票
        WebViewController *ticketVC=[[WebViewController alloc] init];
        
        ticketVC.htmlString=@"http://m.qyer.com/z/zt/flysale2&source=app&campaign=zkapp&category=zk2_flysale2/";
        
        [self.navigationController pushViewController:ticketVC animated:nil];
    
    }else if (index == 2)
    {//酒店
        WebViewController *hotelVC=[[WebViewController alloc] init];
        hotelVC.htmlString=@"http://m.qyer.com/z/zt/20150916&source=app&campaign=zkapp&category=zksy_20150916/";
        [self.navigationController pushViewController:hotelVC animated:YES];
        
    }else if (index == 3)
    {//签证
        
        WebViewController *ticketVC=[[WebViewController alloc] init];
        ticketVC.htmlString=@"http://m.qyer.com/z/zt/visasale&source=app&campaign=zkapp&category=zk3_visasale/";
        [self.navigationController pushViewController:ticketVC animated:nil];
        
    }else if (index == 4)
    {//更多-->分类页面
//         GroupViewController *groupVC=[[GroupViewController alloc] init];
//        groupVC.view.backgroundColor=[UIColor whiteColor];
//        [self.navigationController pushViewController:groupVC animated:NO];
        
        NSLog(@"self.tabBarController.tabBarItem is %@",self.tabBarController.tabBarItem);
    
        
        
    }else if (index == 5)
    {//购签证
        WebViewController *weekendsVC=[[WebViewController alloc] init];
        weekendsVC.htmlString=@"http://m.qyer.com/z/zt/visasale&source=app&campaign=zkapp&category=zk3_visasale/";
        [self.navigationController pushViewController:weekendsVC animated:YES];
 
    }else if (index == 6)
    {//超值机票
        
        WebViewController *hotelVC=[[WebViewController alloc] init];
        hotelVC.htmlString=@"http://m.qyer.com/z/zt/flysale2&source=app&campaign=zkapp&category=zk2_flysale2/";
        [self.navigationController pushViewController:hotelVC animated:YES];
        

    }else if (index == 7)
    {//本周推荐
        WebViewController *ticketVC=[[WebViewController alloc] init];
        
        ticketVC.htmlString=@"http://m.qyer.com/z/zt/hotsale8&source=app&campaign=zkapp&category=zk1_hotsale8/";
        [self.navigationController pushViewController:ticketVC animated:nil];
    }



    
}


- (void)_requestAD
{
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    NSMutableArray *mArr=[NSMutableArray array];
    NSMutableArray *imgArr=[NSMutableArray array];
    NSMutableArray *urlArr=[NSMutableArray array];

    [DataService requestWithURL:@"home/major"
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     
                     NSDictionary *myData = result[@"data"];
                     NSArray *slide = [myData objectForKey:@"slide"];
                     for (NSDictionary *dic in slide) {

                         ADmodel *adModel=[[ADmodel alloc] initContentWithDic:dic];
                         
                         
                         NSString *imgStr=adModel.img;
                         NSString *urlStr=adModel.url;
                         [imgArr addObject:imgStr];
                         [urlArr addObject:urlStr];
                         [mArr addObject:adModel];
                         
//                         NSLog(@"imgString is %@",imgStr);


                     }

                     _urlData=urlArr;
                     _imgData=imgArr;
                     
                     /************头部滑动视图*************/
                     
                     dispatch_async(dispatch_get_main_queue(), ^{
                       
                         NSMutableArray *viewsArr=[@[] mutableCopy];
                        
                         for (int i=0; i < imgArr.count; i ++) {
                             adView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth, 150)];
                             [adView sd_setImageWithURL:[NSURL URLWithString:imgArr[i]]];
                             
                             [_headerView addSubview:adView];

                             [viewsArr addObject:adView];
                             
                         }
                         
                         //页面控制器
                         pageCtrl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, 120 , kScreenWidth, 20)];
                         pageCtrl.numberOfPages=imgArr.count;
                         pageCtrl.currentPageIndicatorTintColor=[UIColor blueColor];
                         pageCtrl.pageIndicatorTintColor=[UIColor whiteColor];
                        //滚动视图
                         headerScrollView=[[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150) animationDuration:2];
                         
                         headerScrollView.totalPagesCount = ^NSInteger (void){
                         
                             return imgArr.count;
                             
                         };
                         
                         //创建滑动视图上显示标题的label
                         UILabel *tiplabel=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 50, 10, 30, 30)];
                         tiplabel.textColor= [UIColor whiteColor];
                         tiplabel.alpha=0.8;
                         __weak HomeViewController *weakVC=self;
                         headerScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
                             
//                             NSLog(@"count is %ld",viewsArr.count);
                             tiplabel.text = [NSString stringWithFormat:@"%ld/%ld",pageIndex+1,viewsArr.count];
                             tiplabel.backgroundColor=[UIColor darkGrayColor];
                             
                             __strong HomeViewController *strongVC=weakVC;
                               [strongVC->_headerView addSubview:tiplabel];
                               strongVC->pageCtrl.currentPage = pageIndex;
                             
                             return viewsArr[pageIndex];
                         };
                         
                         [_headerView addSubview:headerScrollView];
                         [_headerView addSubview:pageCtrl];

                     });
                     
                     [_tableView reloadData];
                     
                 }
                   failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                       
                       NSLog(@"AD request ERROR");
                       
                   }];

}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return _data.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    
    JingxuanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //从nib加载cell
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"JingxuanTableViewCell" owner:nil options:nil];
        cell=[nibs lastObject];
        
        cell.backgroundColor=[UIColor clearColor];
    }
    
    cell.model=_data[indexPath.row];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

//单元格头部视图
//设置组头部的文字

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100,10 , 150, 30)];
    label.font=[UIFont boldSystemFontOfSize:15];
    label.textColor= [UIColor orangeColor];
    NSArray *textArr=@[@"热门专题"];
    label.text=[NSString stringWithFormat:@"%@",textArr[section]];
    return label;
}

//单元格点击了
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"cell is %ld",indexPath.row);

    JingxuanTableViewCell *cell = (JingxuanTableViewCell *)[_tableView cellForRowAtIndexPath:indexPath];
    
    WebViewController *webVC=[[WebViewController alloc] init];
    webVC.htmlString= cell.model.url ;//重要
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark requestCellData

- (void)requestCellData
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary ];
    [IndexDataService requestCellData:@"app_selected_product"
                           httpMethod:@"GET"
                               params:params
                       finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                           
                           NSMutableArray *mArr=[NSMutableArray array];
                           NSArray *data = result[@"data"];
                           
                           for (NSDictionary *dic in data) {
                               
                               JingxuanModel *model=[[JingxuanModel alloc] initContentWithDic:dic];
                               
                               [mArr addObject:model];
                           }
                           
                           _data=mArr;
                           
                           [_tableView reloadData];//记得刷新数据
                           
                           //关闭提示加载
                           [self comleteLoading:@"OK"];

                       }
                      failuerdidBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                          
                          NSLog(@"indexCelldata Error");
                      }];
    
    
}
#pragma mark 导航栏按钮
- (void)_initNavigationItem
{
    //导航栏按钮
    //左侧-定位
//    UIImage *leftbafImage=[UIImage imageNamed:@""];
//    UIGraphicsBeginImageContext(CGSizeMake(30, 30));
//    [leftbafImage drawInRect:CGRectMake(0, 0, 30, 30)];
//    leftbafImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.frame=CGRectMake(-10, 0, 30, 30);
//    [leftBtn setBackgroundImage:leftbafImage forState:UIControlStateNormal];
//    leftBtn.backgroundColor=[UIColor clearColor];
//    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    //右侧-搜索
    UIImage *rightImage=[UIImage imageNamed:@"User_Guide_Glass.png"];
    UIGraphicsBeginImageContext(CGSizeMake(40, 40));
    [rightImage drawInRect:CGRectMake(0, 0, 40, 40)];
    rightImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(kScreenWidth - 50, 0, 40, 40);
    [rightBtn setBackgroundImage:rightImage forState:UIControlStateNormal];
    rightBtn.backgroundColor=[UIColor clearColor];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
    
}
- (void)leftBtnClick:(UIButton *)btn
{
  //地图
    
    
}

- (void)rightBtnClick:(UIButton *)btn
{
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
    SearchViewController *searVC=[[SearchViewController alloc] init];
    
    [self.navigationController pushViewController:searVC animated:YES];

    
}


@end

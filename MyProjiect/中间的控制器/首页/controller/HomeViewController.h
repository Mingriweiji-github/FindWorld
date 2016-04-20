//
//  HomeViewController.h
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIView *_headerView;//头部视图
    
    CycleScrollView *headerScrollView;//头视图上的滚动视图

    
//    UIScrollView *_scrollView;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSArray *imgData;
@property(nonatomic,strong)NSArray *urlData;

@property(nonatomic,strong)NSMutableArray *moreData;
@end

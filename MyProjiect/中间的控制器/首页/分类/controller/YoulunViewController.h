//
//  YoulunViewController.h
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface YoulunViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *data;

@property(nonatomic,strong)UITableView *typeTableV;//类型选择
@property(nonatomic,strong)UITableView *departTabelV;//出发地选择
@property(nonatomic,strong)UITableView *timeTabelV;//时间选择
@property(nonatomic,strong)UITableView *destinationTabelV;//目的地选择
@property(nonatomic,strong)UITableView *detailTableView;//目的地选择


@property(nonatomic,strong)NSArray  *typeData;
@property(nonatomic,strong)NSArray  *departData;
@property(nonatomic,strong)NSArray  *timeData;
@property(nonatomic,strong)NSArray  *destinationData;
@property(nonatomic,strong)NSArray  *detailData;
@property(nonatomic,strong)NSArray *countryArr;
@property(nonatomic,copy)NSString *country_name;
@property(nonatomic,copy)NSString *continent;

@property(nonatomic,copy)NSString *titleName;
@property(nonatomic,copy)NSString *jsonName;
@end

//
//  PickedViewController.h
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface PickedViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSMutableArray *imgArr;
@end

//
//  FWPassengerViewController.m
//  FindWorld
//
//  Created by Mr.Li on 16/4/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "FWPassengerViewController.h"
#import "WFPassengerCell.h"
@interface FWPassengerViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation FWPassengerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 44) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark delegete


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier=@"Cell";
    WFPassengerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        
        cell = [[WFPassengerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"section:%ld , row:%ld",indexPath.section,indexPath.row);

}
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//}

@end

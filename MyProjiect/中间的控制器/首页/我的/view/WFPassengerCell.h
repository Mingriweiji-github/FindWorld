//
//  WFPassengerCell.h
//  FindWorld
//
//  Created by Mr.Li on 16/4/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFPassengerModel.h"
@interface WFPassengerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *identiLabel;

@property( weak ,nonatomic)WFPassengerModel *model;

@end

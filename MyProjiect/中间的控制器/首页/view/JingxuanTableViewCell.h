//
//  JingxuanTableViewCell.h
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JingxuanModel.h"
@interface JingxuanTableViewCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_imageView;
    
    __weak IBOutlet UILabel *_titleLabel;
    
    
    __weak IBOutlet UILabel *_departureTime;
    
    __weak IBOutlet UILabel *_pricelabel;
    
    
}

@property(nonatomic,strong)JingxuanModel *model;

@end

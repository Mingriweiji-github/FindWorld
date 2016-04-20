//
//  FlightCollectionViewCell.h
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketModel.h"
@interface FlightCollectionViewCell : UICollectionViewCell
{
    
    
    __weak IBOutlet UIImageView *_imageView;
    
    
    __weak IBOutlet UILabel *_titlelabel;
    
    
    __weak IBOutlet UILabel *_timeLabel;
    
    
    __weak IBOutlet UILabel *_pricelabel;
    
    
    
    __weak IBOutlet UILabel *_zekouLabel;
    
    
    
    
    
    
    
}

@property(nonatomic,strong)TicketModel *model;
@end

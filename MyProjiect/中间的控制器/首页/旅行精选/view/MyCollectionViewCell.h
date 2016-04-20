//
//  MyCollectionViewCell.h
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"
@interface MyCollectionViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *_imageVIew;
    
    __weak IBOutlet UILabel *_titlelabel;
    
    __weak IBOutlet UILabel *_timeLabel;
    
    
    __weak IBOutlet UILabel *_pricelabel;
  
    __weak IBOutlet UILabel *_zhekoulabel;
    
  
    
}

@property(nonatomic,strong)CollectionModel *model;
@end

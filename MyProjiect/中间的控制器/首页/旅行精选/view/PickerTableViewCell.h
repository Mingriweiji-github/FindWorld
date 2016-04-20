//
//  PickerTableViewCell.h
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickedModel.h"
@interface PickerTableViewCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageView;
    
}

@property(nonatomic,strong)PickedModel *model;
@end

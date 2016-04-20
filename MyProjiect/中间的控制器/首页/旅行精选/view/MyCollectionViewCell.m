//
//  MyCollectionViewCell.m
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
}

- (void)setModel:(CollectionModel *)model
{
    if (_model != model) {
        _model = model;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageVIew sd_setImageWithURL:[NSURL URLWithString:self.model.pic]];
    
    _titlelabel.text=self.model.title;
    
    _pricelabel.text=[NSString stringWithFormat:@"%@元起",self.model.buy_price];
    
    _timeLabel.text=self.model.departureTime;
    
    _zhekoulabel.text=self.model.lastminute_des;
    
    
    
    
}
@end

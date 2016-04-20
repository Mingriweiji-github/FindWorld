//
//  FlightCollectionViewCell.m
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FlightCollectionViewCell.h"

@implementation FlightCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
}

- (void)setModel:(TicketModel *)model
{
    if (_model != model) {
        _model = model;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.model.pic]];
    
    _titlelabel.text=self.model.title;
    
    _timeLabel.text=self.model.departureTime;
    
    _zekouLabel.text=self.model.lastminute_des;
    
    _pricelabel.text=[NSString stringWithFormat:@"%@元起",self.model.buy_price];
    _pricelabel.font=[UIFont systemFontOfSize:15];
    
    
    
    
}

@end

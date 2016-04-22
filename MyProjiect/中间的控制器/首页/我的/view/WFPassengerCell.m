//
//  WFPassengerCell.m
//  FindWorld
//
//  Created by Mr.Li on 16/4/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "WFPassengerCell.h"

@implementation WFPassengerCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    
}

- (void)setModel:(WFPassengerModel *)model
{
    if (_model != model) {
        
        _model = model;
        
        [self setNeedsLayout];
        
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //图片
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.model.imgUrl]];
//    
//    //    NSLog(@"_model.title is %@",_model.title);
//    _titleLabel.text=[NSString stringWithFormat:@"%@",self.model.title];
//    
//    //    NSLog(@"_departureTime.title is %@",_model.departureTime);
//    _departureTime.text=[NSString stringWithFormat:@"出发时间：%@",self.model.departureTime];
//    
//    //    _pricelabel.text=[NSString stringWithFormat:@"%@",self.model.price];
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

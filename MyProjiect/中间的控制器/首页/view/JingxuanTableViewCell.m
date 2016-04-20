//
//  JingxuanTableViewCell.m
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "JingxuanTableViewCell.h"

@implementation JingxuanTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    
}

- (void)setModel:(JingxuanModel *)model
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
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.model.imgUrl]];
    
//    NSLog(@"_model.title is %@",_model.title);
    _titleLabel.text=[NSString stringWithFormat:@"%@",self.model.title];
    
//    NSLog(@"_departureTime.title is %@",_model.departureTime);
    _departureTime.text=[NSString stringWithFormat:@"出发时间：%@",self.model.departureTime];
    
//    _pricelabel.text=[NSString stringWithFormat:@"%@",self.model.price];
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

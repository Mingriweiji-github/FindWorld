//
//  PickerTableViewCell.m
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PickerTableViewCell.h"

@implementation PickerTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    
}

- (void)setModel:(PickedModel *)model
{
    if (_model != model) {
        _model = model;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.img]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

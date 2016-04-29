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
    
    self.nameLabel.text = [NSString stringWithFormat:@"姓名：%u",arc4random() / 2];
    self.phoneLabel.text= [NSString stringWithFormat:@"%u",arc4random() / 2];
    self.identiLabel.text = [NSString stringWithFormat:@"身份证%u",arc4random() / 2];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

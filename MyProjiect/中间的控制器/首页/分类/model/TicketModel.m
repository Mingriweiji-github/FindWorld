//
//  TicketModel.m
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TicketModel.h"

@implementation TicketModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //;;
        _myID=[[[jsonDic objectForKey:@"data"] objectForKey:@"lastminutes"] objectForKey:@"id"];
        
        
        
    }
    return self;
    
}
@end

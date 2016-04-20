//
//  TypeModel.m
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TypeModel.h"

@implementation TypeModel

-(id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        
        
        _myId = [[[jsonDic objectForKey:@"data"] objectForKey:@"type"] objectForKey:@"id"];

        
        _myDescription= [[[jsonDic objectForKey:@"data"] objectForKey:@"times_drange"] objectForKey:@"description"];
        
        _country_name = [[[[jsonDic objectForKey:@"data"] objectForKey:@"poi"] objectForKey:@"country"] objectForKey:@"country_name"];
    }
    
    return self;
    
}
@end

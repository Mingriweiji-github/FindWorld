//
//  JingxuanModel.m
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "JingxuanModel.h"

@implementation JingxuanModel
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //;;
        
        self.myID=[[jsonDic objectForKeyedSubscript:@"data"] objectForKey:@"id"];
    }
    return self;
    
}
@end

//
//  LocalDataRequest.m
//  MyProjiect
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LocalDataRequest.h"

@implementation LocalDataRequest

+ (id)requestLocalData:(NSString *)fileName
{
    //文件路径
    NSString *filePath=[[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    //解析
    NSError *error=nil;
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (json == nil) {
        
        //解析失败
        NSLog(@"本地解析失败");
        
        return nil;
    }
    
    return json;
    
}

@end

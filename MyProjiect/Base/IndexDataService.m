//
//  IndexDataService.m
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "IndexDataService.h"

#define Base_url @"http://open.qyer.com/lastminute/"
@implementation IndexDataService

+ (AFHTTPRequestOperation *)requestCellData:(NSString *)urlString
                                 httpMethod:(NSString *)method
                                     params:(NSMutableDictionary *)params
                             finishDidBlock:(FinishDidBlock)finishblock
                            failuerdidBlock:(FailuerBlock)failureBlock
{
    //1.
    urlString = [Base_url stringByAppendingString:urlString];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    
    AFHTTPRequestOperation *myOperation = [manager GET:urlString
                                            parameters:params
                                               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                   
                                                   NSLog(@"cellData sucess");

                                                   if (finishblock) {
                                                       
                                                       finishblock(operation,responseObject);
                                                   }
                                                   
                                               }
                                           
                                               failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                   NSLog(@"cellData ERROR");
                                                   if (failureBlock) {
                                                       failureBlock(operation,error);
                                                       
                                                   }
                                                   
                                               }];
    
    //解析返回格式
    myOperation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    
    return myOperation;
    
}
@end

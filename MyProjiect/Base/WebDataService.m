//
//  DataService.m
//  UI05-task-homework
//
//  Created by keyzhang on 15/9/8.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "WebDataService.h"

#define BASE_URL @""

@implementation WebDataService

//NSURLConnection请求网络
+ (void)requestData:(NSString *)urlStr
        htttpMethod:(NSString *)method
             params:(NSMutableDictionary *)params
   completionHandle:(void(^)(id result))block
{
    //1.构建URL
    urlStr = [BASE_URL stringByAppendingString:urlStr];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //2.构建request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:method];
    
    //get方法拼接参数
    if ([method isEqualToString:@"GET"]) {
        //拼接URL---》https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.00SllYeF568jxC1082c39bc40_Vqyg&username=aaa&pass=bbb
        
        
        NSMutableString *paramsString = [[NSMutableString alloc] initWithString:@"?"];
        
        for (int i = 0; i < params.count; i++) {
            NSString *key = params.allKeys[i];
            NSString *value = params[key];
            
            [paramsString appendFormat:@"%@=%@", key, value];
            
            if (i < params.count - 1) {
                [paramsString appendFormat:@"&"];//拼接符号&
            }
        }
        
        request.URL = [NSURL URLWithString:[urlStr stringByAppendingString:paramsString]];
    }else if ([method isEqualToString:@"POST"]) {
        
        NSMutableString *paramsString = [[NSMutableString alloc] initWithString:@""];
        
        
        for (int i = 0; i < params.count; i++) {
            NSString *key = params.allKeys[i];
            NSString *value = params[key];
            
            [paramsString appendFormat:@"%@=%@", key, value];
            
            if (i < params.count - 1) {
                [paramsString appendFormat:@"&"];
            }
        }
        
        //设置参数paramsString的请求体
        //access_token=2.00SllYeF568jxC1082c39bc40_Vqyg&username=aaa&pass=bbb
        NSData *bodyData = [paramsString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];//设置参数的请求体
        
    }
    
    
    
    //构建connection对象
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   NSLog(@"Error: %@", connectionError);
                                   return;
                               }
                               
                               //解析Json
                               id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                               
                               //回到主线程调用block
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   //回掉block
                                   block(result);
                               });
                           }];
    
}

//AF网络请求
+ (void)requestAFData:(NSString *)urlStr httpMethod:(NSString *)method params:(NSMutableDictionary *)params completionHandle:(void(^)(id result))block
{
    //1.URL
    
    urlStr=[BASE_URL stringByAppendingString:urlStr];
    
   //2.manager
    AFHTTPRequestOperation *operation=nil;
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    if ([method isEqualToString:@"GET"]) {
        
      operation =  [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            block(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"error is %@",error);
        }];
    }else if ([method isEqualToString:@"POST"]){
    
        BOOL isFile=NO;
        //判断是否为文件数据
        for (id key in params) {
            id value=params[key];
            
            if ([value isKindOfClass:[NSData class]]) {
                
                isFile=YES;
                break;
            }
            
        }
        
        
        
        
        
        if (!isFile) {
          operation= [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                block(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                NSLog(@"error is %@",error);
            }];
        }else if (isFile){
        
        operation=[manager POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            for (id key in params) {
                
                id value=params[key];
                
                if ([value isKindOfClass:[NSData class]]) {
                    
                    [formData appendPartWithFileData:value name:key fileName:key mimeType:@"image/jpeg"];
                }
                
            }
            
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            block(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error is %@",error);
        }];

        
        }
    

    
    }
    
    
    
//operation.responseSerializer
    operation.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    
}










@end

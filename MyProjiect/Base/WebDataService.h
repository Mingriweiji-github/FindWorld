//
//  DataService.h
//  UI05-task-homework
//
//  Created by keyzhang on 15/9/8.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface WebDataService : NSObject

+ (void)requestData:(NSString *)urlStr
        htttpMethod:(NSString *)method
             params:(NSMutableDictionary *)params
   completionHandle:(void(^)(id result))block;

+ (void)requestAFData:(NSString *)urlStr httpMethod:(NSString *)method params:(NSMutableDictionary *)params completionHandle:(void(^)(id result))block;


@end

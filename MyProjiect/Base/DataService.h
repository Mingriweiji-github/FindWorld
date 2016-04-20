//
//  DataService.h
//  Project_Weibo47
//
//  Created by keyzhang on 15/9/14.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishDidBlock)(AFHTTPRequestOperation *operation, id result);

typedef void(^FailuerBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface DataService : NSObject

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                params:(NSMutableDictionary *)params
            httpMethod:(NSString *)httpMethod
        finishDidBlock:(FinishDidBlock)finishDidBlock
          failuerBlock:(FailuerBlock)failuerBlock;


@end

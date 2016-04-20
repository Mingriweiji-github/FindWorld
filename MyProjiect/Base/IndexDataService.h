//
//  IndexDataService.h
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishDidBlock)(AFHTTPRequestOperation *operation, id result);

typedef void(^FailuerBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface IndexDataService : NSObject


+ (AFHTTPRequestOperation *)requestCellData:(NSString *)urlString
                                 httpMethod:(NSString *)method
                                     params:(NSMutableDictionary *)params
                             finishDidBlock:(FinishDidBlock)finishblock
                            failuerdidBlock:(FailuerBlock)failureBlock;

@end

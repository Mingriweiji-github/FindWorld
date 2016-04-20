//
//  JingxuanModel.h
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
/*
 {
 "status": 1,
 "info": "",
 "times": 0,
 "data": [
 {
 "productType": "1018",
 "productTypeEngDesc": "free",
 "departureTime": "八月,九月,十月,十一月,十二月,一月",
 "price": "<em>999</em>元起",
 "sale_count": "170",
 "_id": 0,
 "id": "50471",
 "openType": 1,
 "title": "【秒杀】上海直飞冲绳4-5天往返含税机票(可选自由行套餐)",
 "url": "http://m.qyer.com/z/deal/50471?source=app2&client_id=qyer_discount_androi&track_app_version=1.7.2&track_deviceid=99000661257338&ra_referer=app_home",
 "imgUrl": "http://pic.qyer.com/lastminute/library/2015/04/16/552f6f24ca265.jpg/600x400",
 "type": "deal"
 },
 
 */
@interface JingxuanModel : BaseModel

@property(nonatomic,copy)NSString *productType;
@property(nonatomic,copy)NSString *productTypeEngDesc;
@property(nonatomic,copy)NSString *departureTime;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *myID;//特殊
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *url;//h5链接
@property(nonatomic,copy)NSString *imgUrl;//图片地址


@end

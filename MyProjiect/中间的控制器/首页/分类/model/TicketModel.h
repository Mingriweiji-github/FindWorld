//
//  TicketModel.h
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "BaseModel.h"
/*
 {
 "status": 1,
 "info": "",
 "times": 0,
 "data":
 
 {
 "count": 403,
 "orderName": "r0|s1|s2|s3|i4",
 "orderValue": "0|110184|0|1443411773|49252",
 "kw": "",
 "page": 1,
 "sequence": "",
 "recommend": [],
 "lastminutes": [
 {
 "id": "54420",
 "productType": "1016",
 "title": "【国庆假期】上海直飞普吉岛6天往返含税机票(赠送电子地图)",
 "pic": "http://pic.qyer.com/public/lastmin/lastminute/2015/09/18/14425736218313/600x400",
 "price": "<em>1099</em>元起",
 "booktype": "1",
 "firstpay_end_time": "1448812800",
 "end_date": "已结束预订",
 "feature": "",
 "list_price": "2599",
 "buy_price": "1099",
 "self_use": 0,
 "first_pub": 0,
 "perperty_today_new": 0,
 "sale_count": "440",
 "lastminute_des": "4.2折",
 "url": "http://m.qyer.com/z/deal/54420/?source=app2&client_id=qyer_discount_androi&track_app_version=1.7.2&track_deviceid=99000661257338&ra_referer=app_home&ra_arg=6ee8c53fd8a21205f7b2746a5d472e3dc1229531",
 "departureTime": "九月,十月,十一月"
 },
 */
@interface TicketModel : BaseModel

@property(nonatomic,copy)NSString *myID;
@property(nonatomic,copy)NSString *productType;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *pic;//图片
@property(nonatomic,copy)NSString *end_date;
@property(nonatomic,copy)NSString *buy_price;//价格
@property(nonatomic,copy)NSString *sale_count;
@property(nonatomic,copy)NSString *lastminute_des;//折扣
@property(nonatomic,copy)NSString *url;//链接
@property(nonatomic,copy)NSString *departureTime;//日期
@property(nonatomic,copy)NSString *page;
@property(nonatomic,copy)NSString *orderName;






@end

//
//  CollectionModel.h
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface CollectionModel : BaseModel
/*
 "lastminutes": [
 {
 "id": "43490",
 "productType": "2410",
 "title": "台湾高雄至垦丁接/送单程拼车(火车站/高铁站/机场)",
 "pic": "http://pic.qyer.com/public/lastmin/lastminute/2015/09/23/14429729897404/600x400",
 "price": "<em>80</em>元起",
 "booktype": "1",
 "firstpay_end_time": "1451318400",
 "end_date": "已结束预订",
 "feature": "",
 "list_price": "105",
 "buy_price": "80",
 "self_use": 0,
 "first_pub": 0,
 "perperty_today_new": 0,
 "lastminute_des": "7.6折",
 "url": "http://m.qyer.com/z/deal/43490/?source=app2&client_id=qyer_discount_androi&track_app_version=1.7.2&track_deviceid=99000661257338&track_user_id=6790326&ra_referer=play_and_fun",
 "departureTime": "六月,七月,八月,九月,十月,十一月,十二月"
 },
 */
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *pic;//图片地址
@property(nonatomic,copy)NSString *lastminute_des;//折扣
@property(nonatomic,copy)NSString *buy_price;//价格
@property(nonatomic,copy)NSString *departureTime;//日期
@property(nonatomic,copy)NSString *url;//h5链接

@end

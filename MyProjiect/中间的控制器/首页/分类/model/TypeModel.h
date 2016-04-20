//
//  TypeModel.h
//  MyProjiect
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface TypeModel : BaseModel
/*
 "data": 
 {
 "type": [
 {
 "id": 0,
 "name": "all",
 "catename": "全部类型"
 },
 {
 "id": 1016,
 "name": "flights",
 "catename": "机票",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538257433"
 },
 {
 "id": 1017,
 "name": "hotels",
 "catename": "酒店",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538826864"
 },
 {
 "id": 1018,
 "name": "free",
 "catename": "自由行",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538588569"
 },
 {
 "id": 1785,
 "name": "qz",
 "catename": "签证",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538478147"
 },
 {
 "id": 1020,
 "name": "cruise",
 "catename": "邮轮",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538674142"
 },
 {
 "id": 1021,
 "name": "car",
 "catename": "租车",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538369204"
 },
 {
 "id": 1049,
 "name": "safe",
 "catename": "保险",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406538139200"
 },
 {
 "id": 2410,
 "name": "cityfun",
 "catename": "城市玩乐",
 "icon": "http://pic.qyer.com/public/lastmin/config/2015/08/27/14406537929272",
 "sub_cate": [
 {
 "id": 2410,
 "name": "all",
 "catename": "全部"
 },
 {
 "id": 2375,
 "name": "wifi",
 "catename": "Wi-Fi / 电话卡"
 },
 {
 "id": 2376,
 "name": "transport",
 "catename": "接送机 / 拼车 / 包车"
 },
 {
 "id": 2377,
 "name": "ticket",
 "catename": "公园 / 景点门票"
 },
 {
 "id": 2378,
 "name": "spa",
 "catename": "按摩SPA"
 },
 {
 "id": 2379,
 "name": "outside",
 "catename": "特色活动 / 户外"
 },
 {
 "id": 2380,
 "name": "food",
 "catename": "美食 / 厨艺"
 },
 {
 "id": 2381,
 "name": "event",
 "catename": "演出 / 赛事"
 },
 {
 "id": 2382,
 "name": "citypass",
 "catename": "交通票券 / 城市通票"
 },
 {
 "id": 2369,
 "name": "island",
 "catename": "海岛 / 出海"
 },
 {
 "id": 2371,
 "name": "natural",
 "catename": "自然景观"
 },
 {
 "id": 2372,
 "name": "humanity",
 "catename": "人文体验"
 },
 {
 "id": 2373,
 "name": "shopping",
 "catename": "购物 / 折扣券"
 }
 ]
 }
 ],
 */
/*
 "city": "gzsz",
 "city_des": "广州/深圳"
 */


/*
 "poi": [
 {
 "continent_id": 0,
 "continent_name": "全部目的地",
 "country": [
 {
 "country_id": 0,
 "country_name": "全部目的地"
 }
 ]
 },
 */
/*
 
 "times_drange": [
 {
 "times": "",
 "description": "全部时间"
 },
 */
@property(nonatomic,copy)NSString *myId;
@property(nonatomic,copy)NSString *catename;//分类
@property(nonatomic,copy)NSString *city_des;//出发地
@property(nonatomic,copy)NSString *myDescription;//旅行时间
@property(nonatomic,copy)NSString *continent_name;//洲
@property(nonatomic,copy)NSString *country_name;//国家
@property(nonatomic,copy)NSArray *country;//洲




@end

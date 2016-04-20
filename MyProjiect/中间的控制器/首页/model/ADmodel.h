//
//  ADmodel.h
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface ADmodel : BaseModel
/*
 {
 "id": "",
 "open_type": "3",
 "title": "城市玩乐大促",
 "url": "http://m.qyer.com/z/zt/20150916&source=app&campaign=zkapp&category=zksy_20150916/?ra_referer=index_ad",
 "img": "http://pic.qyer.com/public/lastmin/app_operation/2015/09/16/14423972431428?imageMogr2/thumbnail/!750x375r",
 "type": "topic"
 },
 */
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *url;//AD的H5地址
@property(nonatomic,copy)NSString *img;//图片
@property(nonatomic,copy)NSString *type;//类型





@end

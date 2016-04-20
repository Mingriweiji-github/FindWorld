//
//  PickedModel.h
//  MyProjiect
//
//  Created by imac on 15/10/5.
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
 "title": "台湾",
 "img": "http://pic.qyer.com/public/lastmin/app_operation/2015/09/09/14417779773901?imageMogr2/thumbnail/!710x426r",
 "ids": "43490,52212,43015,46449,46338,46451,43018,42977,41352,43235,43023,43038,43046,43556,43561,45929,45984,46000,46009,46011,43508,54301,44377,43554,44303,43316,43529,43551,43526,43521,43065,45967,43059,46001,45987,43512,43545"
 },
 {
 "title": "日本",
 "img": "http://pic.qyer.com/public/lastmin/app_operation/2015/09/09/14417786213730?imageMogr2/thumbnail/!710x426r",
 "ids": "50234,50262,50239,50260,50529,50432,50509,48153,50639,44776,50662,50968,45760,49817,46505,53800,44773,54018,54019,49063,53013,53341,54301,46116,49655,54028,52670,53334,52961,53019,52674,52009,50601,53801,53788,53785,53776,53775,49184,49110,49112,53317,49903,53267,53293,53297,49913,53254,53252,53265"
 },
 */
@interface PickedModel : BaseModel

@property(nonatomic,copy)NSString *img;//头部图片

@property(nonatomic,copy)NSString *title;


@end

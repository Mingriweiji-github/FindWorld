//
//  PhoneViewController.h
//  MyProjiect
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface PhoneViewController : BaseViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(strong,nonatomic)NSArray *data;

@end

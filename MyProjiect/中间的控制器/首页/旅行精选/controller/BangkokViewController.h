//
//  BangkokViewController.h
//  MyProjiect
//
//  Created by imac on 15/10/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface BangkokViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,copy)NSString *img;

@end

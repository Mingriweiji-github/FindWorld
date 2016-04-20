//
//  JapenViewController.h
//  MyProjiect
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface JapenViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,copy)NSString *img;


@end

//
//  BaseViewController.h
//  MyProjiect
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController
{
    MBProgressHUD *_hud;//加载
}

- (void)showHud:(NSString *)title;//加载提示

- (void)comleteLoading:(NSString *)title;//加载完成提示
@end

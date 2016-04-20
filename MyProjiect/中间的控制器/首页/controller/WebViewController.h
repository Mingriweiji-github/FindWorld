//
//  WebViewController.h
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
@class MBProgressHUD;

@interface WebViewController : BaseViewController<UIWebViewDelegate>


@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)NSString *htmlString;
//@property(nonatomic,strong)MBProgressHUD *progressHud;
@end

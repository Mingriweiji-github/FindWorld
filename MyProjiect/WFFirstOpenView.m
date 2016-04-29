//
//  WFFirstOpenView.m
//  AirMedia
//
//  Created by MAC on 15/12/14.
//  Copyright © 2015年 WS. All rights reserved.
//

#import "WFFirstOpenView.h"

@implementation WFFirstOpenView
{
    NSMutableArray *_allArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        [self _createView];

    }
    return self;
}


- (void)_createView
{
    imageNames = @[@"1.png",@"2.png",@"3.png"];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    //设置边界不能反弹
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    
    
    //设置内容视图
    scrollView.contentSize = CGSizeMake(kScreenWidth * (imageNames.count ), kScreenHeight);
    
    //创建imgView添加到滑动视图上
    for (int i = 0; i < imageNames.count; i ++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        imgView.image = [UIImage imageNamed:imageNames[i]];
        imgView.tag = 100 + i;
        [scrollView addSubview:imgView];
        NSLog(@"tag:%ld",imgView.tag);
    }
    
    [self addSubview:scrollView];
    //最后一页进入应用
    UIImageView *imgView = (UIImageView *)[self viewWithTag:100+2];
    imgView.backgroundColor = [UIColor clearColor];
    imgView.userInteractionEnabled = YES;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 130.5 * KWidth_Scale , self.bottom - 165 *KWidth_Scale, 265 * KWidth_Scale , 57.5 * KWidth_Scale)];
    
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(removeOpenView:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:btn];
    
    
}
- (void)removeOpenView:(UIButton *)btn
{
    
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.1];
    
//    [Harpy checkVersion]; //自动检测新版本
    
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageIndex = scrollView.contentOffset.x / kScreenWidth;
    for (int i = 0; i < _allArr.count; i++) {
        UIImageView *imageV = _allArr[i];
        if (i == pageIndex) {
            [imageV setImage:[UIImage imageNamed:@"按钮-轮播-本页@2x.png"]];
        }else{
            [imageV setImage:[UIImage imageNamed:@"按钮-轮播-其他@2x.png"]];
        }
        
    }
    
}

@end

//
//  FirstOpenView.m
//  WXMovie47
//
//  Created by keyzhang on 15/8/28.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "FirstOpenView.h"

@implementation FirstOpenView

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
    //并无此数组
    NSArray *imageNames = @[@"guide1.png",@"guide2.png",@"guide3.png",@"guide4.png",@"guide5.png"];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    //设置边界不能反弹
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    
    //设置内容视图
    scrollView.contentSize = CGSizeMake(kScreenWidth * (imageNames.count + 1), kScreenHeight);
    
    //创建imgView添加到滑动视图上
    for (int i = 0; i < imageNames.count; i ++) {
        //创建图片视图
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        imgView.image = [UIImage imageNamed:imageNames[i]];
        
        [scrollView addSubview:imgView];
    }
    
    [self addSubview:scrollView];
    
    //添加索引图片
    NSArray *pageImageName = @[@"guideProgress1",@"guideProgress2",@"guideProgress3",@"guideProgress4",@"guideProgress5"];
    
    UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - 86.5) / 2, kScreenHeight - 13 - 30, 86.5, 13)];
    pageImageView.tag = 2015;
    pageImageView.image = [UIImage imageNamed:pageImageName[0]];
    [self addSubview:pageImageView];
    
}


#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageIndex = scrollView.contentOffset.x / kScreenWidth;
    UIImageView *pageImageView = (UIImageView *)[self viewWithTag:2015];
    NSArray *pageImageName = @[@"guideProgress1",@"guideProgress2",@"guideProgress3",@"guideProgress4",@"guideProgress5"];
    
    if (pageIndex < pageImageName.count) {
        pageImageView.image = [UIImage imageNamed:pageImageName[pageIndex]];
    }else {
        
        //0.5秒之后移除当前启动界面
        [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5];
        
    }
    
    if (scrollView.contentOffset.x > scrollView.contentSize.width - 2 * kScreenWidth) {
        CGFloat xOffset = scrollView.contentOffset.x - scrollView.contentSize.width + 2 * kScreenWidth;
        NSLog(@"xOffset is %.2f", xOffset);
        
        pageImageView.left = (kScreenWidth - 86.5) / 2 -  xOffset;
    }
    
    
    
}











@end

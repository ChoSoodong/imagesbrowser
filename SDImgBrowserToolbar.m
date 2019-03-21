//
//  SDImgBrowserToolbar.m
//  KoreanPetApp
//
//  Created by xialan on 2018/12/29.
//  Copyright © 2018 HARAM. All rights reserved.
//
//自定义toolbar
#import "SDImgBrowserToolbar.h"

@interface SDImgBrowserToolbar()<YBImageBrowserToolBarProtocol>

/** 分页指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation SDImgBrowserToolbar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _pageControl = [[UIPageControl alloc] initWithFrame:self.bounds];
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
    }
    return self;
}
#pragma mark - 图片浏览器 必须实现的代理方法
- (void)yb_browserUpdateLayoutWithDirection:(YBImageBrowserLayoutDirection)layoutDirection containerSize:(CGSize)containerSize{
    
}
#pragma mark - 图片浏览器切换图片调用
- (void)yb_browserPageIndexChanged:(NSUInteger)pageIndex totalPage:(NSUInteger)totalPage data:(id<YBImageBrowserCellDataProtocol>)data{
    
    if (totalPage <= 1) {
        _pageControl.hidden = YES;
    }else{
        
        _pageControl.numberOfPages = totalPage;
        _pageControl.currentPage = pageIndex;
        
     
       
    }
    
   
    
    
}

@end

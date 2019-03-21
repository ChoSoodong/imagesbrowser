//
//  SDImageBrowserManager.h
//  KoreanPetApp
//
//  Created by xialan on 2018/12/29.
//  Copyright © 2018 HARAM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDImageBrowserManager : NSObject



/**
 显示图片浏览器

 @param dataSource 数据源 里面可以放网络视频url 本地视频 网络图片url 本地图片
 @param sourceImgV 源imageView
 @param currentIndex 当前索引
 */
+(void)showBrowserWithDataSourceArray:(NSArray *)dataSource sourceImgView:(nullable UIImageView *)sourceImgV currentIndex:(NSInteger)currentIndex;


@end

NS_ASSUME_NONNULL_END

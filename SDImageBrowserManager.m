//
//  SDImageBrowserManager.m
//  KoreanPetApp
//
//  Created by xialan on 2018/12/29.
//  Copyright © 2018 HARAM. All rights reserved.
//

#import "SDImageBrowserManager.h"
#import "SDImgBrowserToolbar.h"

@implementation SDImageBrowserManager

+(void)showBrowserWithDataSourceArray:(NSArray *)dataSource sourceImgView:(nullable UIImageView *)sourceImgV currentIndex:(NSInteger)currentIndex{
    
    
    NSMutableArray *browserDataArr = [NSMutableArray array];
    [dataSource enumerateObjectsUsingBlock:^(NSString *_Nonnull imageStr, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        // 此处只是为了判断测试用例的数据源是否为视频，并不是仅支持 MP4。/ This is just to determine whether the data source of the test case is video, not just MP4.
        if ([imageStr hasSuffix:@".MP4"]) {
            if ([imageStr hasPrefix:@"http"]) {
                
                // Type 1 : 网络视频 / Network video
                YBVideoBrowseCellData *data = [YBVideoBrowseCellData new];
                data.url = [NSURL URLWithString:imageStr];
                if (sourceImgV != nil) {
                    data.sourceObject = sourceImgV;
                }
                [browserDataArr addObject:data];
                
            } else {
                
                // Type 2 : 本地视频 / Local video
                NSString *path = [[NSBundle mainBundle] pathForResource:imageStr.stringByDeletingPathExtension ofType:imageStr.pathExtension];
                NSURL *url = [NSURL fileURLWithPath:path];
                YBVideoBrowseCellData *data = [YBVideoBrowseCellData new];
                data.url = url;
                if (sourceImgV != nil) {
                    data.sourceObject = sourceImgV;
                }
                [browserDataArr addObject:data];
                
            }
        } else if ([imageStr hasPrefix:@"http"]) {
            
            // Type 3 : 网络图片 / Network image
            YBImageBrowseCellData *data = [YBImageBrowseCellData new];
            data.url = [NSURL URLWithString:imageStr];
            if (sourceImgV != nil) {
                data.sourceObject = sourceImgV;
            }
            [browserDataArr addObject:data];
            
        } else {
            
            // Type 4 : 本地图片 / Local image (配置本地图片推荐使用 YBImage)
            YBImageBrowseCellData *data = [YBImageBrowseCellData new];
            data.imageBlock = ^__kindof UIImage * _Nullable{
                return [YBImage imageNamed:imageStr];
            };
            if (sourceImgV != nil) {
                data.sourceObject = sourceImgV;
            }
            [browserDataArr addObject:data];
            
        }
    }];
    
    
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = browserDataArr;
    browser.currentIndex = currentIndex;
    browser.autoHideSourceObject = NO;
    SDImgBrowserToolbar *tool = [[SDImgBrowserToolbar alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-TABBAR_HEIGHT, SCREEN_WIDTH, TABBAR_HEIGHT)];
    browser.toolBars = @[tool];
    
    if (sourceImgV == nil) {
        browser.enterTransitionType = YBImageBrowserTransitionTypeFade;
        browser.outTransitionType = YBImageBrowserTransitionTypeFade;
    }else{
        browser.enterTransitionType = YBImageBrowserTransitionTypeCoherent;
        browser.outTransitionType = YBImageBrowserTransitionTypeCoherent;
    }
    [browser show];
    
    
    
}


@end

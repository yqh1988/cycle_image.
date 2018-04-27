//
//  LoopViewConfig.m
//  ImageCycle-OC
//  无限轮播图视图配置
//
//  Created by yangqianhua on 2018/4/27.
//  Copyright © 2018年 yangqianhua. All rights reserved.
//

#import "LoopViewConfig.h"

@implementation LoopViewConfig

-(NSTimeInterval)scrollinterval{
    if(_scrollinterval <= 0){
        return 5;
    }
    return _scrollinterval;
}

-(UIColor*)pageIndicatorTintColor{
    if(_pageIndicatorTintColor == nil){
        return [UIColor whiteColor];
    }
    return _pageIndicatorTintColor;
}

-(UIColor*)currentPageIndicatorTintColor{
    if(_currentPageIndicatorTintColor == nil){
        return [UIColor redColor];
    }
    return _currentPageIndicatorTintColor;
}

-(UIViewContentMode)imageContentMode{
    return _imageContentMode;
}
@end

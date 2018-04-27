//
//  LoopViewConfig.h
//  ImageCycle-OC
//  无限轮播图视图配置
//
//  Created by yangqianhua on 2018/4/27.
//  Copyright © 2018年 yangqianhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoopViewConfig : NSObject

//滚动的间隔
@property (assign,nonatomic) NSTimeInterval scrollinterval;

//分页控件正常颜色
@property (strong,nonatomic) UIColor* pageIndicatorTintColor;

//分页控件正当前页的颜色
@property (strong,nonatomic) UIColor* currentPageIndicatorTintColor;

//图片模式
@property(nonatomic)  UIViewContentMode imageContentMode;

@end

//
//  LoopView.h
//  ImageCycle-OC
//  无限轮播图视图
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoopViewLayout.h"
#import "LoopViewCell.h"
#import "WeakTImerObject.h"
#import "LoopViewConfig.h"

@interface LoopView : UIView

-(instancetype)initWithUrls:(NSArray*)urlstrs loopViewConfig:(LoopViewConfig*)loopViewConfig;

@end

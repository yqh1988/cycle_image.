//
//  LoopViewCell.h
//  ImageCycle-OC
//  无限轮播图视图CELL
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface LoopViewCell : UICollectionViewCell

///展示的图片控件
@property (nonatomic,weak) UIImageView* imageView;

@property (nonatomic,copy) NSString* urlStr;

@end

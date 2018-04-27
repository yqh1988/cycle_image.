//
//  LoopViewCell.m
//  ImageCycle-OC
//  无限轮播图视图CELL
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import "LoopViewCell.h"

@interface LoopViewCell ()

@end

@implementation LoopViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        UIImageView* imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
        //self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

-(void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
}
@end

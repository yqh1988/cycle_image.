//
//  LoopViewLayout.m
//  ImageCycle-OC
//  无限轮播图视图布局
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import "LoopViewLayout.h"

@implementation LoopViewLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.frame.size;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    
    self.minimumLineSpacing= 0;
    
    self.minimumInteritemSpacing = 0;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
}
@end

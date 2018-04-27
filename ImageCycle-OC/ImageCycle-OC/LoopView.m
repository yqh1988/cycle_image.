//
//  LoopView.m
//  ImageCycle-OC
//  无限轮播图视图
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import "LoopView.h"

@interface LoopView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak,nonatomic) UICollectionView* collectionView;

@property (strong,nonatomic) NSArray* URLStrs;

@property (weak,nonatomic) NSTimer* timer;

@property (weak,nonatomic) UIPageControl* pageControl;

@property (strong,nonatomic) LoopViewConfig* loopViewConfig;

@end

@implementation LoopView

-(instancetype)initWithUrls:(NSArray*)urlstrs loopViewConfig:(LoopViewConfig*)loopViewConfig{
    if (self = [super init]){
        self.loopViewConfig = loopViewConfig;
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[LoopViewLayout alloc] init] ];
        
        [collectionView registerClass:[LoopViewCell class] forCellWithReuseIdentifier:@"cell"];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        [self addSubview:collectionView];
        self.collectionView = collectionView;
        
        UIPageControl* pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = urlstrs.count ;
        pageControl.currentPage = 0;
        pageControl.pageIndicatorTintColor = self.loopViewConfig.pageIndicatorTintColor;
        pageControl.currentPageIndicatorTintColor = self.loopViewConfig.currentPageIndicatorTintColor;
        
        pageControl.userInteractionEnabled = NO;
        
        [self addSubview: pageControl];
        self.pageControl = pageControl;
        
        self.URLStrs = urlstrs;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程空闲时执行
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:[self.URLStrs count]*10000 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            
            [self addTimer];
        });
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    dispatch_main_sync_safe((^{
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                               
                               [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                               ]];
        
        [self.pageControl addConstraint:[NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20]];

    }))
}

-(void)addTimer{
    if(self.timer){
        return;
    }
    
    self.timer = [WeakTImerObject scheduledTimerWithTimeInterval:self.loopViewConfig.scrollinterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
   [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextImage{
    CGFloat offsetx = self.collectionView.contentOffset.x;
    NSInteger page = offsetx / self.collectionView.bounds.size.width;
    [self.pageControl setCurrentPage:(page+1) % self.URLStrs.count];
    [self.collectionView setContentOffset:CGPointMake((page+1)*self.collectionView.bounds.size.width , 0) animated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.URLStrs count]*30000;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LoopViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.clipsToBounds = YES;
    
    cell.urlStr = self.URLStrs[indexPath.item % self.URLStrs.count];
    cell.imageView.contentMode = self.loopViewConfig.imageContentMode;
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat offx= scrollView.contentOffset.x;
    
    NSInteger page = offx / self.collectionView.bounds.size.width;
    
    if (page == 0) {
        page = [self.URLStrs count];
        
        self.collectionView.contentOffset = CGPointMake(page* self.collectionView.frame.size.width, 0);
    }
    
    if (page == [self.collectionView numberOfItemsInSection:0] -1) {
        page = [self.URLStrs count]-1;
       
        self.collectionView.contentOffset = CGPointMake(page* self.collectionView.frame.size.width, 0);
    }
    
    [self.pageControl setCurrentPage:page% self.URLStrs.count];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offx= scrollView.contentOffset.x;
    
    NSInteger page = offx / self.collectionView.bounds.size.width;
    
    if (page == 0) {
        page = [self.URLStrs count];
        
        self.collectionView.contentOffset = CGPointMake(page* self.collectionView.frame.size.width, 0);
    }
    
    if (page == [self.collectionView numberOfItemsInSection:0] -1) {
        page = [self.URLStrs count]-1;
    
        self.collectionView.contentOffset = CGPointMake(page* self.collectionView.frame.size.width, 0);
    }
    
     [self.pageControl setCurrentPage:page % self.URLStrs.count];
    [self addTimer];
}

-(void)dealloc{
    NSLog(@"轮播图释放");
}
@end

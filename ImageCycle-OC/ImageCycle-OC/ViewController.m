//
//  ViewController.m
//  ImageCycle-OC
//
//  Created by yangqianhua on 2017/6/22.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//http://c.m.163.com/nc/ad/headline/0-3.html

#import "ViewController.h"
#import "LoopViewConfig.h"

@interface ViewController ()

@property (weak,nonatomic) LoopView * v;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    NSArray* urls = @[@"http://g.hiphotos.baidu.com/image/pic/item/8b82b9014a90f603d535fa103512b31bb151ede4.jpg",@"http://f.hiphotos.baidu.com/image/pic/item/f31fbe096b63f6248e085a548b44ebf81a4ca314.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/f636afc379310a551c65d4a3bb4543a982261027.jpg"];
    
    LoopViewConfig* config = [[LoopViewConfig alloc] init];
    config.pageIndicatorTintColor = [UIColor yellowColor];
    config.currentPageIndicatorTintColor = [UIColor blueColor];
    config.scrollinterval = 1;
    config.imageContentMode = UIViewContentModeScaleToFill;
    
    LoopView* loopView = [[LoopView alloc] initWithUrls:urls loopViewConfig:config];

    
    loopView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 250);
    
    self.v = loopView;
    
    [self.view addSubview:loopView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self.v removeFromSuperview];
}
@end

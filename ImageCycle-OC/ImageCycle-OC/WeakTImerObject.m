//
//  WeakTImerObject.m
//  ImageCycle-OC
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import "WeakTImerObject.h"

@interface WeakTImerObject ()

@property(weak,nonatomic) id target;
@property (nonatomic,assign) SEL sel;

@end

@implementation WeakTImerObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    WeakTImerObject* obj = [WeakTImerObject new];
    obj.target =aTarget;
    obj.sel = aSelector;
    
    return [NSTimer scheduledTimerWithTimeInterval:ti target:obj selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
}

-(void)fire:(id)obj{
    [self.target performSelector:self.sel withObject:obj];
}
@end

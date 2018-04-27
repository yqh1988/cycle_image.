//
//  WeakTImerObject.h
//  ImageCycle-OC
//
//  Created by yangqianhua on 2017/6/24.
//  Copyright © 2017年 yangqianhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakTImerObject : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;


@end

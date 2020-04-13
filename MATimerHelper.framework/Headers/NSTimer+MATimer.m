//
//   NSTimer+MATimer.m
//   MA
//
//   Created  by MA on 2020/4/11
//   Modified by MA on 2020/4/11 Note:xxx
//
//   Copyright © 2020 MA. All rights reserved.
//
    

#import "NSTimer+MATimer.h"


/*
 【说明】
 self是当前类对象，在内存中以单例的形式只存在一份，我们在每一次创建实例变量都要通过这个类对象来创建。
 因此不需要担心当前的target造成循环引用，因为单例不需要被释放，只有当APP被kill的时候，内存中的单例才会被释放掉。
 */

@implementation NSTimer (MATimer)

+ (NSTimer *) ma_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void (^)(void))block {
    
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(ma_blockHandler:) userInfo:block repeats:yesOrNo];
}

+ (NSTimer *) ma_timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(void))block{
    
    return [self timerWithTimeInterval:ti target:self selector:@selector(ma_blockHandler:) userInfo:block repeats:yesOrNo];
}

+ (void) ma_blockHandler:(NSTimer *)timer {
   
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end

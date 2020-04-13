//
//   NSTimer+MATimer.h
//   MA
//
//   Created  by MA on 2020/4/11
//   Modified by MA on 2020/4/11 Note:xxx
//
//   Copyright © 2020 MA. All rights reserved.
//
    

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (MATimer)


/// <#Description#>
/// @param ti <#ti description#>
/// @param yesOrNo <#yesOrNo description#>
/// @param block block中关于self的使用，必须s弱引用
+ (NSTimer *) ma_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void (^)(void))block;


/// <#Description#>
/// @param ti <#ti description#>
/// @param yesOrNo <#yesOrNo description#>
/// @param block block中关于self的使用，必须s弱引用
+ (NSTimer *) ma_timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END

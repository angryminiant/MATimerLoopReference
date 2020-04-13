//
//   MATimerProxy.h
//   MA
//
//   Created  by MA on 2020/4/10
//   Modified by MA on 2020/4/10 Note:xxx
//
//   Copyright © 2020 MA. All rights reserved.
//
    

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 在查找timerMethod方法时，发现自己没有该方法，它就直接进行消息转发，所以少了去父类查找的这一步骤，耗时会更少，效率会更好
@interface MAProxy : NSProxy

+(instancetype)proxyWithTarget:(id)target;

@end


/// 在查找timerMethod方法时，首先会从自己去找，没找到再去父类中查找，最终也没有timerMethod方法时候才会进行消息转发
@interface MACustomProxy : NSObject

+(instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

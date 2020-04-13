//
//   MATimerProxy.m
//   MA
//
//   Created  by MA on 2020/4/10
//   Modified by MA on 2020/4/10 Note:xxx
//
//   Copyright © 2020 MA. All rights reserved.
//
    

#import "MAProxy.h"

@interface MAProxy()
@property (weak, nonatomic) id target;
@end
 
@implementation MAProxy
 
+(instancetype)proxyWithTarget:(id)target {
    
    MAProxy *proxy = [MAProxy alloc];
    proxy.target = target;
    return proxy;
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [self.target methodSignatureForSelector:sel];
}
 
-(void)forwardInvocation:(NSInvocation *)invocation {
    
    [invocation invokeWithTarget:self.target];
}

@end


@interface MACustomProxy()
@property (weak, nonatomic) id target;
@end
 
@implementation MACustomProxy
 
+(instancetype)proxyWithTarget:(id)target {
    
    MACustomProxy *proxy = [[MACustomProxy alloc] init];
    proxy.target = target;
    return proxy;
}
 
// 消息转发，将消息转发给控制器
-(id)forwardingTargetForSelector:(SEL)aSelector {
    
    return self.target;
}

@end

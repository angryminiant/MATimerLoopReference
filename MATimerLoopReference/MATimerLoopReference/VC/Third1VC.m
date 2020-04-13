//
//  Third1VC.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "Third1VC.h"
#import <MATimerHelper/MATimerHelper.h>

@interface Third1VC ()


@property (strong, nonatomic) NSTimer *timer;
@end

@implementation Third1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Third1VC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    MAProxy *proxy = [MAProxy proxyWithTarget:self];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:proxy selector:@selector(timeHandelr:) userInfo:nil repeats:YES];
    
    
    #pragma mark --- 这种方式比较冗余，所以开发中使用较少(个人经验)
//    SEL action = @selector(timeHandelr:);
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:action]];
////    [invocation setTarget:self];// 循环引用，不会dealloc，其他逻辑处理
//    [invocation setTarget:proxy];
//    [invocation setSelector:action];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 invocation:invocation repeats:YES];
    
    #pragma mark --- 参数参考上述参数
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeHandelr:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}


- (void) dealloc {
    
    NSLog(@"Third1VC - dealloc");
    [self.timer invalidate];// block
}

//- (void)didMoveToParentViewController:(UIViewController *)parent {
//
//    if ( !parent ) {
//
//        [self.timer invalidate];
//        NSLog(@"Third1VC - timer - noneParent - invalidate");
//    }
//}
//
//
- (void) timeHandelr:(NSTimer *) timer {

    NSLog(@"Third1VC - timer - handelr - selector");

//    if ( !self || !self.navigationController ) {
//
//        [self.timer invalidate];
//        NSLog(@"Third1VC - timer - handelr - invalidate");
//    }

}

@end


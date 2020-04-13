//
//  Second1VC.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "Second1VC.h"
#import <MATimerHelper/MATimerHelper.h>

@interface Second1VC ()

@property (strong, nonatomic) NSTimer *timer;
@end

@implementation Second1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second1VC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer ma_scheduledTimerWithTimeInterval:0.1 repeats:YES block:^{

        // __strong typeof(weakSelf) strongSelf = weakSelf;// 有可能可以，但强烈建议使用弱引用
        [weakSelf timeHandelr:nil];
    }];
    
    
//    self.timer = [NSTimer ma_timerWithTimeInterval:0.1 repeats:YES block:^{
//        [weakSelf timeHandelr:nil];
//    }];
//    [self runLoop];
}

- (void) runLoop {

    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];// 计时器不受干扰，不会暂停
}


- (void) dealloc {
    
    NSLog(@"Second1VC - dealloc");
    [self.timer invalidate];// block
}

//- (void)didMoveToParentViewController:(UIViewController *)parent {
//
//    if ( !parent ) {
//
//        [self.timer invalidate];
//        NSLog(@"Second1VC - timer - noneParent - invalidate");
//    }
//}
//
//
- (void) timeHandelr:(NSTimer *) timer {

    NSLog(@"Second1VC - timer - handelr - selector");

//    if ( !self || !self.navigationController ) {
//
//        [self.timer invalidate];
//        NSLog(@"Second1VC - timer - handelr - invalidate");
//    }

}

@end


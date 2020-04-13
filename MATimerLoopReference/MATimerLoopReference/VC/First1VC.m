//
//  First1VC.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "First1VC.h"

@interface First1VC ()
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) NSString *tempProperty;
@end

@implementation First1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First1VC";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tempProperty = @"属性";
    // Do any additional setup after loading the view.
    
    // 1-1
//    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timeHandelr:) userInfo:nil repeats:YES];
//
//    // 1-2
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeHandelr:) userInfo:nil repeats:YES];
    
    
    if (@available(iOS 10, *)) {
        
        // timer-block类型，
        // 1-没有使用self时不会造成循环引用，控制器self会调用dealloc释放；
        // 2-使用了self时，包含属性，方法，会造成循环引用，控制器self不会调用dealloc释放；
        // 3-使用了self时，包含属性，方法，利用weakSelf，或strongSelf过渡，不会造成循环引用，控制器self会调用dealloc释放；
        // 上述1和3，虽然都会调用dealloc，但是runloop中计时器一直生效，一直循环调用Block，浪费性能；
        
        __weak typeof(self) weakSelf = self;
        void(^block)(void) = ^(void) {
            // 直接放在timer的block中也可以
            NSLog(@"First1VC - timer - block");
            __strong typeof(weakSelf) strongSelf = weakSelf;
//            [weakSelf timeHandelr:nil];// 正确
//            [strongSelf timeHandelr:nil];// 正确
//            [self timeHandelr:nil];// 错误
//            NSLog(@"%@",strongSelf.tempProperty);
        };
            
        // 2-1
        self.timer = [NSTimer timerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            block();
            int a = 10;
            int b = 100;
            a += b;
        }];
                
        // 2-2
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            block();
//        }];
        
    } else {
        
    }
    
    
    [self runLoop];
    
}

- (void) runLoop {

    // [NSTimer timerWithTimeInterval...] 必须添加到runloop中，计时器才能生效
    // [NSTimer scheduledTimerWith...] 默认添加到NSDefaultRunLoopMode，计时器自动生效
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];// 计时器受干扰，会自主暂停
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];// 计时器不受干扰，不会暂停
        
}


- (void) dealloc {
    
    NSLog(@"First1VC - dealloc");
    [self.timer invalidate];// block
}

- (void)didMoveToParentViewController:(UIViewController *)parent {

    if ( !parent ) {

        // 1-1,1-2 selector 因为不会调用dealloc 必须invalidate,或者在timeHandelr:根据!self || !self.navigationController来invalidate
        // 2-1,2-2 block 因为会调用dealloc，所以此处为可选invalidate，若此处不invalidate，那么必须在dealloc中invalidate，
//        [self.timer invalidate];
//        NSLog(@"First1VC - timer - noneParent - invalidate");
    }
}


- (void) timeHandelr:(NSTimer *) timer {
    
    NSLog(@"First1VC - timer - handelr - selector");
    
//    if ( !self || !self.navigationController ) {
//
//        [self.timer invalidate];
//        NSLog(@"First1VC - timer - handelr - invalidate");
//    }
    
}

@end

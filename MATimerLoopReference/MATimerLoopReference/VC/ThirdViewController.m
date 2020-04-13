//
//  ThirdViewController.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "ThirdViewController.h"
#import "Third1VC.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ThirdVC";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
        
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(30, 200, 250, 60);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"中间者Proxy消息转发方式" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) btnClick {
    
    [self.navigationController pushViewController:[Third1VC new] animated:YES];
}


@end

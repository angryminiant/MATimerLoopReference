//
//  FirstViewController.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "FirstViewController.h"
#import "First1VC.h"

@interface FirstViewController ()


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FirstVC";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(30, 200, 250, 60);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"原有常规和block方式" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) btnClick {
    
    [self.navigationController pushViewController:[First1VC new] animated:YES];
}


@end

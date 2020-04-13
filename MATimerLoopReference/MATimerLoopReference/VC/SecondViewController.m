//
//  SecondViewController.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "SecondViewController.h"
#import "Second1VC.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SecondVC";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
        
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(30, 200, 250, 60);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"NSTimer类对象自身循环引用方式" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) btnClick {
    
    [self.navigationController pushViewController:[Second1VC new] animated:YES];
}


@end

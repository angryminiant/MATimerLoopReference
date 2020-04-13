//
//  AppDelegate.m
//  MATimerLoopReference
//
//  Created by hugengya on 2020/4/11.
//  Copyright © 2020 com.hefeichenye. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [UIWindow new];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navVC1 = [[UINavigationController alloc] initWithRootViewController:[FirstViewController new]];    
    UINavigationController *navVC2 = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    UINavigationController *navVC3 = [[UINavigationController alloc] initWithRootViewController:[ThirdViewController new]];
    navVC1.title = @"navVC1";
    navVC2.title = @"navVC2";
    navVC3.title = @"navVC3";
    UITabBarController *tabbarVC = [UITabBarController new];
    [tabbarVC setViewControllers:@[navVC1, navVC2, navVC3]];
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

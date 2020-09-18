//
//  AppDelegate.m
//  homework_1_ocBasics
//
//  Created by LuJiayuan666 on 2020/7/15.
//  Copyright © 2020 LuJiayuan666. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    ViewController *vc = [[ViewController alloc] init];
    [self.window setBackgroundColor:UIColor.whiteColor];
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}



@end

//
//  AppDelegate.m
//  test
//
//  Created by Bytedance on 2020/5/20.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];

    RootViewController *controller = [[RootViewController alloc] init];

    [self.window setRootViewController:controller];

    [self.window makeKeyAndVisible];

    
    return YES;
}


@end

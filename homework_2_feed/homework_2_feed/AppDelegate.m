//
//  AppDelegate.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    MyTabBarController* tabBarController = [[MyTabBarController alloc] init];
    self.window.rootViewController = tabBarController;

    return YES;
}



@end

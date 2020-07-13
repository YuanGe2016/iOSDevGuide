//
//  AppDelegate.m
//  ModalView
//
//  Created by Bytedance on 2020/6/27.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *viewcontroller = [[ViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewcontroller];
    
    self.window.rootViewController = naviController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end

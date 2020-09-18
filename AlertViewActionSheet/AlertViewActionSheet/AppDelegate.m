//
//  AppDelegate.m
//  AlertViewActionSheet
//
//  Created by Bytedance on 2020/5/20.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ComplexViewController.h"
#import "AnimationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *simpleVC = [[ViewController alloc] init];
    ComplexViewController *complexVC = [[ComplexViewController alloc] init];
    AnimationViewController *animationVC = [[AnimationViewController alloc] init];
    
    self.window.rootViewController = animationVC;
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end

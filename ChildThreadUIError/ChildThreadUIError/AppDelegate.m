//
//  AppDelegate.m
//  ChildThreadUIError
//
//  Created by Bytedance on 2020/6/29.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AppDelegate.h"
#import "AnimationViewController.h"
#import "fishhook.h"


//static void (*orig_NSLog)(NSString *format, ...);
//void(new_NSLog)(NSString *format, ...) {
//    va_list args;
//    if(format) {
//        va_start(args, format);
//        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
//        orig_NSLog(@"HookNSLog : %@", message);
//        va_end(args);
//    }
//}

static ssize_t (*orig_writev)(int a, const struct iovec * v, int v_len);
ssize_t new_writev(int a, const struct iovec *v, int v_len) {

    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < v_len; i++) {
        char *c = (char *)v[i].iov_base;
        [string appendString:[NSString stringWithCString:c encoding:NSUTF8StringEncoding]];
    }
    
    static NSInteger times = 0;
    times++;
    NSString *path_head = @"/Users/bytedance/PracticeCode/ChildThreadUIError/";
    NSString *path_tail = @"console.plist";
    NSString *path_1 = [NSString stringWithFormat:@"%@%ld%@",path_head,times,path_tail];
    
    if([string containsString:@"Main Thread Checker:"]) {
        NSString *path = @"/Users/bytedance/PracticeCode/ChildThreadUIError/log.plist";
        [string writeToFile:path atomically:YES];
    }
    

    

    [string writeToFile:path_1 atomically:YES];
    ssize_t result = orig_writev(a, v, v_len);
    
    
    
    
    //ssize_t result = v_len;
    return result;
}

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //rebind_symbols((struct rebinding[1]){{"NSLog", new_NSLog, (void *)&orig_NSLog}}, 1);
    rebind_symbols((struct rebinding[1]){{"writev", new_writev, (void *)&orig_writev}}, 1);
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    AnimationViewController *animationVC = [[AnimationViewController alloc] init];
    
    self.window.rootViewController = animationVC;
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end

//
//  ViewController.m
//  TestNSUDTime
//
//  Created by Bytedance on 2020/8/19.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#include <objc/runtime.h>

static double totalTime = 0.0;
static double totalTimeWithOutTrans = 0.0;
BOOL ISHOOK = YES;
@interface LJYUserDefaults : NSObject

@end

@implementation LJYUserDefaults

- (void)hook_setObject:(id)obj forKey:(NSString *)keyName
{
    //NSLog(@"set: %@, %@",keyName, obj);
    double starttime = CACurrentMediaTime();
    [self hook_setObject:obj forKey:keyName];
    double endtime = CACurrentMediaTime();
    totalTimeWithOutTrans += (endtime - starttime) * 1000000;
}

- (id)hook_objectForKey:(NSString *)keyName
{
    double starttime = CACurrentMediaTime();
    id obj;
    obj = [self hook_objectForKey:keyName];
    //NSLog(@"get: %@, %@",keyName, obj);
    double endtime = CACurrentMediaTime();
    totalTimeWithOutTrans += (endtime - starttime) * 1000000;
    return obj;
}

+(void)load
{
    for(int i = 0; i < 10; i++)
   {
       printf("%d\n", i);
   }
    //结束前加barrier
}


@end

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self testHookNSUD];
    
}



- (void)testHookNSUD
{
    if(ISHOOK) {
           Method oriM = class_getInstanceMethod([NSUserDefaults class], @selector(objectForKey:));
           Method swiM = class_getInstanceMethod([LJYUserDefaults class], @selector(hook_objectForKey:));
           if(class_addMethod([NSUserDefaults class], @selector(hook_objectForKey:), method_getImplementation(swiM), method_getTypeEncoding(swiM)))
           {
               swiM = class_getInstanceMethod([NSUserDefaults class], @selector(hook_objectForKey:));
               method_exchangeImplementations(oriM, swiM);
           }
           
           Method oriM2 = class_getInstanceMethod([NSUserDefaults class], @selector(setObject:forKey:));
           Method swiM2 = class_getInstanceMethod([LJYUserDefaults class], @selector(hook_setObject:forKey:));
           if(class_addMethod([NSUserDefaults class], @selector(hook_setObject:forKey:), method_getImplementation(swiM2), method_getTypeEncoding(swiM2)))
           {
               swiM2 = class_getInstanceMethod([NSUserDefaults class], @selector(hook_setObject:forKey:));
               method_exchangeImplementations(oriM2, swiM2);
           }
       }
    
    
    double a1 = 6.66;
    NSInteger b1 = 6;
    BOOL c1 = YES;
    NSURL *d1 = [NSURL URLWithString:@"www.bytedance.com"];
    NSArray *e1 = @[@1,@2,@3];
    NSDictionary *f1 = @{@"a":@0, @"b":@2, @"c":@3};
    NSString *g1 = @"Iloveyou";
    
    double stime = CACurrentMediaTime();
    [[NSUserDefaults standardUserDefaults] setDouble:a1 forKey:@"a1"];
    [[NSUserDefaults standardUserDefaults] setInteger:b1 forKey:@"b1"];
    [[NSUserDefaults standardUserDefaults] setBool:c1 forKey:@"c1"];
    [[NSUserDefaults standardUserDefaults] setURL:d1 forKey:@"d1"];
    [[NSUserDefaults standardUserDefaults] setObject:e1 forKey:@"e1"];
    [[NSUserDefaults standardUserDefaults] setObject:f1 forKey:@"f1"];
    [[NSUserDefaults standardUserDefaults] setObject:g1 forKey:@"g1"];
    
    double a2 = [[NSUserDefaults standardUserDefaults] doubleForKey:@"a1"];
    //NSInteger b2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"b1"];
    //BOOL c2 = [[NSUserDefaults standardUserDefaults] boolForKey:@"c1"];
    NSURL *d2 = [[NSUserDefaults standardUserDefaults] URLForKey:@"d1"];
    NSArray *e2 = [[NSUserDefaults standardUserDefaults] arrayForKey:@"e1"];
    NSDictionary *f2 = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"f1"];
    NSString *g2 = [[NSUserDefaults standardUserDefaults] stringForKey:@"g1"];
    double etime = CACurrentMediaTime();
    totalTime = (etime - stime) * 1000000;
    NSLog(@"total time is %f us", totalTime);
    NSLog(@"total time without transfer is %f us", totalTimeWithOutTrans);
}

@end

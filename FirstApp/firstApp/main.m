//
//  main.m
//  firstApp
//
//  Created by Bytedance on 2020/5/7.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "Thingie.h"
#include <stdio.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        // Test1 ///////////////////////////
        const char *string = "Hi there is a C string!";
        NSData *data = [NSData dataWithBytes:string length:strlen(string)+1];
        NSLog(@"data is %@", data);
        NSLog(@"%ld byte string is '%s'", [data length] ,[data bytes]);
    
        NSArray *phrase ;
        phrase = [NSArray arrayWithObjects: @"I", @"seem", @"to", @"be", @"a", @"verb", nil];
        [phrase writeToFile: @"verbiage.txt" atomically:YES];
        
        NSArray *phrase2;
        phrase2 = [NSArray arrayWithContentsOfFile:@"verbiage.txt"];
        NSLog(@"%@", phrase2);
        printf("\n");
        
        // Test2 ///////////////////////////
        Thingie *thing1;
        thing1 = [[Thingie alloc] initWithName:@"thing1" magicNumber:42 shoeSize:10.5];
        Thingie *anotherThing;
        anotherThing = [[Thingie alloc]
                         initWithName: @"thing2" magicNumber: 23 shoeSize: 13.9] ;
        [thing1.subThingies addObject: anotherThing];
        Thingie *anotherThing2;
        anotherThing2 = [[Thingie alloc]
                         initWithName: @"thing3" magicNumber: 17 shoeSize: 9.0] ;
        [thing1.subThingies addObject: anotherThing2];
        NSLog(@"some thing: %@", thing1);
        NSData *freezeDried;
        freezeDried = [NSKeyedArchiver archivedDataWithRootObject: thing1];
        [freezeDried writeToFile: @"thingie.xml" atomically:YES];
        printf("\n\n");
        Thingie *thing;
        thing = [NSKeyedUnarchiver unarchiveObjectWithData: freezeDried];
        NSLog(@"reconstituted multhing: %@", thing);
        
        // Test3 ///////////////////////////
        NSString *frameworkBundlePath;
        frameworkBundlePath = @"verbiage.txt";
//        NSString *defaultDBPath = [frameworkBundlePath stringByAppendingPathComponent: @"verbiage.txt"];
        
        
        NSString *frameworkBundlePath1;
        frameworkBundlePath1 = @"ljy666.txt";
//        NSString *targetPath = [frameworkBundlePath1 stringByAppendingPathComponent:@"ljy666.txt"];

        NSLog(@"%@  %@", frameworkBundlePath, frameworkBundlePath1);
        NSError *error;
        
        NSFileManager *nsf = [NSFileManager defaultManager];
        
        [nsf copyItemAtPath:frameworkBundlePath toPath:frameworkBundlePath1 error:&error ];
        if(error) {
            NSLog(@"错误写入文件");
        }
        else {
            NSLog(@"写入文件成功");
        }
    }
    return NSApplicationMain(argc, argv);
}

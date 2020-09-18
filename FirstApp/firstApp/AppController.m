//
//  AppController.m
//  firstApp
//
//  Created by Bytedance on 2020/5/11.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id) init
{
    if(self = [super init]) {
        NSLog(@"init: %@ / results %@", textField, resultsField);
    }
    return self;
}

- (void) awakeFromNib
{
    NSLog(@"awake: text %@ /results %@", textField, resultsField);
    [textField setStringValue: @"Enter text here"];
    [resultsField setStringValue: @"Results"];
}

- (IBAction)uppercase: (id)sender
{
    NSString *original;
    original = [textField stringValue];
    [resultsField setStringValue: [original uppercaseString]];
}

- (IBAction)lowercase:(id)sender
{
    NSString *original;
    original = [textField stringValue];
    [resultsField setStringValue: [original lowercaseString]];
}
@end

//
//  AppController.h
//  firstApp
//
//  Created by Bytedance on 2020/5/11.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppController : NSObject
{
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *resultsField;
}

- (IBAction)uppercase :(id)sender;
- (IBAction)lowercase :(id)sender;

@end

NS_ASSUME_NONNULL_END

//
//  ViewController.m
//  Initailzer
//
//  Created by Bytedance on 2020/6/30.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSNumber *num = @28;
    NSArray *array = @[@"LJY",num];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

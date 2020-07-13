//
//  RootViewController.m
//  test
//
//  Created by Bytedance on 2020/5/21.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "RootViewController.h"
#import "TestKVC.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat w = 90;
    CGFloat h = 20;
    CGFloat top = 150;
    CGRect frame = CGRectMake((screen.size.width - w)/2, top, w, h);
    UILabel *l = [[UILabel alloc] initWithFrame:frame];
    l.text = @"Hello world";
    [self.view addSubview:l];
    
    [[TestKVC shareIntance] testModelToDictionary];
    [[TestKVC shareIntance] testDeepMesPass];
    
    
}

@end

//
//  MinepageViewController.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "MinepageViewController.h"

@interface MinepageViewController ()

@end

@implementation MinepageViewController

- (instancetype)init
{
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"new_mine_tabbar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end

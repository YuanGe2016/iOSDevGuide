//
//  XiguaViewController.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "XiguaViewController.h"

@interface XiguaViewController ()

@end

@implementation XiguaViewController

- (instancetype)init
{
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"西瓜视频";
        self.tabBarItem.image = [UIImage imageNamed:@"new_video_tabbar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end

//
//  FilmhallViewController.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "FilmhallViewController.h"

@interface FilmhallViewController ()

@end

@implementation FilmhallViewController

- (instancetype)init
{
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"放映厅";
        self.tabBarItem.image = [UIImage imageNamed:@"new_long_video_tabbar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end

//
//  MyTabBarController.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "XiguaViewController.h"
#import "FilmhallViewController.h"
#import "MinepageViewController.h"

@interface MyTabBarController ()

@property(nonatomic, strong)HomeViewController *hvc;
@property(nonatomic, strong)XiguaViewController *xgvc;
@property(nonatomic, strong)FilmhallViewController *fhvc;
@property(nonatomic, strong)MinepageViewController *mpvc;

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hvc = [[HomeViewController alloc] init];
    self.xgvc = [[XiguaViewController alloc] init];
    self.fhvc = [[FilmhallViewController alloc] init];
    self.mpvc = [[MinepageViewController alloc] init];
    self.viewControllers = @[self.hvc, self.xgvc, self.fhvc, self.mpvc];
}

@end

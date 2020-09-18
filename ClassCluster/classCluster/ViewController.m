//
//  ViewController.m
//  classCluster
//
//  Created by Bytedance on 2020/6/29.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"
#import "LJYPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LJYPerson *person = [LJYPerson personWithType:LJYPersonTypeLeader];
    person.name = @"ShengXuanwei";
    person.age = 28;
    [person introduce];
}


@end

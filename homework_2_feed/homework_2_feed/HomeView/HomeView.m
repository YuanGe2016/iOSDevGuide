//
//  HomeView.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "HomeView.h"
#import "HomeHeaderView.h"
#import "MyCell.h"

#define cellIdentifier  @"CellIdentifier"

#define HEADERVIEW_HEIGHT 30.0
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface HomeView()

@property(nonatomic, strong)HomeHeaderView *headerView;
@property(nonatomic, strong)UITableView *contentView;
@property(nonatomic, weak)NSObject<FeedDelegate> *delegate;

@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame AndDelegate:(NSObject<FeedDelegate> *)delegate
{
    self = [super init];
    if(self) {
        self.delegate = delegate;
        [self createComponents];
    }
    return self;
}

- (void)layoutSubviews 
{
    [super layoutSubviews];
    [self.headerView setFrame:CGRectMake(0, 0, WIDTH, HEADERVIEW_HEIGHT)];
    [self.contentView setFrame:CGRectMake(0, HEADERVIEW_HEIGHT, WIDTH, HEIGHT - HEADERVIEW_HEIGHT)];
}

- (void)createComponents
{
    self.headerView = [[HomeHeaderView alloc] init];
    [self addSubview: self.headerView];
    
    self.contentView = [[UITableView alloc] init];
    self.contentView.delegate = self.delegate;
    self.contentView.dataSource = self.delegate;
    [self.contentView registerClass:[MyCell class]  forCellReuseIdentifier:cellIdentifier]; //设定cell重用
    [self addSubview: self.contentView];
}

@end

//
//  CellStaticisView.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "CellStaticisView.h"
#import "CellModel.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface CellStaticisView()

@property(nonatomic, strong)UIButton *transmitButton;
@property(nonatomic, strong)UIButton *commentButton;
@property(nonatomic, strong)UIButton *approveButton;
@property(nonatomic, assign)BOOL isLike;

@end

@implementation CellStaticisView

- (instancetype)init
{
    if(self = [super init]) {
        [self createComponents];
    }
    return self;
}

- (void)createComponents
{
    self.transmitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.approveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.transmitButton addTarget:self action:@selector(transmitButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.commentButton addTarget:self action:@selector(commentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.approveButton addTarget:self action:@selector(approveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.transmitButton setImage:[UIImage imageNamed:@"u12_v2_repost"] forState:UIControlStateNormal];
    [self.commentButton setImage:[UIImage imageNamed:@"u12_v2_comment"] forState:UIControlStateNormal];
    [self.approveButton setImage:[UIImage imageNamed:@"u12_v2_like"] forState:UIControlStateNormal];
    
    [self addSubview:self.transmitButton];
    [self addSubview:self.commentButton];
    [self addSubview:self.approveButton];
    
    self.isLike = NO;
}

#pragma mark - private function

- (void)layoutSubviews
{
    CGFloat everyWidth = (WIDTH - 32.0) / 3;
    self.transmitButton.frame = CGRectMake(16.0, 0, everyWidth, HEIGHT);
    self.commentButton.frame = CGRectMake(16.0 + everyWidth, 0, everyWidth, HEIGHT);
    self.approveButton.frame = CGRectMake(16.0 + everyWidth * 2, 0, everyWidth, HEIGHT);
}

- (void)transmitButtonClicked:(id)sender
{
    NSLog(@"转发数：%@", self.transmitButton.titleLabel.text);
}

- (void)commentButtonClicked:(id)sender
{
    NSLog(@"评论数：%@", self.commentButton.titleLabel.text);
}

- (void)approveButtonClicked:(id)sender
{
    NSString *num_s = self.approveButton.titleLabel.text;
    NSInteger num_i = [num_s integerValue];
    if(!self.isLike) {
        num_i += 1;
        [self.approveButton setImage:[UIImage imageNamed:@"u12_v2_like_press"]  forState:UIControlStateNormal];
       
    }
    else {
        num_i -= 1;
        [self.approveButton setImage:[UIImage imageNamed:@"u12_v2_like"]  forState:UIControlStateNormal];
    }
    [self.approveButton setTitle:[NSString stringWithFormat:@"%ld",num_i] forState:UIControlStateNormal];
    self.isLike = !self.isLike;
    NSLog(@"称赞数：%ld", num_i);
}

#pragma mark - public 外部调用来更新数据

- (void)refreshMesWithModel:(StatisticsModel *)model
{
    [self.transmitButton setTitle:model.share_count forState:UIControlStateNormal];
    [self.commentButton setTitle:model.comment_count forState:UIControlStateNormal];
    [self.approveButton setTitle:model.like_count forState:UIControlStateNormal];
}

@end

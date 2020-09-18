//
//  CellContentView.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "CellContentView.h"

@interface CellContentView()

@property(nonatomic, strong)UILabel *contentLabel;

@end

@implementation CellContentView

- (instancetype)init
{
    if(self = [super init]) {
        self.contentLabel = [[UILabel alloc] init];
        [self.contentLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:17.0]];
        self.contentLabel.numberOfLines = 0;
        [self addSubview:self.contentLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    CGRect frame = self.frame;
    self.contentLabel.frame = CGRectMake(16.0, 0, frame.size.width - 16.0*2, frame.size.height);
}

- (void)refreshContentWithString:(NSString *)content
{
    self.contentLabel.text = content;
}

@end

//
//  CellUserView.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "CellUserView.h"
#import "CellModel.h"
#import <SDWebImage/SDWebImage.h>
#import <YYImage/YYImage.h>

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface CellUserView()

@property(nonatomic, strong)UIImageView *avatarView;
@property(nonatomic, strong)UILabel *nameLabel;
@property(nonatomic, strong)UILabel *verifiedLabel;

@end

@implementation CellUserView

- (instancetype)init
{
    if(self = [super init]) {
        [self createComponents];
    }
    return self;
}


- (void)createComponents
{
    _avatarView = [[UIImageView alloc] init];
    [self addSubview:_avatarView];
    _avatarView.backgroundColor = [UIColor purpleColor];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    [_nameLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:17.0]];
    
    _verifiedLabel = [[UILabel alloc] init];
    [self addSubview:_verifiedLabel];
    [_verifiedLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:12.0]];
}

- (void)layoutSubviews
{
    CGFloat left = 16.0 + 36.0 + 8.0;
    self.avatarView.frame = CGRectMake(16.0, 0, 36.0, 36.0);
    self.avatarView.layer.cornerRadius = 18.0;
    self.avatarView.layer.masksToBounds = YES;
    self.nameLabel.frame = CGRectMake(left, 0, self.frame.size.width - left, 16.0);
    self.verifiedLabel.frame = CGRectMake(left, 16.0 + 4.0, self.frame.size.width - left, 16.0);
    
}

- (void)refreshMesWithModel:(UserInfoModel *)model
{
    NSURL *url = model.avatar_url; //默认使用的https，需要在info.list中增加App Transport Security Settings，才能用http传图片
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    //这是iOS自带的加载图片的接口，但是不支持webp格式图片
    //[self.avatarView setImage:[UIImage imageNamed:@"v3_new_mine_tabbar"]];
    
    //这个是SDWebImage库的加载方法，但是怎么加载webp格式图片我还整出来，下面这个亲测是加载不了的
    //[self.avatarView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"v3_new_mine_tabbar"]];
    
    //现在用YYImage库就可以吧webp图片加载出来
    YYImage *image = [YYImage imageWithData:data];
    [self.avatarView setImage:image];
    
    self.nameLabel.text = model.name;
    self.verifiedLabel.text = model.verified_content;
}

@end

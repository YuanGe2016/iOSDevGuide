//
//  MyCell.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "MyCell.h"
#import "CellModel.h"
#import "CellUserView.h"
#import "CellContentView.h"
#import "CellImageView.h"
#import "CellStaticisView.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface MyCell()

@property(nonatomic, strong)CellUserView *cUserView;
@property(nonatomic, strong)CellContentView *cContentView;
@property(nonatomic, strong)CellImageView *cImageView;
@property(nonatomic, strong)CellStaticisView *cStaticisView;
@property(nonatomic, strong)CellModel *cellModel;


@end

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
       [self createComponent];
    }
    return self;
}

- (void)createComponent
{
    self.cUserView = [[CellUserView alloc] init];
    self.cUserView.backgroundColor = [UIColor greenColor];
    self.cContentView = [[CellContentView alloc] init];
    self.cContentView.backgroundColor = [UIColor redColor];
    self.cImageView = [[CellImageView alloc] init];
    self.cImageView.backgroundColor = [UIColor blueColor];
    self.cStaticisView = [[CellStaticisView alloc] init];
    self.cStaticisView.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:self.cUserView];
    [self addSubview:self.cContentView];
    [self addSubview:self.cImageView];
    [self addSubview:self.cStaticisView];
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor blackColor] CGColor]; //OC对象和CF对象转换一下
}
- (void)layoutSubviews
{
    NSString *contentStr = self.cellModel.content;
    CGSize opinionContentSize = [contentStr boundingRectWithSize:CGSizeMake(WIDTH - CELL_LEFTORRIGHT_INSET * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.0]} context:nil].size;
    
    CGFloat contentHeight = opinionContentSize.height;
    NSInteger imageHeight = [self.model.imageArray count] == 0 ? 0 : CELL_IMAGEVIEW_HEIGHT;
    
    self.cUserView.frame = CGRectMake(0, CELL_TOP_INSET, WIDTH, CELL_USERVIEW_HEIGHT);
    self.cContentView.frame = CGRectMake(0, CELL_TOP_INSET + CELL_USERVIEW_HEIGHT + CELL_INTERVAL7, WIDTH, contentHeight);
    
    self.cImageView.frame = CGRectMake(0, CELL_TOP_INSET + CELL_USERVIEW_HEIGHT + CELL_INTERVAL7 + contentHeight + CELL_INTERVAL7, WIDTH, imageHeight);
    
    self.cStaticisView.frame = CGRectMake(0, HEIGHT - CELL_BOTTOM_INSET - CELL_STATICISVIEW_HEIGHT, WIDTH, CELL_STATICISVIEW_HEIGHT);
}

- (void)addCellModel:(CellModel*)model
{
    UserInfoModel *u_model = model.userInfo;
    StatisticsModel *s_model = model.statistics;
    
    [self.cUserView refreshMesWithModel:u_model];
    [self.cContentView refreshContentWithString:model.content];
    [self.cImageView refreshImageView:model.imageArray];
    [self.cStaticisView refreshMesWithModel:s_model];
    self.cellModel = model;
}

@end

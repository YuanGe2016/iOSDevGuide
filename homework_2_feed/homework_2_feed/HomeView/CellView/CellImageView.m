//
//  CellImageView.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "CellImageView.h"
#import <SDWebImage/SDWebImage.h>
#import <YYImage/YYImage.h>

#define IMAGEVIEW_MAX 3
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface CellImageView()

@property(nonatomic, assign)NSInteger imageNumber;
@property(nonatomic, strong)NSArray *imageViewArray;

@end

@implementation CellImageView

- (instancetype)init
{
    if(self = [super init]) {
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:IMAGEVIEW_MAX]; //如果不这样初始化数组，后面即使addObject，这个数组还是空的
        for(int i = 0; i < IMAGEVIEW_MAX; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [mArray addObject:imageView];
            [self addSubview:imageView];
        }
        self.imageViewArray = [NSArray arrayWithArray:mArray];
    }
    return self;
}

- (void)layoutSubviews
{
    if(self.imageNumber == 1) {
        UIImageView *imView = self.imageViewArray[0];
        imView.frame = CGRectMake(16.0, 0, (WIDTH - 32.0) / 2.0, HEIGHT);
    }
    else if(self.imageNumber == 0){
        return ;
    }
    else
    {
        long picnum = self.imageNumber < IMAGEVIEW_MAX ? self.imageNumber : IMAGEVIEW_MAX;
        CGFloat everyWidth = (WIDTH - 16.0 * 2 - 4.0) / 3;
        for(long i = 0; i < picnum; i++)
        {
            UIImageView *imView = self.imageViewArray[i];
            imView.frame = CGRectMake(16.0 + i * (113.0 + 2.0), 0, everyWidth, HEIGHT);
        }
    }
}

- (void)refreshImageView:(NSArray *)array;
{
    self.imageNumber= [array count];
    long picnum = self.imageNumber < IMAGEVIEW_MAX ? self.imageNumber : IMAGEVIEW_MAX; //防止进来的数组的大小超过3，因为最大可展示的图片数量设为了3
    for(long i = 0; i < picnum; i++) {
        NSURL *url = [NSURL URLWithString:array[i]];       //原始的NSArray里的是字符串，要先转为url才能用
        NSData *data = [NSData dataWithContentsOfURL:url];
        YYImage *image = [YYImage imageWithData:data];
        [(UIImageView *)self.imageViewArray[i] setImage:image];
    }
}


@end

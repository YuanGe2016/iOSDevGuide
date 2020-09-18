//
//  CellModel.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "CellModel.h"
#import <YYModel/YYModel.h>

@implementation UserInfoModel

@end

@implementation StatisticsModel

@end

@implementation CellModel

+ (NSArray *)createCellModelWithData:(NSData *)data
{
    NSArray *array = [NSArray yy_modelArrayWithClass:[CellModel class] json:data];
    return array;
}

- (NSString *)description
{
    return [self yy_modelDescription];
}

@end


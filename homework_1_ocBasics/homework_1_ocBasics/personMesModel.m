//
//  personMesModel.m
//  homework_1_ocBasics
//
//  Created by LuJiayuan666 on 2020/7/16.
//  Copyright © 2020 LuJiayuan666. All rights reserved.
//

#import "personMesModel.h"

@implementation MediaInfoModel

@end

@implementation PersonMessageModel

- (NSString *)description
{
    return [self yy_modelDescription];
}

@end

@implementation ResultModel

- (instancetype)initWithFunctionName:(NSString *)funcName
{
    self = [super init];
    if(self) {
        _funcName = funcName;
        _costTime = @"0.0ms";
    }
    return self;
}

@end


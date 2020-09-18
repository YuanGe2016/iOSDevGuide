//
//  CellModel.h
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : NSObject

@property(nonatomic, strong)NSURL *avatar_url;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *verified_content;
@property(nonatomic, strong)NSURL *personPageUrl;

@end

@interface StatisticsModel : NSObject

@property(nonatomic, copy)NSString *comment_count;
@property(nonatomic, copy)NSString *share_count;
@property(nonatomic, copy)NSString *like_count;

@end

@interface CellModel : NSObject

@property(nonatomic, strong)UserInfoModel *userInfo;
@property(nonatomic, copy)NSString *content;
@property(nonatomic, strong)NSArray *imageArray;
@property(nonatomic, strong)StatisticsModel *statistics;

+ (NSArray *)createCellModelWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

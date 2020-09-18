//
//  personMesModel.h
//  homework_1_ocBasics
//
//  Created by LuJiayuan666 on 2020/7/16.
//  Copyright © 2020 LuJiayuan666. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <YYModel/YYModel.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediaInfoModel : JSONModel

@property(nonatomic)NSURL *avatar_url;
@property(nonatomic)NSString *name;
@property(nonatomic)NSString *verified_content;
@property(nonatomic)BOOL user_verified;

@end

@interface PersonMessageModel : JSONModel

@property(nonatomic)MediaInfoModel *media_info;
@property(nonatomic)NSString *content;
@property(nonatomic)NSInteger comment_count;
@property(nonatomic)NSInteger share_count;
@property(nonatomic)NSInteger like_count;
@property(nonatomic)NSURL *image_url;

@end

@interface ResultModel : NSObject

@property(nonatomic)NSString *funcName;
@property(nonatomic)NSString *costTime;
@property(nonatomic)PersonMessageModel *messageModel;

- (instancetype)initWithFunctionName:(NSString *)funcName;

@end



NS_ASSUME_NONNULL_END

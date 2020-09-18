//
//  LJYPerson.h
//  classCluster
//
//  Created by Bytedance on 2020/6/29.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, LJYPersonType)
{
    LJYPersonTypeLeader,
    LJYPersonTypeMentor,
    LJYPersonTypeMember,
};

NS_ASSUME_NONNULL_BEGIN

@interface LJYPerson : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)NSInteger age;

+ (LJYPerson *) personWithType:(LJYPersonType) Type;

- (void)introduce;

@end


NS_ASSUME_NONNULL_END

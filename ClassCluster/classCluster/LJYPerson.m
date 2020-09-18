//
//  LJYPerson.m
//  classCluster
//
//  Created by Bytedance on 2020/6/29.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "LJYPerson.h"

@interface LJYPersonLeader : LJYPerson
@end

@interface LJYPersonMentor : LJYPerson
@end

@interface LJYPersonMember : LJYPerson
@end

@implementation LJYPerson

+ (LJYPerson *) personWithType:(LJYPersonType) Type
{
    switch (Type) {
        case LJYPersonTypeLeader:
            return [LJYPersonLeader new];
            break;
        case LJYPersonTypeMentor:
            return [LJYPersonMentor new];
            break;
        case LJYPersonTypeMember:
            return [LJYPersonMember new];
            break;
    }
}

- (void)introduce
{
    
}

@end

@implementation LJYPersonLeader

- (void)introduce
{
    NSLog(@"%@, %@, %ld", NSStringFromClass([self class]), self.name, self.age);
}

@end

@implementation LJYPersonMentor

- (void) introduce
{
    NSLog(@"%@, %@, %ld", NSStringFromClass([self class]), self.name, self.age);
}

@end

@implementation LJYPersonMember

- (void) introduce
{
    NSLog(@"%@, %@, %ld", NSStringFromClass([self class]), self.name, self.age);
}

@end

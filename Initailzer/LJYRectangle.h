//
//  LJYRectangle.h
//  Initailzer
//
//  Created by Bytedance on 2020/6/30.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJYRectangle : NSObject

@property(nonatomic, readonly, assign)NSInteger height;
@property(nonatomic, readonly, assign)NSInteger width;

- (id)init;
- (id)initWithHeight:(NSInteger)height andWidth:(NSInteger)width;


@end

NS_ASSUME_NONNULL_END

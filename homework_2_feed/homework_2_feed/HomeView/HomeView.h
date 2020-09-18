//
//  HomeView.h
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FeedDelegate <UITableViewDelegate, UITableViewDataSource>

@end

@interface HomeView : UIView

- (instancetype)initWithFrame:(CGRect)frame AndDelegate: (NSObject<FeedDelegate> *)delegate ;

@end

NS_ASSUME_NONNULL_END

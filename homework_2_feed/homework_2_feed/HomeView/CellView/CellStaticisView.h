//
//  CellStaticisView.h
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class StatisticsModel;

@interface CellStaticisView : UIView

- (void)refreshMesWithModel:(StatisticsModel *)model;

@end

NS_ASSUME_NONNULL_END

//
//  CellUserView.h
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/21.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfoModel;

@interface CellUserView : UIView

- (void)refreshMesWithModel:(UserInfoModel *)model;

@end

NS_ASSUME_NONNULL_END

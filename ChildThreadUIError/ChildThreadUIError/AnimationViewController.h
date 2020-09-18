//
//  AnimationViewController.h
//  AlertViewActionSheet
//
//  Created by Bytedance on 2020/6/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, LJYState)
{
    lovingState = 0,
    angryState = 1 << 1,
    gladState = 1 << 2,
    excitedState = 1 << 3
};

typedef NS_ENUM(NSInteger, LJYLovedSinger)
{
    zhangxueyou = 0,
    zhangguorong = 1,
    zhoujielun = 2,
    denglijun = 3
};

NS_ASSUME_NONNULL_BEGIN

@interface AnimationViewController : UIViewController

@end

NS_ASSUME_NONNULL_END

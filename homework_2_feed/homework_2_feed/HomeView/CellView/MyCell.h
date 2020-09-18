//
//  MyCell.h
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define CELL_TOP_INSET 16.0
#define CELL_BOTTOM_INSET 14.0
#define CELL_LEFTORRIGHT_INSET 16.0
#define CELL_USERVIEW_HEIGHT 36.0
#define CELL_IMAGEVIEW_HEIGHT 113.0
#define CELL_STATICISVIEW_HEIGHT 24.0
#define CELL_INTERVAL7 7.0
#define CELL_INTERVAL10 10.0

NS_ASSUME_NONNULL_BEGIN

@class CellModel;

@interface MyCell : UITableViewCell

@property(nonatomic, strong)CellModel *model;

- (void)addCellModel:(CellModel *)model;

@end

NS_ASSUME_NONNULL_END

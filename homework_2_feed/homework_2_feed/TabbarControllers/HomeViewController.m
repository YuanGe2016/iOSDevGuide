//
//  HomeViewController.m
//  homework_2_feed
//
//  Created by LuJiayuan on 2020/7/19.
//  Copyright © 2020 LuJiayuan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "CellModel.h"
#import "MyCell.h"

#define cellIdentifier  @"CellIdentifier"
#define TOP_INSET 20.0

@interface HomeViewController () <FeedDelegate>

@property(nonatomic, strong)HomeView *homeView;
@property(nonatomic, strong)NSArray *cellModelItems;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"主页";
    self.tabBarItem.image = [UIImage imageNamed:@"new_home_tabbar"];
    
    [self createModel];
    self.homeView = [[HomeView alloc] initWithFrame:self.view.frame AndDelegate:self]; //代理注入
    [self.view addSubview:self.homeView];
    
    CGRect tempFrame = self.view.frame; //这个VC管理的view是到顶的，但是我们自己设的homeView要减去苹果的上边留海
    tempFrame.origin.y = TOP_INSET;
    tempFrame.size.height -= TOP_INSET;
    self.homeView.frame = tempFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建model

- (void)createModel
{
    NSString *bfn = [[NSBundle mainBundle] pathForResource:@"JsonData" ofType:@"bundle"];
    NSString *jfn = [[NSBundle bundleWithPath:bfn] pathForResource:@"publishments" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jfn];
    
    self.cellModelItems = [CellModel createCellModelWithData: data];
    for(id obj in self.cellModelItems) {
        NSLog(@"%@", obj);
    }
}


#pragma mark - UITableViewDataSource 协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellModelItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model = (CellModel *)self.cellModelItems[indexPath.row];
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.model = model;
    [cell addCellModel:model]; //因为需要根据model（数据）进行重绘（layoutSubviews方法），所以需要给每个cell对象增加一个model属性
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0;
    CGFloat width = tableView.frame.size.width;
    CellModel *model = (CellModel *)self.cellModelItems[indexPath.row];
    
    NSString *contentStr = model.content;
    CGSize opinionContentSize = [contentStr boundingRectWithSize:CGSizeMake(width - CELL_LEFTORRIGHT_INSET * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.0]} context:nil].size;
    CGFloat contentHeight = opinionContentSize.height; //这个方法可以通过给定一段字符串算出能包含它的size
    
    NSInteger imageHeight = [model.imageArray count] == 0 ? 0 : CELL_IMAGEVIEW_HEIGHT;  //如果图片（url）数组为空，则图片view高度为0
    height = CELL_TOP_INSET + CELL_USERVIEW_HEIGHT + CELL_INTERVAL7 + contentHeight + CELL_INTERVAL7 +imageHeight +CELL_INTERVAL10 + CELL_STATICISVIEW_HEIGHT + CELL_BOTTOM_INSET;
    
    return height;
}

@end

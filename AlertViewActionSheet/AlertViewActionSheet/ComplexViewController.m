//
//  ComplexViewController.m
//  AlertViewActionSheet
//
//  Created by Bytedance on 2020/5/23.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ComplexViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface ComplexViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray *listTeams;
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation ComplexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = self.listTeams[row];
    cell.textLabel.text = rowDict[@"name"];
    
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.jpeg",rowDict[@"image"] ];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end

//
//  ViewController.m
//  LittleRedBook-master
//
//  Created by Seven on 2019/4/10.
//  Copyright © 2019年 KM. All rights reserved.
//

#import "ViewController.h"
#import "HomeRecommandModel.h"
#import "HomeViewModel.h"
#import "HomeVideoCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *dataSource;
@end
static NSString *const DefaultIdentifier = @"HomeVideoCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeVideoCell" bundle:nil] forCellReuseIdentifier:DefaultIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.estimatedRowHeight = 250;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [HomeViewModel getDataWith:homeList withSuccess:^(YBNetworkResponse * _Nonnull response) {
        self.dataSource = (NSArray *)response;
        [self.tableView reloadData];
    } faliure:^(YBNetworkResponse * _Nonnull response) {
        
    }];
}
//*****************************************************************
// MARK: - DataSource
//*****************************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultIdentifier];
    HomeRecommandModelContent *content = self.dataSource[indexPath.row];
    cell.content = content;
    cell.user = content.user_info;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 270;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end

//
//  HomeViewController.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+BaseViewController.h"
#import "Masonry.h"
#import "MJRefresh.h"

#import "HomeTableViewCell.h"
#import "HomeDataController.h"
#import "JoinModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

//UI
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *homeModelArray;
@property (nonatomic, copy) NSArray *homeViewModelArray;

@end

@implementation HomeViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self homeTableViewSetMJRefresh];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}


#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (nil == cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 105;
}

#pragma mark - event response

#pragma mark - private methods
- (void)homeTableViewSetMJRefresh
{
    _tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        HomeDataController *dataController = [[HomeDataController alloc] init];
        [dataController requestGoodsDataWithCallback:^(NSArray *object) {
//            _homeModelArray = object;
        }];
    }];
}


#pragma mark - getters and setters
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

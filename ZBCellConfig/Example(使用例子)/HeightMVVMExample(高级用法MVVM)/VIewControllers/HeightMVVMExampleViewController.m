//
//  HeightMVVMExampleViewController.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/18.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "HeightMVVMExampleViewController.h"
#import "HeightMVVMModel.h"
#import "HeightMVVMTableViewServeice.h"

@interface HeightMVVMExampleViewController ()

@property (nonatomic, strong) UITableView * heightMVVMTableView;

@property (nonatomic, strong) HeightMVVMTableViewServeice * tableViewServeice;

@end

@implementation HeightMVVMExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.heightMVVMTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"曾/删" style:UIBarButtonItemStyleDone target:self action:@selector(addOrDeleteCell:)];
}

- (void)addOrDeleteCell:(UIBarButtonItem *)sender
{
    self.tableViewServeice.hasCell2 = !self.tableViewServeice.hasCell2;
    // 刷新数据
    [self.heightMVVMTableView reloadData];
}

#pragma mark - <Setter/Getter>
- (UITableView *)heightMVVMTableView
{
    if (!_heightMVVMTableView) {
        _heightMVVMTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _heightMVVMTableView.delegate = self.tableViewServeice;
        _heightMVVMTableView.dataSource = self.tableViewServeice;
        /**
         * default is 0, which means there is no estimate
         * estimatedRowHeight 默认为 0，不估算cell高度
         * 赋值不为 0 时候，开启cell估值配合 layout 约束，进行cell高度自适应
         * 也就是说想要自动布局 cell 高度就给这个 estimatedRowHeight 属性赋值，值为你所有 cell 的平均高度的一个估值
         */
        _heightMVVMTableView.estimatedRowHeight = 100;
        // iOS8 系统中 rowHeight 的默认值已经设置成了 UITableViewAutomaticDimension
        _heightMVVMTableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _heightMVVMTableView;
}

- (HeightMVVMTableViewServeice *)tableViewServeice
{
    if (!_tableViewServeice) {
        _tableViewServeice = [[HeightMVVMTableViewServeice alloc] init];
        _tableViewServeice.model = [HeightMVVMModel new];
    }
    return _tableViewServeice;
}

@end

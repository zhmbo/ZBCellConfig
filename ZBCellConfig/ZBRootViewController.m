//
//  ZBRootViewController.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/18.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "ZBRootViewController.h"

@interface ZBRootViewController()

@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation ZBRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * 初/中/高级/高级MVVM 区分
     * 初级：此示例代码简单易懂，用于理解此框架；
     * 中级：看完此示例代码，能够在自己的项目中正确的使用；
     * 高级：此示例代码是针对于 iOS8+ 系统的 cell 高度自适应一个例子；
     * 高级MVVM：此示例代码是将 tableView 代理及 cellconfig 封装到 viewModel 里，使项目结构更加清晰。
     */
    
    // 标题
    self.title = @"ZBCellConfig 使用示例";
    
    // 注册 cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID_RootTVCCell"];
    self.tableView.rowHeight = 90;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID_RootTVCCell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID_RootTVCCell"];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    cell.textLabel.textColor = [UIColor colorWithRed:0.29 green:0.95 blue:0.63 alpha:1.00];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = self.dataSource[indexPath.row][@"detail"];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.40 green:0.22 blue:0.94 alpha:1.00];
    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(self.dataSource[indexPath.row][@"vc"]) class] new];
    vc.title = self.dataSource[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - <Setter/Getter>
- (NSArray *)dataSource
{
    if (!_dataSource) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"dataSource" ofType:@"plist"];
        _dataSource = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _dataSource;
}

@end

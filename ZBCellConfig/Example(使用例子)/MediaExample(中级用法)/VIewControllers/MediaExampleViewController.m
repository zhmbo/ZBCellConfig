//
//  MediaExampleViewController.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/18.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "MediaExampleViewController.h"
/**
 * 引用 ZBCellConfig (一套友好的 tableViewCell 管理方案)
 */
#import "ZBCellConfig.h"

/**
 * 所有cell 这里直接使用 lowExample 中的 cell 及 model，易于查看学习
 */
#import "LowTableViewCell1.h"
#import "LowTableViewCell2.h"
#import "LowTableViewCell3.h"

/**
 * 数据模型
 */
#import "LowModel.h"

@interface MediaExampleViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView * mediaTableView;

/**
 * 二维数组 (相当于 tableView 的数据结构，第一层是 section，第二层放 cell)
 */
@property (nonatomic, strong) NSMutableArray <NSArray <ZBCellConfig *> *> * cellConfigs;

/**
 * 展示 ZBCellConfig 的便捷增删功能特性，用于标记是否显示 cell2
 */
@property (nonatomic, assign) BOOL hasCell2;


@end

@implementation MediaExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mediaTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"曾/删" style:UIBarButtonItemStyleDone target:self action:@selector(addOrDeleteCell:)];
}

- (void)addOrDeleteCell:(UIBarButtonItem *)sender
{
    _hasCell2 = !_hasCell2;
    // 刷新数据
    [self.mediaTableView reloadData];
}


#pragma mark - <UITableView Delegate/DataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellConfigs.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellConfigs[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[indexPath.section][indexPath.row];
    
    // 根据对应的 cellConfig 获取 cell，并给 cell 赋值 根据模型显示。
    UITableViewCell *cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[[LowModel new]]];
    
    return cell;
}

// 每个 cell 的高度，这个方法在高级用法中省略
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[indexPath.section][indexPath.row];
    // 返回 cell 高度
    return cellConfig.cellHeight;
}

#warning tableView style 知识点
/**
 * 当 tableView style 为 UITableViewStyleGrouped 时，sectionView 的 header/footer 默认个预留出10的高度，然而这不是我们想要的效果，由于 同一个 section 下的 所有 cell 都是对应一个 sectionview，所以取首个就可以得到当前 sectionView 的配置信息.
 * 当 tableView style 为 UITableViewStylePlain 时，下面两个方法可省略。
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[section].firstObject;
    // 返回sectionHeader 高度
    return cellConfig.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[section].firstObject;
    // 返回sectionHeader 高度
    return cellConfig.sectionFooterHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - <Setter/Getter>
- (UITableView *)mediaTableView
{
    if (!_mediaTableView) {
        _mediaTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _mediaTableView.delegate = self;
        _mediaTableView.dataSource = self;
    }
    return _mediaTableView;
}

// cellconfigs
-  (NSMutableArray<NSArray<ZBCellConfig *> *> *)cellConfigs
{
    _cellConfigs = [[NSMutableArray alloc] init];
    
    /**
     * 改变不同类型cell的顺序、增删时，只需在此修改即可，无需在多个tableView代理方法中逐个修改
     * 具体使用查看【中级用法】
     */
    
    // cell1
    // 初始化方式1： 便利构造器初始化（方式1和方式2的效果是一样的根据自己喜好选择）
    ZBCellConfig *cell1Config = [ZBCellConfig cellConfigWithClass:[LowTableViewCell1 class] showCellInfoMethod:@selector(setModel:)];
    cell1Config.cellHeight = 150;
    [_cellConfigs addObject:@[cell1Config]];
    
    /**
     * 如需增删只需 添加或移除只需从 _cellConfigs 数组中操作。
     * 这样不需要再 tableView 的各个代理需各种恶心的判断
     */
    if (!_hasCell2) {
        // cell2
        // 初始化方式2：简单初始化给需要的属性赋值方式
        ZBCellConfig *cell2Config = [ZBCellConfig new];
        // 指定 cell 类
        cell2Config.cellClass = [LowTableViewCell2 class];
        // 指定 cell2 赋值 接受数据的方法，cell 在 tableview 的代理（tableView:cellForRowAtIndexPath:）中初始化完成后传参执行
        cell2Config.showCellInfoMethod = @selector(setModel:);
        // 固定的 cell 高度，【高级教程】中可不要此参数改为自动布局 cell 高度。
        cell2Config.cellHeight = 180;
        [_cellConfigs addObject:@[cell2Config]];
    }
    
    // cell3
    ZBCellConfig *cell3Config = [ZBCellConfig new];
    cell3Config.cellClass = [LowTableViewCell3 class];
    cell3Config.showCellInfoMethod = @selector(setModel:);
    cell3Config.cellHeight = 70;
    [_cellConfigs addObject:@[cell3Config, cell3Config, cell3Config]];
    
    return _cellConfigs;
}

@end

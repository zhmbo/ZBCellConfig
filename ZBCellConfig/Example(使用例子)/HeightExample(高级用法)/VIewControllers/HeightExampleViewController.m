//
//  HeightExampleViewController.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/18.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "HeightExampleViewController.h"
/**
 * 引用 ZBCellConfig (一套友好的 tableViewCell 管理方案)
 */
#import "ZBCellConfig.h"

/**
 * 所有cell 这里直接使用 lowExample 中的 cell 及 model，易于查看学习
 */
#import "HeightTableViewCell1.h"
#import "HeightTableViewCell2.h"
#import "HeightTableViewCell3.h"

/**
 * 数据模型
 */
#import "HeightModel.h"


@interface HeightExampleViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView * heightTableView;

/**
 * 二维数组 (相当于 tableView 的数据结构，第一层是 section，第二层放 cell)
 */
@property (nonatomic, strong) NSMutableArray <NSArray <ZBCellConfig *> *> * cellConfigs;

/**
 * 展示 ZBCellConfig 的便捷增删功能特性，用于标记是否显示 cell2
 */
@property (nonatomic, assign) BOOL hasCell2;

@end

@implementation HeightExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.heightTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"曾/删" style:UIBarButtonItemStyleDone target:self action:@selector(addOrDeleteCell:)];
}
- (void)addOrDeleteCell:(UIBarButtonItem *)sender
{
    _hasCell2 = !_hasCell2;
    // 刷新数据
    [self.heightTableView reloadData];
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
    
    UITableViewCell *cell = nil;
    
    // 根据对应的 cellConfig 获取 cell，并给 cell 赋值 根据模型显示。
    // • dataModels: 这里由于为示例代码不是用真实数据，只起到 执行 cell 的赋值函数。在实际项目中应该传递从网络请求的真实数据。
    if ([cellConfig isIdentiFier:[HeightTableViewCell3 class]]) { // 判断当前cell类 为 HeightTableViewCell3 时使用 xib 加载，因为 HeightTableViewCell3 采用的xib构建的
        cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[[HeightModel new]] isNib:YES];
    }else {
        cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[[HeightModel new]]];
    }
    
    return cell;
}

/* cell 使用 layout进行约束， 配合 tableview estimatedRowHeight 不需要此函数
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[indexPath.section][indexPath.row];
    // 返回 cell 高度
    return cellConfig.cellHeight;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - <Setter/Getter>
- (UITableView *)mediaTableView
{
    if (!_heightTableView) {
        _heightTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _heightTableView.delegate = self;
        _heightTableView.dataSource = self;
        // default is 0, which means there is no estimate
        // estimatedRowHeight 默认为 0，不估算cell高度
        // 赋值不为 0 时候，开启cell估值配合 layout 约束，进行cell高度自适应
        _heightTableView.estimatedRowHeight = 100;
    }
    return _heightTableView;
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
    ZBCellConfig *cell1Config = [ZBCellConfig cellConfigWithClass:[HeightTableViewCell1 class] showCellInfoMethod:@selector(setModel:)];
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
        cell2Config.cellClass = [HeightTableViewCell2 class];
        // 指定 cell2 赋值 接受数据的方法，cell 在 tableview 的代理（tableView:cellForRowAtIndexPath:）中初始化完成后传参执行
        cell2Config.showCellInfoMethod = @selector(setModel:);
        [_cellConfigs addObject:@[cell2Config]];
    }
    
    // cell3
    ZBCellConfig *cell3Config = [ZBCellConfig new];
    cell3Config.cellClass = [HeightTableViewCell3 class];
    cell3Config.showCellInfoMethod = @selector(setModel:);
    [_cellConfigs addObject:@[cell3Config, cell3Config, cell3Config]];
    
    return _cellConfigs;
}

@end

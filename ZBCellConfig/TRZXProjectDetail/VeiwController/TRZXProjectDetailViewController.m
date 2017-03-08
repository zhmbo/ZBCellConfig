//
//  TRZXProjectDetailViewController.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailViewController.h"
#import "TRZXProjectDetailMacro.h"
#import "TRZXProjectDetailNavigationBar.h"
#import "TRZXProjectDetailTableViewHeaderView.h"
#import "TRZXProjectDetailViewModel.h"
#import "ZBCellConfig.h"

/// 各种 cell
#import "TRZXProjectDetailOnlyTextTableViewCell.h"
#import "TRZXProjectDetailLeftTitleRightInfoTableViewCell.h"
#import "TRZXProjectDetailFinancingInfoTableViewCell.h"
#import "TRZXProjectDetailProjectHistoryTableViewCell.h"
#import "TRZXProjectDetailTeamTableViewCell.h"
#import "TRZXProjectDetailCommentTableViewCell.h"
#import "TRZXProjectDetailCommendTableViewCell.h"
#import "TRZXProjectDetailOnLineClassTableViewCell.h"
#import "TRZXProjectDetailnvestTableViewCell.h"

/// sectionHeader
#import "TRZXProjectDetailTitleSectionHeaderView.h"
#import "TRZXProjectDetailLeftRedTitleSectionHeaderView.h"

@interface TRZXProjectDetailViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

/**
 主tableView视图
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 自定义导航栏
 */
@property (nonatomic, strong) TRZXProjectDetailNavigationBar *navigationBar;
/**
 tableView 头视图
 */
@property (nonatomic, strong) TRZXProjectDetailTableViewHeaderView *tableViewHeaderView;
/**
 VM
 */
@property (nonatomic, strong) TRZXProjectDetailViewModel *projectDetailVM;

/**
 存储 cell
 */
@property (nonatomic, strong) NSMutableArray <NSArray <ZBCellConfig *> *> *sectionArray;

@end

@implementation TRZXProjectDetailViewController

#pragma mark - <生命周期>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kTRZXBGrayColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addOwnViews];
    
    [self layoutFrameOfSubViews];
    
    [self receiveActions];
    
    [self reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.navigationController.navigationBarHidden = YES;
}

- (void)addOwnViews
{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navigationBar];
}

- (void)layoutFrameOfSubViews
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(kProjectDetailNavigationViewHeight);
    }];
}

- (void)receiveActions
{
    __weak __typeof(&*self)weakSelf = self;
    [_navigationBar setOnProjectDetailActionBlock:^(ENavigationBarAction action) {
        switch (action) {
            case ENavigationBarAction_Back: {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
                break;
            case ENavigationBarAction_Collect: {
                NSLog(@"ENavigationBarAction_Collect!");
            }
                
                break;
            case ENavigationBarAction_Share: {
                NSLog(@"ENavigationBarAction_Share!");
            }
                
                break;
                
            default:
                break;
        }
    }];
}

- (void)configSubViews
{
    [_tableViewHeaderView setCoverImage:@"" titile:@"中共中央党校系会主席级萌死了便急死"];
    _navigationBar.title = @"中共中央党校系会主席级萌死了便急死";
}

- (void)reloadData
{
    [self.projectDetailVM reloadDataFromProjectDetailNetwork:self.projectId success:^(id json) {
        // 配置子视图
        [self configSubViews];
        
        // 配置 cell
        [self configSectionCells];
        
        // 刷新列表
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - <Private-Method>
- (void)configSectionCells
{
    // ETableViewSection_ProjectBaseHeader
    ZBCellConfig *projectBaseHeaderCellConfig = [[ZBCellConfig alloc] init];
    projectBaseHeaderCellConfig.title = @"项目标题";
    projectBaseHeaderCellConfig.cellClass = [TRZXProjectDetailOnlyTextTableViewCell class];
    projectBaseHeaderCellConfig.showCellInfoMethod = @selector(setModel:);
    [self.sectionArray addObject:@[projectBaseHeaderCellConfig]];
    
    // ETableViewSection_ProjectBaseSubInfo
    NSMutableArray <ZBCellConfig *> *subInfoSectionCells = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        ZBCellConfig *leftTitleRightInfoCellConfig = [[ZBCellConfig alloc] init];
        leftTitleRightInfoCellConfig.title = @"基本信息";
        leftTitleRightInfoCellConfig.cellClass = [TRZXProjectDetailLeftTitleRightInfoTableViewCell class];
        leftTitleRightInfoCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        [subInfoSectionCells addObject:leftTitleRightInfoCellConfig];
    }
    [self.sectionArray addObject:subInfoSectionCells];
    
    // ETableViewSection_ProjectFinancingInfo
    ZBCellConfig *financingInfoCellConfig = [[ZBCellConfig alloc] init];
    financingInfoCellConfig.title = @"融资信息";
    financingInfoCellConfig.cellClass = [TRZXProjectDetailFinancingInfoTableViewCell class];
    financingInfoCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
    financingInfoCellConfig.showCellInfoMethod = @selector(setModel:);
    financingInfoCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
    financingInfoCellConfig.sectionHeaderHeight = 40;
    [self.sectionArray addObject:@[financingInfoCellConfig]];
    
    // ETableViewSection_ProjectDetail
    ZBCellConfig *projectDetailCellConfig = [[ZBCellConfig alloc] init];
    projectDetailCellConfig.title = @"项目详情";
    projectDetailCellConfig.cellClass = [TRZXProjectDetailOnlyTextTableViewCell class];
    projectDetailCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
    projectDetailCellConfig.showCellInfoMethod = @selector(setModel:);
    projectDetailCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
    projectDetailCellConfig.sectionHeaderHeight = 40;
    [self.sectionArray addObject:@[projectDetailCellConfig]];
    
    // ETableViewSection_ProjectHistory
    NSMutableArray <ZBCellConfig *> *projectHistoryCells = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        ZBCellConfig *projectHistoryCellConfig = [[ZBCellConfig alloc] init];
        projectHistoryCellConfig.title = @"项目大事记";
        projectHistoryCellConfig.cellClass = [TRZXProjectDetailProjectHistoryTableViewCell class];
        projectHistoryCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
        projectHistoryCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        projectHistoryCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
        projectHistoryCellConfig.sectionHeaderHeight = 40;
        [projectHistoryCells addObject:projectHistoryCellConfig];
    }
    [self.sectionArray addObject:projectHistoryCells];
    
    // ETableViewSection_ProjectCreatePeople
    ZBCellConfig *projectCreatePeopleCellConfig = [ZBCellConfig new];
    projectCreatePeopleCellConfig.title = @"创始人";
    projectCreatePeopleCellConfig.cellClass = [TRZXProjectDetailOnlyTextTableViewCell class];
    projectCreatePeopleCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
    projectCreatePeopleCellConfig.showCellInfoMethod = @selector(setModel:);
    projectCreatePeopleCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
    projectCreatePeopleCellConfig.sectionHeaderHeight = 40;
    [self.sectionArray addObject:@[projectCreatePeopleCellConfig]];
    
    // ETableViewSection_Team
    NSMutableArray <ZBCellConfig *> *teamCells = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        ZBCellConfig *teamPeopleCellConfig = [ZBCellConfig new];
        teamPeopleCellConfig.title = @"核心团队";
        teamPeopleCellConfig.cellClass = [TRZXProjectDetailTeamTableViewCell class];
        teamPeopleCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
        teamPeopleCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        teamPeopleCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
        teamPeopleCellConfig.sectionHeaderHeight = 40;
        [teamCells addObject:teamPeopleCellConfig];
    }
    [self.sectionArray addObject:teamCells];
    
    // ETableViewSection_TeamDescribe
    ZBCellConfig *teamDescribeCellConfig = [ZBCellConfig new];
    teamDescribeCellConfig.title = @"团队概述";
    teamDescribeCellConfig.cellClass = [TRZXProjectDetailOnlyTextTableViewCell class];
    teamDescribeCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
    teamDescribeCellConfig.showCellInfoMethod = @selector(setModel:);
    teamDescribeCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
    teamDescribeCellConfig.sectionHeaderHeight = 40;
    [self.sectionArray addObject:@[teamDescribeCellConfig]];
    
    // ETableViewSection_CompanyDescription
    ZBCellConfig *companyDescriptionCellConfig = [ZBCellConfig new];
    companyDescriptionCellConfig.title = @"公司简介";
    companyDescriptionCellConfig.cellClass = [TRZXProjectDetailOnlyTextTableViewCell class];
    companyDescriptionCellConfig.sectionHeaderClass = [TRZXProjectDetailTitleSectionHeaderView class];
    companyDescriptionCellConfig.showCellInfoMethod = @selector(setModel:);
    companyDescriptionCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
    companyDescriptionCellConfig.sectionHeaderHeight = 40;
    [self.sectionArray addObject:@[companyDescriptionCellConfig]];
    
    // ETableViewSection_Comment
#warning 如需评论模块只需将注释打开即可，不需要其他操作
//    ZBCellConfig *commentCellConfig = [ZBCellConfig new];
//    commentCellConfig.title = @"评论";
//    commentCellConfig.cellClass = [TRZXProjectDetailCommentTableViewCell class];
//    commentCellConfig.showCellInfoMethod = @selector(setModel:);
//    commentCellConfig.sectionHeaderHeight = 10;
//    [self.sectionArray addObject:@[commentCellConfig]];
    
    // ETableViewSection_Commend
    ZBCellConfig *commedCellConfig = [ZBCellConfig new];
    commedCellConfig.cellClass = [TRZXProjectDetailCommendTableViewCell class];
    commedCellConfig.sectionHeaderHeight = 10;
    [self.sectionArray addObject:@[commedCellConfig]];
    
    // ETableViewSection_OnLineClass
    NSMutableArray <ZBCellConfig *> *onlineClassCellConfigs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        ZBCellConfig *onlineClassCellConfig = [ZBCellConfig new];
        onlineClassCellConfig.title = @"在线课程";
        onlineClassCellConfig.cellClass = [TRZXProjectDetailOnLineClassTableViewCell class];
        onlineClassCellConfig.sectionHeaderClass = [TRZXProjectDetailLeftRedTitleSectionHeaderView class];
        onlineClassCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        onlineClassCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
        onlineClassCellConfig.sectionHeaderHeight = 35;
        [onlineClassCellConfigs addObject:onlineClassCellConfig];
    }
    [self.sectionArray addObject:onlineClassCellConfigs];
    
    // ETableViewSection_OneToOne
    NSMutableArray <ZBCellConfig *> *oneToOneCellConfigs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        ZBCellConfig *oneToOneCellConfig = [ZBCellConfig new];
        oneToOneCellConfig.title = @"一对一咨询";
        oneToOneCellConfig.cellClass = [TRZXProjectDetailOnLineClassTableViewCell class];
        oneToOneCellConfig.sectionHeaderClass = [TRZXProjectDetailLeftRedTitleSectionHeaderView class];
        oneToOneCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        oneToOneCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
        oneToOneCellConfig.sectionHeaderHeight = 35;
        [oneToOneCellConfigs addObject:oneToOneCellConfig];
    }
    [self.sectionArray addObject:oneToOneCellConfigs];
    
    
    // ETableViewSection_InvestPeople
    NSMutableArray <ZBCellConfig *> *investPeopleCellConfigs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        ZBCellConfig *investPeopleCellConfig = [ZBCellConfig new];
        investPeopleCellConfig.title = @"投资人";
        investPeopleCellConfig.cellClass = [TRZXProjectDetailnvestTableViewCell class];
        investPeopleCellConfig.sectionHeaderClass = [TRZXProjectDetailLeftRedTitleSectionHeaderView class];
        investPeopleCellConfig.showCellInfoMethod = @selector(setModel:indexPath:);
        investPeopleCellConfig.showSectionHeaderInfoMethod = @selector(setTitle:);
        investPeopleCellConfig.sectionHeaderHeight = 35;
        [investPeopleCellConfigs addObject:investPeopleCellConfig];
    }
    [self.sectionArray addObject:investPeopleCellConfigs];
}

#pragma mark - <UITableViewDelegate/DataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sectionArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZBCellConfig *cellConfig = _sectionArray[indexPath.section][indexPath.row];
    
    UITableViewCell *cell = nil;
    
    TRZXProjectDetailModel *model = self.projectDetailVM.projectDetailModel;
    
    cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[model,indexPath]];
    
    // xib 加载
    if ([cellConfig isTitle:@"投资人"]) {
        
        cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[model,indexPath] isNib:YES];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZBCellConfig *cellConfig = _sectionArray[section].firstObject;
    
    return [cellConfig sectionHederOfCellConfigWithTableView:tableView dataModels:@[cellConfig.title?cellConfig.title:@""] isNib:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _sectionArray[section].firstObject.sectionHeaderHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = scrollView.contentOffset;
    
    [_navigationBar makeNavigationBarIsShowWithContentOfsetY:contentOffset.y];
    
    [_tableViewHeaderView makeBackGroundImageScaleOfScrollViewDidScroll:contentOffset.y];
}

#pragma mark - <Setter/Getter>
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        // 设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置header
        _tableView.tableHeaderView = self.tableViewHeaderView;
        // 设置背景色
        _tableView.backgroundColor = kTRZXBGrayColor;
        // 自动计算cell高度
        _tableView.estimatedRowHeight = 80.0f;
        // iOS8 系统中 rowHeight 的默认值已经设置成了 UITableViewAutomaticDimension
        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedSectionHeaderHeight = 10;
//        _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
         // 去除cell分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (TRZXProjectDetailNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[TRZXProjectDetailNavigationBar alloc] init];
    }
    return _navigationBar;
}

- (TRZXProjectDetailTableViewHeaderView *)tableViewHeaderView
{
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[TRZXProjectDetailTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, kProjectDetailTableViewHeaderViewHeight)];
    }
    return _tableViewHeaderView;
}

- (TRZXProjectDetailViewModel *)projectDetailVM
{
    if (!_projectDetailVM) {
        _projectDetailVM = [[TRZXProjectDetailViewModel alloc] init];
    }
    return _projectDetailVM;
}

- (NSMutableArray<NSArray<ZBCellConfig *> *> *)sectionArray
{
    if (!_sectionArray) {
        _sectionArray = [[NSMutableArray alloc] init];
    }
    return _sectionArray;
}
@end

//
//  ZBCellConfig.h
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/3/4.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//  

/**
 * 请仔细阅读示例代码
 * ZBCellConfig 对象实例会将 tableView 中 cell 所需的基本信息存储下来，然后放到数组中进行管理；
 * 每个 ZBCellConfig 实例与 tableView 中想要显示的 cell 相对应。（但注意，是"想要显示的"cell，由于cell的重用，实际上cell并不会生成那么多）
 
 * 优点：改变不同类型cell的顺序、增删时，极为方便，只需改变用于存放 ZBCellConfig 的数组即可，** 重点是无需在多个tableView代理方法中逐个修改 **
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZBCellConfig : NSObject

#pragma mark - <参数>
/**
 标题 - 如“我的订单”，对不同种cell进行不同设置时，可以通过 其对应的 cellConfig.title 进行判断
 */
@property (nonatomic, strong) NSString *title;

/**
 cell类
 */
@property (nonatomic, assign) Class cellClass;

/**
 cell 显示数据模型的方法
 */
@property (nonatomic, assign) SEL showCellInfoMethod;

/**
 cell 高度 (固定) - * 动态 cell 高度查看 Demo 中 【HeightExample(高级用法)】*
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 指定 cell 重用ID，默认使用类名作为重用ID
 */
@property (nonatomic, strong) NSString *cellIdentifier;

/**
 cell所在 section header 类
 */
@property (nonatomic, assign) Class sectionHeaderClass;
/**
 sectionHeader 显示数据模型的方法
 */
@property (nonatomic, assign) SEL showSectionHeaderInfoMethod;
/**
 指定 sectionHeader 重用ID，默认使用类名作为重用ID
 */
@property (nonatomic, strong) NSString *sectionHeaderIdentfier;
/**
 sectionHeader 高度 默认值 0
 */
@property (nonatomic, assign) CGFloat sectionHeaderHeight;


/**
 cell所在 section footer 类
 */
@property (nonatomic, assign) Class sectionFooterClass;

/**
 sectionFooter 显示数据模型的方法
 */
@property (nonatomic, assign) SEL showSectionFooterInfoMethod;

/**
 指定 sectionFooter 重用ID，默认使用类名作为重用ID
 */
@property (nonatomic, strong) NSString *sectionFooterIdentfier;
/**
 sectionFooter 高度 默认值 0
 */
@property (nonatomic, assign) CGFloat sectionFooterHeight;

/// 预留属性detail
@property (nonatomic, strong) NSString *detail;

/// 预留属性remark
@property (nonatomic, strong) NSString *remark;

#pragma mark - <便利构造器 - 返回 cellConfig 实例>
/**
 便利构造器(只有cell)
 
 @param cellClass cell类
 @param showCellInfoMethod 显示 cell 数据模型的方法
 @return 返回 cellConfig
 */
+ (instancetype)cellConfigWithClass:(Class)cellClass
                 showCellInfoMethod:(SEL)showCellInfoMethod;

/**
 便利构造器(cell+sectionHeader)
 
 @param cellClass cell类
 @param sectionHeaderClass sectionHeader 类
 @param showCellInfoMethod 显示 cell 数据模型的方法
 @param showSectionHeaderInfoMethod 显示 header 数据模型的方法
 @return 返回 cellConfig
 */
+ (instancetype)cellConfigWithClass:(Class)cellClass
                 sectionHeaderClass:(Class)sectionHeaderClass
                 showCellInfoMethod:(SEL)showCellInfoMethod
        showSectionHeaderInfoMethod:(SEL)showSectionHeaderInfoMethod;

/**
 便利构造器(cell+sectionHeader+sectionFooter)

 @param cellClass cell类
 @param sectionHeaderClass sectionHeader 类
 @param sectionFooterClass sectionFooter 类
 @param showCellInfoMethod 显示 cell 数据模型的方法
 @param showSectionHeaderInfoMethod 显示 header 数据模型的方法
 @param showSectionFooterInfoMethod 显示 footer 数据模型的方法
 @return 返回 cellConfig
 */
+ (instancetype)cellConfigWithClass:(Class)cellClass
                 sectionHeaderClass:(Class)sectionHeaderClass
                 sectionFooterClass:(Class)sectionFooterClass
                 showCellInfoMethod:(SEL)showCellInfoMethod
        showSectionHeaderInfoMethod:(SEL)showSectionHeaderInfoMethod
        showSectionFooterInfoMethod:(SEL)showSectionFooterInfoMethod;

#pragma mark - <获取 cell>
/**
 根据 cellConfig 生成 cell

 @param tableView tableView
 @param dataModels 数据模型 对应初始化 cellconfig 是的 showCellInfoMethod，参数为数组的形式
 @return cell
 */
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                        dataModels:(NSArray *)dataModels;

/**
 根据 cellConfig 生成 cell, 可使用 Nib
 
 @param tableView tableView
 @param dataModels 数据模型
 @param isNib 是否为xib加载
 @return cell
 */
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                        dataModels:(NSArray *)dataModels
                                             isNib:(BOOL)isNib;

#pragma mark - <获取 sectionHeaderView>
/**
 根据 cellConfig 生成 sectionHeaderView
 
 @param dataModels 数据模型
 @return section header
 */
- (UITableViewHeaderFooterView *)sectionHederOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels;

/**
 根据 cellConfig 生成 sectionHeaderView ,可用 Nib

 @param tableView tableView
 @param dataModels 数据模型
 @param isNib 是否为xib加载
 @return section header
 */
- (UITableViewHeaderFooterView *)sectionHederOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels
                                                                 isNib:(BOOL)isNib;

#pragma mark - <获取 sectionFooterView>
/**
 根据 cellConfig 生成 sectionFooterView
 
 @param tableView tableView
 @param dataModels 数据模型
 @return section footr
 */
- (UITableViewHeaderFooterView *)sectionFooterOfCellConfigWithTableView:(UITableView *)tableView
                                                             dataModels:(NSArray *)dataModels;

/**
 根据 cellConfig 生成 sectionFooterView ,可用 Nib
 
 @param tableView tableView
 @param dataModels 数据模型
 @param isNib 是否为xib加载
 @return section footer
 */
- (UITableViewHeaderFooterView *)sectionFooterOfCellConfigWithTableView:(UITableView *)tableView
                                                             dataModels:(NSArray *)dataModels
                                                                  isNib:(BOOL)isNib;

#pragma mark - <区分 cell 方法>
/**
 根据 cell 类 比较是否是当前 cellConfig

 @param class cell 类
 @return 返回BOOL结果
 */
- (BOOL)isIdentiFier:(Class)class;

/**
 根据 title 比较是否是当前 cellConfig

 @param title title
 @return 返回BOOL结果
 */
- (BOOL)isTitle:(NSString *)title;
@end

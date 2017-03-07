//
//  ZBCellConfig.h
//  ZBCellConfig
//
//  Created by zhangbao on 2017/3/4.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZBCellConfig : NSObject

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

/**
 根据 cellConfig 生成 cell

 @param tableView tableView
 @param dataModels 数据模型
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

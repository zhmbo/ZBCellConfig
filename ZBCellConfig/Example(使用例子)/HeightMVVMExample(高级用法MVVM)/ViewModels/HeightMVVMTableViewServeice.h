//
//  HeightMVVMTableViewServeice.h
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/20.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HeightMVVMModel;

@interface HeightMVVMTableViewServeice : NSObject
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) HeightMVVMModel * model;

/**
 * 展示 ZBCellConfig 的便捷增删功能特性，用于标记是否显示 cell2
 */
@property (nonatomic, assign) BOOL hasCell2;

@end

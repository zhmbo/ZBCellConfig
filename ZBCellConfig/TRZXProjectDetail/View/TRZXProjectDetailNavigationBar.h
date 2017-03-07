//
//  TRZXProjectDetailNavigationView.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ENavigationBarAction_Back,
    ENavigationBarAction_Collect,
    ENavigationBarAction_Share,
} ENavigationBarAction;

typedef void(^onProjectDetailActionBlock)(ENavigationBarAction action);

@interface TRZXProjectDetailNavigationBar : UIView

/**
 导航标题
 */
@property (nonatomic, strong) NSString *title;

/**
 导航栏个按钮点击事件回调
 */
@property (nonatomic, copy) onProjectDetailActionBlock onProjectDetailActionBlock;

/**
 改变导航栏及其子视图状态

 @param y contentOfset y
 */
- (void)makeNavigationBarIsShowWithContentOfsetY:(CGFloat)y;

@end

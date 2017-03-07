//
//  Target_TRZXProjectDetail.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "Target_TRZXProjectDetail.h"
#import "TRZXProjectDetailViewController.h"

@implementation Target_TRZXProjectDetail

- (UIViewController *)Action_ProjectDetailViewController:(NSDictionary *)params
{
    TRZXProjectDetailViewController *projectDetail_vc = [[TRZXProjectDetailViewController alloc] init];
    projectDetail_vc.projectId = @"projectId";
    return projectDetail_vc;
}

@end

//
//  TRZXProjectDetailViewModel.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailViewModel.h"
#import "TRZXProjectDetailModel.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailViewModel()


@end

@implementation TRZXProjectDetailViewModel

#pragma mark - <Public-Method>
// 获取数据
- (void)reloadDataFromProjectDetailNetwork:(NSString *)projectId success:(void(^)(id json))success failure:(void(^)(NSError *error))failure
{
    // 回调
    if (success) {
        success(nil);
    }
}

#pragma mark - <Setter/Getter>


- (TRZXProjectDetailModel *)projectDetailModel
{
    if (!_projectDetailModel) {
        _projectDetailModel = [[TRZXProjectDetailModel alloc] init];
    }
    return _projectDetailModel;
}

@end

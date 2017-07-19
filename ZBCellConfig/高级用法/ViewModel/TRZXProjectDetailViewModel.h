//
//  TRZXProjectDetailViewModel.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRZXProjectDetailModel;

@interface TRZXProjectDetailViewModel : NSObject

@property (nonatomic, strong) TRZXProjectDetailModel *projectDetailModel;

- (void)reloadDataFromProjectDetailNetwork:(NSString *)projectID success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

@end

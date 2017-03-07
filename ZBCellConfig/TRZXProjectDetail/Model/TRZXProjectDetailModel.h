//
//  TRZXProjectDetailModel.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//  项目详情模型

#import <Foundation/Foundation.h>

@class TRZXProjectDetailDataModel, TRZXProjectDetailCommentModel, TRZXProjectDetailVisitorModel;

@interface TRZXProjectDetailModel : NSObject

@property (nonatomic, assign) NSInteger                                 visitorsCount;
@property (nonatomic, assign) NSInteger                                 status_code;
@property (nonatomic, strong) NSString                                  *requestType;
@property (nonatomic, strong) NSString                                  *equipment;
@property (nonatomic, strong) NSString                                  *userId;
@property (nonatomic, assign) NSInteger                                 login_status;
@property (nonatomic, assign) NSInteger                                 subCount;
@property (nonatomic, strong) NSString                                  *isAlso;
@property (nonatomic, assign) NSInteger                                 totalComments;
@property (nonatomic, strong) NSString                                  *status_dec;
@property (nonatomic, strong) NSString                                  *apiType;
@property (nonatomic, strong) NSArray                                   *sessionUserType;
@property (nonatomic, strong) NSString                                  *sessionUserTypeStr;

@property (nonatomic, assign) BOOL                                      vip;
@property (nonatomic, assign) BOOL                                      iosOnline;

@property (nonatomic, strong) TRZXProjectDetailDataModel                *data;

@property (nonatomic, strong) NSArray <TRZXProjectDetailCommentModel *> *commentsJson;
@property (nonatomic, strong) NSArray <TRZXProjectDetailVisitorModel *> *visitors;

@end

@interface TRZXProjectDetailCommentModel : NSObject

@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *commentUserId;
@property (nonatomic, strong) NSString *commentUserPhoto;
@property (nonatomic, strong) NSString *beCommentId;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *dateInfo;
@property (nonatomic, assign) BOOL     isWatch;

@end

@interface TRZXProjectDetailVisitorModel : NSObject

@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *connectflag;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *dateTime;
@property (nonatomic, strong) NSString *head_img;

@end

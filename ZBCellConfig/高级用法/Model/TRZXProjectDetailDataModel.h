//
//  TRZXProjectDetailDataModel.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TRZXProjectDetailDataProjectFinancingModel, TRZXProjectDetailDataTeamModel, TRZXProjectDetailDataDynamicModel;

@interface TRZXProjectDetailDataModel : NSObject

@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *advantage;
@property (nonatomic, strong) NSString  *namcompanyAbse;
@property (nonatomic, strong) NSString  *exchangeName;
@property (nonatomic, strong) NSString  *authorName;
@property (nonatomic, strong) NSString  *authorAbs;
@property (nonatomic, assign) NSInteger praiseFlag;
@property (nonatomic, assign) NSInteger collectFlag;
@property (nonatomic, assign) NSInteger auditStatus;
@property (nonatomic, assign) NSInteger auditOpinion;
@property (nonatomic, strong) NSString  *headUrl;
@property (nonatomic, strong) NSString  *endUrl;
@property (nonatomic, strong) NSString  *auditFinancing;
@property (nonatomic, strong) NSString  *briefIntroduction;
@property (nonatomic, strong) NSString  *tradeInfo;
@property (nonatomic, strong) NSString  *companyName;
@property (nonatomic, strong) NSString  *companyAddress;
@property (nonatomic, assign) NSInteger totalAmount;
@property (nonatomic, strong) NSString  *isRemind;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString  *createById;
@property (nonatomic, strong) NSString  *pRoadShowUri;
@property (nonatomic, strong) NSArray   *pRoadShowUriV2;
@property (nonatomic, assign) NSInteger pRoadShowUriFlag;
@property (nonatomic, strong) NSString  *startDate;
@property (nonatomic, strong) NSString  *updateDate;
@property (nonatomic, strong) NSString  *projectAbs;
@property (nonatomic, strong) NSString  *marketSize;
@property (nonatomic, strong) NSString  *businessData;
@property (nonatomic, strong) NSString  *productsFuture;
@property (nonatomic, strong) NSString  *futurePlanning;
@property (nonatomic, strong) NSString  *financingAdvantage;
@property (nonatomic, strong) NSString  *teamAdvantage;
@property (nonatomic, strong) NSString  *projectHighlight;
@property (nonatomic, strong) NSString  *projectIntention;
@property (nonatomic, strong) NSString  *areaName;
@property (nonatomic, strong) NSString  *iosLink;
@property (nonatomic, strong) NSString  *androidLink;
@property (nonatomic, strong) NSString  *webLink;
@property (nonatomic, strong) NSString  *dataModelType;
@property (nonatomic, assign) NSInteger backstage;
@property (nonatomic, assign) NSInteger minMoney;
@property (nonatomic, assign) NSInteger focus;
@property (nonatomic, strong) NSString  *iPublicNum;
@property (nonatomic, assign) NSInteger d4aFlag;
@property (nonatomic, assign) NSInteger bpFlag;
@property (nonatomic, assign) NSInteger bpApply;
@property (nonatomic, strong) NSString  *projectLevel;
@property (nonatomic, strong) NSString  *roadShowId;
@property (nonatomic, strong) NSString  *defaultPic;
@property (nonatomic, strong) NSString  *topPic;
@property (nonatomic, strong) NSString  *recordLength;
@property (nonatomic, strong) NSString  *headImg;
@property (nonatomic, strong) NSArray   *urls;
@property (nonatomic, strong) NSString  *leadName;
@property (nonatomic, strong) NSString  *leadUserId;
@property (nonatomic, strong) NSString  *leadReason;
@property (nonatomic, strong) NSString  *leadBackAbs;
@property (nonatomic, strong) NSString  *leadAbs;
@property (nonatomic, strong) NSArray   *projectWithList;
@property (nonatomic, strong) NSString  *leadPhoto;
@property (nonatomic, strong) NSString  *headUrlV2;
@property (nonatomic, strong) NSString  *endUrlV2;
@property (nonatomic, strong) NSString  *logo;
@property (nonatomic, strong) NSString  *projectImg;
@property (nonatomic, strong) NSString  *carouselImg;
@property (nonatomic, strong) NSString  *businessPlan;
@property (nonatomic, strong) NSString  *freshCarouselImg;
@property (nonatomic, strong) NSString  *mid;

@property (nonatomic, strong) NSArray <TRZXProjectDetailDataTeamModel *>    *teamList;
@property (nonatomic, strong) NSArray <TRZXProjectDetailDataDynamicModel *> *dynamicList;
@property (nonatomic, strong) TRZXProjectDetailDataProjectFinancingModel    *projectFinancing;

@end

@interface TRZXProjectDetailDataProjectFinancingModel : NSObject

@property (nonatomic, strong) NSString  *remarks;
@property (nonatomic, strong) NSString  *createDate;
@property (nonatomic, strong) NSString  *updateDate;
@property (nonatomic, strong) NSString  *startDate;
@property (nonatomic, strong) NSString  *endDate;
@property (nonatomic, strong) NSString  *startDateStr;
@property (nonatomic, strong) NSString  *endDateStr;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) CGFloat   valuation;
@property (nonatomic, strong) NSString  *exitMechanism;
@property (nonatomic, assign) NSInteger stockPercentage;
@property (nonatomic, strong) NSArray   *beforeFinancingList;
@property (nonatomic, strong) NSString  *areaStageId;
@property (nonatomic, strong) NSString  *areaStageName;
@property (nonatomic, strong) NSString  *mid;

@end

@interface TRZXProjectDetailDataTeamModel : NSObject

@property (nonatomic, strong) NSString  *remarks;
@property (nonatomic, strong) NSString  *createDate;
@property (nonatomic, strong) NSString  *updateDate;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *position;
@property (nonatomic, strong) NSString  *abstractz;
@property (nonatomic, strong) NSString  *photo;
@property (nonatomic, strong) NSString  *maxPhoto;
@property (nonatomic, strong) NSString  *mid;

@end

@interface TRZXProjectDetailDataDynamicModel : NSObject

@property (nonatomic, strong) NSString  *remarks;
@property (nonatomic, strong) NSString  *createDate;
@property (nonatomic, strong) NSString  *updateDate;
@property (nonatomic, strong) NSString  *dynamicDate;
@property (nonatomic, strong) NSString  *abstractz;
@property (nonatomic, strong) NSString  *mid;

@end



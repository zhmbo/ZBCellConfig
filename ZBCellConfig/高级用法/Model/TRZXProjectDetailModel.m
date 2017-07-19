//
//  TRZXProjectDetailModel.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailModel.h"

@implementation TRZXProjectDetailModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"commentsJson" : @"TRZXProjectDetailCommentModel",
             @"visitors"     : @"TRZXProjectDetailVisitorModel"
             };
}

@end

@implementation TRZXProjectDetailCommentModel

@end

@implementation TRZXProjectDetailVisitorModel

@end

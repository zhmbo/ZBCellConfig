//
//  TRZXProjectDetailTableViewHeaderView.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRZXProjectDetailTableViewHeaderView : UIView

- (void)makeBackGroundImageScaleOfScrollViewDidScroll:(CGFloat)offset;

- (void)setCoverImage:(NSString *)coverImage titile:(NSString *)title;

@end

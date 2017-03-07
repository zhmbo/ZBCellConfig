//
//  TRZXProjectDetailMacro.h
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/7.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#ifndef TRZXProjectDetailMacro_h
#define TRZXProjectDetailMacro_h

#import <UIKit/UIKit.h>

#import "Masonry.h"

#define kTRZXBGrayColor [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/256.0f green:(g)/256.0f blue:(b)/256.0f alpha:(a)]
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/256.0f green:(g)/256.0f blue:(b)/256.0f alpha:(1)]
#define RANDOMCOLOR  RGBCOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define kProjectDetailTableViewHeaderViewHeight (SCREEN_WIDTH*3)/4
#define kProjectDetailNavigationViewHeight 64

#endif /* TRZXProjectDetailMacro_h */

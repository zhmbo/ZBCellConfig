//
//  LowTableViewCell1.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/19.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "LowTableViewCell1.h"
#import "LowModel.h"

@implementation LowTableViewCell1
{
    UIImageView *_aImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *aImageView = [[UIImageView alloc] init];
        aImageView.contentMode = UIViewContentModeScaleAspectFill;
        aImageView.clipsToBounds = YES;
        [self.contentView addSubview:aImageView];
        _aImageView = aImageView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _aImageView.frame = self.contentView.bounds;
}

- (void)setModel:(LowModel *)model
{
    _model = model;
    
    NSLog(@"【CELL 1】 成功获取到数据！");
    
    _aImageView.image = [UIImage imageNamed:@"background"];
}

@end

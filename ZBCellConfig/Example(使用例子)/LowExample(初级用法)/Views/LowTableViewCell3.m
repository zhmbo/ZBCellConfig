//
//  LowTableViewCell3.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/7/19.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "LowTableViewCell3.h"
#import "LowModel.h"

@implementation LowTableViewCell3
{
    UIImageView * _userIcon;
    UILabel     * _userName;
    UILabel     * _userGithub;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *userIcon = [UIImageView new];
        userIcon.clipsToBounds = YES;
        userIcon.layer.cornerRadius = 25;
        userIcon.contentMode = UIViewContentModeScaleAspectFit;
        userIcon.layer.borderColor = [UIColor colorWithRed:0.52 green:0.11 blue:0.89 alpha:1.00].CGColor;
        userIcon.layer.borderWidth = 1;
        [self.contentView addSubview:userIcon];
        _userIcon = userIcon;
        
        UILabel *userName = [[UILabel alloc] init];
        userName.numberOfLines = 0;
        [self.contentView addSubview:userName];
        _userName = userName;
        
        UILabel *userGithub = [[UILabel alloc] init];
        userGithub.numberOfLines = 0;
        userGithub.textColor = [UIColor colorWithRed:0.51 green:0.53 blue:0.59 alpha:1.00];
        userGithub.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:userGithub];
        _userGithub = userGithub;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _userIcon.frame = CGRectMake(10, 10, 50, 50);
    _userName.frame = CGRectMake(CGRectGetMaxX(_userIcon.frame)+10, _userIcon.frame.origin.y, 100, 20);
    _userGithub.frame = CGRectMake(_userName.frame.origin.x, CGRectGetMaxY(_userName.frame)+10, 220, 20);
}

- (void)setModel:(LowModel *)model
{
    _model = model;
    
    NSLog(@"【CELL 3】 成功获取到数据！");
    _userIcon.image = [UIImage imageNamed:@"userIcon"];
    _userName.text = @"itzhangbao";
    _userGithub.text = @"https://github.com/itzhangbao";
}

@end

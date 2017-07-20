//
//  HeightTableViewCell3.m
//  ZBCellConfig
//
//  Created by zhangbao on 2017/7/20.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "HeightTableViewCell3.h"

@implementation HeightTableViewCell3
{
    UIImageView * _userIcon;
    UILabel     * _userName;
    UILabel     * _userGithub;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
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
    
    // 约束
    [_userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userIcon.mas_right).offset(10);
        make.top.equalTo(_userIcon);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    [_userGithub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_userName);
        make.top.equalTo(_userName.mas_bottom).offset(10);
    }];

}

- (void)setModel:(HeightModel *)model
{
    _model = model;
    
    NSLog(@"【CELL 3】 成功获取到数据！");
    _userIcon.image = [UIImage imageNamed:@"userIcon"];
    _userName.text = @"itzhangbao";
    _userGithub.text = @"https://github.com/itzhangbao";
}


@end

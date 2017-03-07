//
//  TRZXProjectDetailOnLineClassTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/4.
//  Copyright © 2017年 TRZX. All rights reserved.
//  在线课程

#import "TRZXProjectDetailOnLineClassTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailOnLineClassTableViewCell()

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *homeIcon;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation TRZXProjectDetailOnLineClassTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    [self addOwnViews];
    [self layoutFrameOfSubViews];
    
    return self;
}
- (void)addOwnViews
{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.homeIcon];
    [self.contentView addSubview:self.descriptionLabel];
    [self.contentView addSubview:self.bottomLineView];
}

- (void)layoutFrameOfSubViews
{
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.top.equalTo(self.contentView).offset(8);
        make.size.mas_equalTo(CGSizeMake(96, 72));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImageView.mas_bottom).offset(5);
        make.left.right.equalTo(_headImageView);
        make.height.mas_equalTo(15);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImageView.mas_right).offset(8);
        make.top.equalTo(_headImageView);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(_headImageView.mas_centerY).offset(-2);
    }];
    
    [_homeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(13, 12));
        make.left.equalTo(_titleLabel);
        make.centerY.equalTo(_descriptionLabel);
    }];
    
    [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_homeIcon.mas_right).offset(2);
        make.top.equalTo(_titleLabel.mas_bottom);
        make.right.equalTo(_titleLabel);
        make.bottom.equalTo(_headImageView);
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImageView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(_nameLabel.mas_bottom).offset(4.5);
        make.bottom.equalTo(self.contentView);
    }];
    
}

- (void)setModel:(TRZXProjectDetailModel *)model indexPath:(NSIndexPath *)indexPath
{
    _headImageView.image = [UIImage imageNamed:@"testIcon_backGroundImage"];
    
    _nameLabel.text = @"阿拉善";
    
    _titleLabel.text = @"庆历四年春，滕子京谪守巴陵郡";
    if (indexPath.row == 1) {
        _titleLabel.text = @"庆历四年春，滕子京谪守巴陵郡滕子京谪守巴陵郡";
    }
    
    _descriptionLabel.text = @"庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。";
    if (indexPath.row == 2) {
        _descriptionLabel.text = @"庆历四年春，滕子京谪守Z";
    }
}

#pragma mark - <Setter/Getter>
- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
    }
    return _headImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor grayColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)homeIcon
{
    if (!_homeIcon) {
        _homeIcon = [[UIImageView alloc] init];
        _homeIcon.image = [UIImage imageNamed:@"Icon_ProjectDetail_OnlineCalss_HomeIcon"];
    }
    return _homeIcon;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.textColor = [UIColor grayColor];
        _descriptionLabel.font = [UIFont systemFontOfSize:13];
        _descriptionLabel.numberOfLines = 0;
    }
    return _descriptionLabel;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor grayColor];
    }
    return _bottomLineView;
}

@end

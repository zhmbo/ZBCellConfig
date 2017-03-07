//
//  TRZXProjectDetailCommendTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/4.
//  Copyright © 2017年 TRZX. All rights reserved.
//  为你推荐

#import "TRZXProjectDetailCommendTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailCommendTableViewCell()

@property (nonatomic, strong) UIView *leftRedView;

@property (nonatomic, strong) UILabel *commendTitleLabel;

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation TRZXProjectDetailCommendTableViewCell

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
    [self.contentView addSubview:self.leftRedView];
    [self.contentView addSubview:self.commendTitleLabel];
    [self.contentView addSubview:self.bottomLineView];
}

- (void)layoutFrameOfSubViews
{
    [_leftRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(5);
        make.size.mas_equalTo(CGSizeMake(2, 25));
    }];
    
    [_commendTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_leftRedView);
        make.left.equalTo(_leftRedView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftRedView.mas_bottom).offset(5);
        make.height.mas_equalTo(0.5);
        make.left.right.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - <Setter/Getter>
- (UIView *)leftRedView
{
    if (!_leftRedView) {
        _leftRedView = [[UIView alloc] init];
        _leftRedView.backgroundColor = [UIColor redColor];
    }
    return _leftRedView;
}

- (UILabel *)commendTitleLabel
{
    if (!_commendTitleLabel) {
        _commendTitleLabel = [[UILabel alloc] init];
        _commendTitleLabel.textColor = [UIColor grayColor];
        _commendTitleLabel.font = [UIFont boldSystemFontOfSize:15];
        _commendTitleLabel.text = @"为你推荐";
    }
    return _commendTitleLabel;
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

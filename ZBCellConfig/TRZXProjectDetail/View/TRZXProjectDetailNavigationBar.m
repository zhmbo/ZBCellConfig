//
//  TRZXProjectDetailNavigationView.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/2.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailNavigationBar.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailNavigationBar()

/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 返回按钮
 */
@property (nonatomic, strong) UIButton *backButton;

/**
 收藏按钮
 */
@property (nonatomic, strong) UIButton *collectButton;

/**
 分享按钮
 */
@property (nonatomic, strong) UIButton *shareButton;

/**
 底部线
 */
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation TRZXProjectDetailNavigationBar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        
        [self addOwnViews];
        
        [self layoutFrmeOfSubViews];
        
    }
    return self;
}

- (void)addOwnViews
{
    [self addSubview:self.backButton];
    [self addSubview:self.shareButton];
    [self addSubview:self.collectButton];
    [self addSubview:self.bottomLineView];
    [self addSubview:self.titleLabel];
}

- (void)layoutFrmeOfSubViews
{
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.width.mas_equalTo(83);
        make.left.bottom.equalTo(_bottomLineView);
    }];
    
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self).offset(35);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [_collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_shareButton.mas_left).offset(-12);
        make.centerY.equalTo(_shareButton);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH - 200);
        make.height.mas_equalTo(44);
    }];
}

- (void)composeButtonClicked:(UIButton *)sender
{
    if (self.onProjectDetailActionBlock) {
        self.onProjectDetailActionBlock(sender.tag);
    }
    if (sender.tag == ENavigationBarAction_Collect) {
        sender.selected = !sender.isSelected;
    }
}

#pragma mark - <Public-Method>
- (void)makeNavigationBarIsShowWithContentOfsetY:(CGFloat)y
{
    BOOL isShow = y > (kProjectDetailTableViewHeaderViewHeight - kProjectDetailNavigationViewHeight);
    
    CGFloat minOffset = kProjectDetailTableViewHeaderViewHeight - kProjectDetailNavigationViewHeight;
    
    CGFloat progress = (y / minOffset);
    
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:progress];
    
    _titleLabel.hidden = !isShow;
    
    _bottomLineView.hidden = !isShow;
    
    _backButton.selected = isShow;
    
    _shareButton.selected = isShow;
    
    UIImage *collectionNormalImage = [UIImage imageNamed:isShow ? @"Icon_ProjectDetail_Collection_Normal_Gray" : @"Icon_ProjectDetail_Collection_Normal_White"];
    [_collectButton setImage:collectionNormalImage forState:UIControlStateNormal];
}

#pragma mark - <Setter/Getter>
- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithRed:90 /255.0 green:90 /255.0 blue:90 /255.0 alpha:1];
        _titleLabel.numberOfLines             = 0;
        _titleLabel.hidden                    = YES;
        _titleLabel.textAlignment             = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.baselineAdjustment        = UIBaselineAdjustmentAlignCenters;
    }
    return _titleLabel;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Back_Normal"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Back_Selected"] forState:UIControlStateSelected];
        [_backButton setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor grayColor]  forState:UIControlStateSelected];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(14,8,12,63);
        _backButton.titleEdgeInsets = UIEdgeInsetsMake(15,0,11,25);
        _backButton.tag = ENavigationBarAction_Back;
        [_backButton addTarget:self action:@selector(composeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _backButton;
}

- (UIButton *)collectButton
{
    if (!_collectButton) {
        _collectButton = [[UIButton alloc] init];
        [_collectButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Collection_Normal_White"] forState:UIControlStateNormal];
        [_collectButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Collection_Selected"] forState:UIControlStateSelected];
        [_collectButton addTarget:self action:@selector(composeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _collectButton.tag = ENavigationBarAction_Collect;
    }
    return _collectButton;
}

- (UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [[UIButton alloc] init];
        [_shareButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Share_Normal"] forState:UIControlStateNormal];
        [_shareButton setImage:[UIImage imageNamed:@"Icon_ProjectDetail_Share_Selected"] forState:UIControlStateSelected];
        [_shareButton addTarget:self action:@selector(composeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _shareButton.tag = ENavigationBarAction_Share;

    }
    return _shareButton;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = kTRZXBGrayColor;
        _bottomLineView.hidden = YES;
    }
    return _bottomLineView;
}

@end

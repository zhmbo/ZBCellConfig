//
//  TRZXProjectDetailTableViewHeaderView.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailTableViewHeaderView.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailTableViewHeaderView()

@property (nonatomic, strong) UIImageView *backGroundImageView;

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TRZXProjectDetailTableViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addOwnViews];
        
        [self layoutFrameOfSubViews];
        
    }
    return self;
}

- (void)addOwnViews
{
    [self addSubview:self.backGroundImageView];
    [self addSubview:self.headImageView];
    [self addSubview:self.titleLabel];
}

- (void)layoutFrameOfSubViews
{
    [_backGroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.center.equalTo(self);
    }];
    
    _titleLabel.numberOfLines = 0;
    [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH * 0.5);
        make.centerX.equalTo(self);
        make.top.equalTo(_headImageView.mas_bottom).offset(20);
    }];
}

- (void)setCoverImage:(NSString *)coverImage titile:(NSString *)title
{
    _headImageView.image = [UIImage imageNamed:@"testIcon_backGroundImage"];
    
    _titleLabel.text = title;
}

#pragma mark - <Public-Method>
- (void)makeBackGroundImageScaleOfScrollViewDidScroll:(CGFloat)offset
{
    CGRect rect = self.frame;
    rect.origin.y = offset;
    rect.size.height = CGRectGetHeight(rect) - offset;
    self.backGroundImageView.frame = rect;
}

#pragma mark - <Setter/Getter>
- (UIImageView *)backGroundImageView
{
    if (!_backGroundImageView) {
        _backGroundImageView = [[UIImageView alloc] init];
        _backGroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _backGroundImageView.clipsToBounds = YES;
        _backGroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backGroundImageView.image = [UIImage imageNamed:@"testIcon_backGroundImage"];
    }
    return _backGroundImageView;
}

- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.clipsToBounds = YES;
        _headImageView.layer.cornerRadius = 5;
    }
    return _headImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.shadowColor = [UIColor blackColor];
        _titleLabel.shadowOffset = CGSizeMake(0, 1.0);
    }
    return _titleLabel;
}

@end

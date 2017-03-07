//
//  TRZXProjectDetailProjectHistoryTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailProjectHistoryTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailProjectHistoryTableViewCell()

@property (nonatomic, strong) UIView *topShortLineView;

@property (nonatomic, strong) UIImageView *redDotImageView;

@property (nonatomic, strong) UIView *bottomLongLineView;

@property (nonatomic, strong) UILabel *timeLable;

@property (nonatomic, strong) UILabel *describeLabel;

@end

@implementation TRZXProjectDetailProjectHistoryTableViewCell

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
    [self.contentView addSubview:self.topShortLineView];
    [self.contentView addSubview:self.bottomLongLineView];
    [self.contentView addSubview:self.redDotImageView];
    [self.contentView addSubview:self.timeLable];
    [self.contentView addSubview:self.describeLabel];
}

- (void)layoutFrameOfSubViews
{
    [_redDotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.size.mas_equalTo(CGSizeMake(8, 8));
        make.top.equalTo(self.contentView).offset(20);
    }];
    
    [_topShortLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.bottom.centerX.equalTo(_redDotImageView);
        make.top.equalTo(self.contentView);
    }];
    
    [_bottomLongLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(_redDotImageView);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(self.contentView);
    }];
    
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_redDotImageView);
        make.left.equalTo(_redDotImageView.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(25);
    }];
    
    _describeLabel.numberOfLines = 0;
    [_describeLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLable);
        make.top.equalTo(_timeLable.mas_bottom).offset(20);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.right.equalTo(self.contentView).offset(-20);
    }];
}

- (void)setModel:(TRZXProjectDetailModel *)model indexPath:(NSIndexPath *)indexPath
{
    _topShortLineView.hidden = indexPath.row == 0 ? YES : NO;
    
    _timeLable.text = @"2017-12-12";
    
    
    if (indexPath.row == 2) {
        _describeLabel.hidden = YES;
    }else {
        _describeLabel.hidden = NO;
        _describeLabel.text = @"庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之";
        
    }
    
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
//////    [UIView animateWithDuration:1 animations:^{
//        [self layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        
//    }];
    
}

#pragma mark - <Setter/Getter>
- (UIView *)topShortLineView
{
    if (!_topShortLineView) {
        _topShortLineView = [[UIView alloc] init];
        _topShortLineView.backgroundColor = [UIColor grayColor];

    }
    return _topShortLineView;
}

- (UIImageView *)redDotImageView
{
    if (!_redDotImageView) {
        _redDotImageView = [[UIImageView alloc] init];
        _redDotImageView.image = [UIImage imageNamed:@"Icon_ProjectDetail_ProjectHistory_RedDot"];
    }
    return _redDotImageView;
}

- (UIView *)bottomLongLineView
{
    if (!_bottomLongLineView) {
        _bottomLongLineView = [[UIView alloc] init];
        _bottomLongLineView.backgroundColor = [UIColor grayColor];

    }
    return _bottomLongLineView;
}

- (UILabel *)timeLable
{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc] init];
        _describeLabel.font = [UIFont systemFontOfSize:17];
        _describeLabel.textColor = [UIColor grayColor];
    }
    return _timeLable;
}

- (UILabel *)describeLabel
{
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.font = [UIFont systemFontOfSize:15];
        _describeLabel.textColor = [UIColor grayColor];
    }
    return _describeLabel;
}

@end

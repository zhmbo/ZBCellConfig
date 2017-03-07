//
//  TRZXProjectDetailFinancingInfoTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailFinancingInfoTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailFinancingInfoTableViewCellOfSubView : UIView

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TRZXProjectDetailFinancingInfoTableViewCellOfSubView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.detailLabel];
        [self addSubview:self.titleLabel];
        
        _detailLabel.numberOfLines = 0;
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self).offset(6);
        }];
        
        _titleLabel.numberOfLines = 0;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-6);
        }];
        
    }
    return self;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textColor = [UIColor redColor];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _detailLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

@interface TRZXProjectDetailFinancingInfoTableViewCell()

@property (nonatomic, strong) NSMutableArray <TRZXProjectDetailFinancingInfoTableViewCellOfSubView *> *financingInfoSubViews;

@end

@implementation TRZXProjectDetailFinancingInfoTableViewCell

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
    [self.financingInfoSubViews enumerateObjectsUsingBlock:^(TRZXProjectDetailFinancingInfoTableViewCellOfSubView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:subView];
    }];
}

- (void)layoutFrameOfSubViews
{
    CGFloat subViewWeith = SCREEN_WIDTH / 4;
    CGFloat subViewHeight = 70;
    
    NSArray *titleArray = @[@"融资时间", @"融资目标", @"项目自估值", @"出让股权比例"];
    
    [self.financingInfoSubViews enumerateObjectsUsingBlock:^(TRZXProjectDetailFinancingInfoTableViewCellOfSubView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 添加约束
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(20);
            make.left.equalTo(self.contentView).offset(idx * subViewWeith);
            make.size.mas_equalTo(CGSizeMake(subViewWeith, subViewHeight));
            make.bottom.equalTo(self.contentView).offset(-20);
        }];
        
        if (idx > 0) {
            // 创建分割线
            [[self lineView] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(subView);
                make.width.mas_equalTo(0.7);
                make.left.equalTo(subView);
            }];
        }
        
        subView.titleLabel.text = titleArray[idx];
        
    }];
    
}

- (UIView *)lineView
{
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineView];
    return lineView;
}

#pragma mark - <Setter/Getter>
- (void)setModel:(TRZXProjectDetailModel *)model
{
    _model = model;
    
    NSArray *subViewDetailStrings = @[@"2014-12-12/2016-12-59", @"￥22222万", @"￥35145.7万", @"22.8%"];
    
    [_financingInfoSubViews enumerateObjectsUsingBlock:^(TRZXProjectDetailFinancingInfoTableViewCellOfSubView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        subView.detailLabel.text = subViewDetailStrings[idx];
    }];
    
}

- (NSMutableArray<TRZXProjectDetailFinancingInfoTableViewCellOfSubView *> *)financingInfoSubViews
{
    if (!_financingInfoSubViews) {
        _financingInfoSubViews = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            [_financingInfoSubViews addObject:[TRZXProjectDetailFinancingInfoTableViewCellOfSubView new]];
        }
    }
    return _financingInfoSubViews;
}

@end

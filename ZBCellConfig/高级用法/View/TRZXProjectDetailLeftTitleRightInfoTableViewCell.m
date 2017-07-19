//
//  TRZXLeftTitleRightInfoTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailLeftTitleRightInfoTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailLeftTitleRightInfoTableViewCell()

@property (nonatomic, strong) UIView *leftRedView;

@property (nonatomic, strong) UILabel *leftTitleLabel;

@property (nonatomic, strong) UILabel *rightInfoLabel;

@end

@implementation TRZXProjectDetailLeftTitleRightInfoTableViewCell

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
    [self.contentView addSubview:self.leftTitleLabel];
    [self.contentView addSubview:self.rightInfoLabel];
}

- (void)layoutFrameOfSubViews
{
    [_leftRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.centerY.equalTo(_leftTitleLabel);
        make.height.equalTo(self.contentView).multipliedBy(0.5);
        make.width.mas_equalTo(2);
    }];
    
    [_leftTitleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftRedView.mas_right).offset(4);
        make.top.equalTo(self.contentView).offset(4);
        make.bottom.equalTo(self.contentView).offset(-10);
//        make.width.mas_equalTo(100);
    }];
    
    _rightInfoLabel.numberOfLines = 0;
//    [_rightInfoLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_rightInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftTitleLabel.mas_right).offset(30);
        make.top.equalTo(self.contentView).offset(4);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.right.equalTo(self.contentView).offset(-5);
    }];
    
}

- (void)setModel:(TRZXProjectDetailModel *)model indexPath:(NSIndexPath *)indexPath
{
    NSString *leftTitleString = @"";
    NSString *rightInfoString = @"";
    
    switch (indexPath.row) {
        case 0:
            leftTitleString = @"公司名称";
            rightInfoString = @"测试待填asf撒ssdf 地方阿斯蒂芬大写拉升";

            break;
        case 1:
            leftTitleString = @"所属行业";
            rightInfoString = @"测斯蒂芬大写拉升";

            break;
        case 2:
            leftTitleString = @"公司地址";
            rightInfoString = @"测试待填asf撒ssdf 地方阿斯蒂芬大写拉升";

            break;
        case 3:
            leftTitleString = @"融资阶段";
            rightInfoString = @"测f 地方阿斯蒂芬大写拉升";

            break;
        case 4:
            leftTitleString = @"启动时间";
            rightInfoString = @"测试待填蒂芬大写拉升";

            break;
            
        default:
            break;
    }
    
    _leftTitleLabel.text = leftTitleString;
    
    _rightInfoLabel.text = rightInfoString;
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:_leftTitleLabel.font forKey:NSFontAttributeName];
    CGRect bounds = [leftTitleString boundingRectWithSize:CGSizeMake(0, _leftTitleLabel.frame.size.height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    
    [_leftTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(bounds.size.width);
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

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
        _leftTitleLabel = [[UILabel alloc] init];
        _leftTitleLabel.font = [UIFont systemFontOfSize:15];
        _leftTitleLabel.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1];
    }
    return _leftTitleLabel;
}

- (UILabel *)rightInfoLabel
{
    if (!_rightInfoLabel) {
        _rightInfoLabel = [[UILabel alloc] init];
        _rightInfoLabel.font = [UIFont systemFontOfSize:15];
        _rightInfoLabel.textColor = [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];
    }
    return _rightInfoLabel;
}

@end

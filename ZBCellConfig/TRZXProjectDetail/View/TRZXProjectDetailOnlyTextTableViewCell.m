//
//  TRZXProjectDetailOnlyTextTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/3.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailOnlyTextTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailOnlyTextTableViewCell()

@property (nonatomic, strong) UILabel *aDetailTextLabel;

@end

@implementation TRZXProjectDetailOnlyTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    [self.contentView addSubview:self.aDetailTextLabel];
    
    _aDetailTextLabel.numberOfLines = 0;
    [_aDetailTextLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_aDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    return self;
}

- (void)setModel:(TRZXProjectDetailModel *)model
{
    _model = model;
    
    _aDetailTextLabel.text = @"　庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。(具 通：俱)\n予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎?";
}

#pragma mark - <Setter/Getter>
- (UILabel *)aDetailTextLabel
{
    if (!_aDetailTextLabel) {
        _aDetailTextLabel = [[UILabel alloc] init];
        _aDetailTextLabel.textColor = [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];
        _aDetailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    return _aDetailTextLabel;
}

@end

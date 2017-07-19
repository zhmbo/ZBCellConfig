//
//  TRZXProjectDetailnvestTableViewCell.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/4.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailnvestTableViewCell.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailnvestTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *qualeLabel;
@property (weak, nonatomic) IBOutlet UILabel *comanyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *domainLabel;
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UIView  *bottomLineView;

@end

@implementation TRZXProjectDetailnvestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.size.mas_equalTo(CGSizeMake(79, 79));
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImageView.mas_right).offset(10);
        make.top.equalTo(_headImageView);
        make.height.mas_equalTo(16);
    }];
    
    [_qualeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_qualeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_nameLabel.mas_bottom);
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(_nameLabel.mas_right);
    }];
    
    [_comanyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(3);
        make.left.equalTo(_nameLabel);
        make.right.equalTo(_qualeLabel);
        make.height.mas_equalTo(33);
    }];
    
    [_domainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_comanyNameLabel.mas_bottom).offset(3);
        make.left.right.equalTo(_comanyNameLabel);
        make.height.mas_equalTo(10);
    }];
    
    [_sectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_domainLabel.mas_bottom).offset(4);
        make.left.right.equalTo(_domainLabel);
        make.height.mas_equalTo(10);
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sectionLabel.mas_bottom).offset(9);
        make.left.equalTo(_headImageView);
        make.right.equalTo(_qualeLabel);
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)setModel:(TRZXProjectDetailModel *)model indexPath:(NSIndexPath *)indexPath
{
    _headImageView.image = [UIImage imageNamed:@"testIcon_backGroundImage"];
    
    _nameLabel.text = @"项目名称";
    
    _comanyNameLabel.text = @"杭州天湾投资管理有限公司（北京分公司）";
    
    _qualeLabel.text = @"董事长";
}

@end

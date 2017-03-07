//
//  TRZXProjectDetailLeftRedTitleSectionView.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/6.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailLeftRedTitleSectionHeaderView.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailLeftRedTitleSectionHeaderView()
@property (weak, nonatomic) IBOutlet UIView *backgroudView;
@property (weak, nonatomic) IBOutlet UIImageView *leftRedImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation TRZXProjectDetailLeftRedTitleSectionHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [_backgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_leftRedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(4);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(5, 14));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftRedImageView.mas_right).offset(6);
        make.top.bottom.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}

@end

//
//  TRZXProjectDetailTitleSectionView.m
//  TRZXProjectDetail
//
//  Created by zhangbao on 2017/3/6.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXProjectDetailTitleSectionHeaderView.h"
#import "TRZXProjectDetailMacro.h"

@interface TRZXProjectDetailTitleSectionHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation TRZXProjectDetailTitleSectionHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self).offset(10);
//        make.height.mas_equalTo(0); header 最小值为1 想要header = 0 自适应待解决
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}

@end

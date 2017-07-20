//
//  HeightTableViewCell2.m
//  ZBCellConfig
//
//  Created by zhangbao on 2017/7/20.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "HeightTableViewCell2.h"

@implementation HeightTableViewCell2

{
    UILabel *_aTextLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *aTextLabel = [[UILabel alloc] init];
        aTextLabel.textColor = [UIColor colorWithRed:0.51 green:0.53 blue:0.59 alpha:1.00];
        aTextLabel.font = [UIFont systemFontOfSize:15];
        aTextLabel.numberOfLines = 0;
        [self.contentView addSubview:aTextLabel];
        _aTextLabel = aTextLabel;
        
        [_aTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return self;
}

- (void)setModel:(HeightModel *)model
{
    _model = model;
    
    NSLog(@"【CELL 2】 成功获取到数据！");
    
    _aTextLabel.text = @"• ZBCellConfig 对象实例会将 tableView 中 cell 所需的基本信息存储下来，然后放到数组中进行管理；\n• 每个 ZBCellConfig 实例与 tableView 中想要显示的 cell 相对应。（但注意，是""想要显示的""cell，由于cell的重用，实际上cell并不会生成那么多）\n* 优点：改变不同类型cell的顺序、增删时，极为方便，只需改变用于存放 ZBCellConfig 的数组即可，\n• 重点是无需在多个tableView代理方法中逐个修改。";
    
}


@end

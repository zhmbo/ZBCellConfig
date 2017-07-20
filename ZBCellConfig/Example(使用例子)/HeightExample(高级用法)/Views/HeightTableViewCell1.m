//
//  HeightTableViewCell1.m
//  ZBCellConfig
//
//  Created by zhangbao on 2017/7/20.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "HeightTableViewCell1.h"

@implementation HeightTableViewCell1
{
    UIImageView *_aImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *aImageView = [[UIImageView alloc] init];
        aImageView.contentMode = UIViewContentModeScaleAspectFill;
        aImageView.clipsToBounds = YES;
        [self.contentView addSubview:aImageView];
        _aImageView = aImageView;
        
#warning AutoLayout 约束要满足规定方式才能配合tableView 的 estimatedRowHeight，实现 cell 的自适应
        /**
         * 给 cell 添加约束
         * 这里注意 约束必须距让 cell 知道 他的上左下右分别时多少，然后每部控件指定高度
         * 像下面这样约束 cell 就达到自适应高度了，无需在 tableView 的代理中返回具体的值。
         * 约束用 masonry 和 xib托线 的布局效果是一样的
         */
        [_aImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
            make.height.mas_equalTo(150);
        }];
    }
    return self;
}

- (void)setModel:(HeightModel *)model
{
    _model = model;
    
    NSLog(@"【CELL 1】 成功获取到数据！");
    
    _aImageView.image = [UIImage imageNamed:@"background"];
}

@end

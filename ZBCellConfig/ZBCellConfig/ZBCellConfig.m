//
//  ZBCellConfig.m
//  ZBCellConfig
//
//  Created by zhangbao on 2017/3/4.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "ZBCellConfig.h"

//判断selector有几个参数
//static NSUInteger SelectorArgumentCount(SEL selector)
//{
//    NSUInteger argumentCount = 0;
//    //sel_getName获取selector名的C字符串
//    const char *selectorStringCursor = sel_getName(selector);
//    char ch;
//    //    遍历字符串有几个:来确定有几个参数
//    while((ch = *selectorStringCursor)) {
//        if(ch == ':') {
//            ++argumentCount;
//        }
//        ++selectorStringCursor;
//    }
//    
//    return argumentCount;
//}

@interface  NSObject(ZBPerformingObjects)
- (void)zb_performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end

@implementation NSObject(ZBPerformingObjects)

- (void)zb_performSelector:(SEL)aSelector withObjects:(NSArray *)objects
{
    // 签名
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    if (signature == nil) {
        NSAssert(false, @"LINE=%d ERROR - 找不到 %@ 方法", __LINE__ ,NSStringFromSelector(aSelector));
    }
    // 包装
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    // 设置调用者
    [invocation setTarget:self];
    // 设置调用的方法 与 NSMethodSignature 签名的方法一致
    [invocation setSelector:aSelector];
    // 0为target 1为_cmd 所以从2索引
    for (int i = 0; i < (signature.numberOfArguments - 2); i++) {
        id dataModel = i < objects.count ? objects[i] : nil;
        [invocation setArgument:&dataModel atIndex:i+2];
    }
    // retain 所有参数，防止释放
    [invocation retainArguments];
    [invocation invoke];
}

@end

@implementation ZBCellConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _sectionHeaderHeight = 0;
        
        _sectionFooterHeight = 0;
        
    }
    return self;
}

#pragma mark - <Public-Method>
// 便利构造器
+ (instancetype)cellConfigWithClass:(Class)cellClass
                 showCellInfoMethod:(SEL)showCellInfoMethod
{
    return [self cellConfigWithClass:cellClass sectionHeaderClass:nil showCellInfoMethod:showCellInfoMethod showSectionHeaderInfoMethod:nil];
}

+ (instancetype)cellConfigWithClass:(Class)cellClass
                 sectionHeaderClass:(Class)sectionHeaderClass
                 showCellInfoMethod:(SEL)showCellInfoMethod
        showSectionHeaderInfoMethod:(SEL)showSectionHeaderInfoMethod
{
    return [self cellConfigWithClass:cellClass sectionHeaderClass:sectionHeaderClass sectionFooterClass:nil showCellInfoMethod:showCellInfoMethod showSectionHeaderInfoMethod:showSectionHeaderInfoMethod showSectionFooterInfoMethod:nil];
}

+ (instancetype)cellConfigWithClass:(Class)cellClass
                 sectionHeaderClass:(Class)sectionHeaderClass
                 sectionFooterClass:(Class)sectionFooterClass
                 showCellInfoMethod:(SEL)showCellInfoMethod
        showSectionHeaderInfoMethod:(SEL)showSectionHeaderInfoMethod
        showSectionFooterInfoMethod:(SEL)showSectionFooterInfoMethod
{
    
    ZBCellConfig *cellConfig = [[ZBCellConfig alloc] init];
    
    cellConfig.cellClass = cellClass;
    
    cellConfig.sectionHeaderClass = sectionHeaderClass;
    
    cellConfig.sectionFooterClass = sectionFooterClass;
    
    cellConfig.showCellInfoMethod = showCellInfoMethod;
    
    cellConfig.showSectionHeaderInfoMethod = showSectionHeaderInfoMethod;
    
    cellConfig.showSectionFooterInfoMethod = showSectionFooterInfoMethod;
    
    return cellConfig;
}


// 根据 cellConfig 生成 cell
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                        dataModels:(NSArray *)dataModels
{
    return [self cellOfCellConfigWithTableView:tableView dataModels:dataModels isNib:NO];
}

// 根据 cellConfig 生成 cell ,可使用 Nib
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                        dataModels:(NSArray *)dataModels
                                             isNib:(BOOL)isNib
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (!cell) {
        
        // 加载nib的方法
        if (isNib && [self.cellClass isSubclassOfClass:[UITableViewCell class]]) {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.cellClass) owner:nil options:nil];
            
            for (id obj in nibs) {
                if ([obj isKindOfClass: self.cellClass]) {
                    cell = obj;
                }
            }
            
            if (!cell) {
                NSLog(@"Please Check Nib File About %@", NSStringFromClass(self.cellClass));
            }
            
        } else {
            
            cell = [[self.cellClass?:[UITableViewCell class] alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.cellIdentifier];
            
        }
    }
    
    // 执行 cell 赋值函数
    if (self.showCellInfoMethod && [cell respondsToSelector:self.showCellInfoMethod]) {
        
        [cell zb_performSelector:self.showCellInfoMethod withObjects:dataModels];
    }
    
    return cell;
}

// 根据 cellConfig 生成 sectionHeaderView
- (UITableViewHeaderFooterView *)sectionHederOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels
{
    return [self sectionHederOfCellConfigWithTableView:tableView dataModels:dataModels isNib:NO];
}

// 根据 cellConfig 生成 sectionHeaderView ,可用 Nib
- (UITableViewHeaderFooterView *)sectionHederOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels
                                                                 isNib:(BOOL)isNib
{
    return [self sectionHeaderFooterOfCellConfigWithTableView:tableView identifier:self.sectionHeaderIdentfier class:self.sectionHeaderClass showSectionHeaderFooterInfoMethod:self.showSectionHeaderInfoMethod dataModels:dataModels isNib:isNib];
}

// 根据 cellConfig 生成 sectionFooterView
- (UITableViewHeaderFooterView *)sectionFooterOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels
{
    return [self sectionFooterOfCellConfigWithTableView:tableView dataModels:dataModels isNib:NO];
}

// 根据 cellConfig 生成 sectionFooterView ,可用 Nib
- (UITableViewHeaderFooterView *)sectionFooterOfCellConfigWithTableView:(UITableView *)tableView
                                                            dataModels:(NSArray *)dataModels
                                                                 isNib:(BOOL)isNib
{
    return [self sectionHeaderFooterOfCellConfigWithTableView:tableView identifier:self.sectionFooterIdentfier class:self.sectionFooterClass showSectionHeaderFooterInfoMethod:self.showSectionFooterInfoMethod dataModels:dataModels isNib:isNib];
}

// 根据 cell 类 比较是否是当前 cellConfig
- (BOOL)isIdentiFier:(Class)class
{
    return [self.cellIdentifier isEqualToString:NSStringFromClass(class)];
}

// 根据 cell 类 比较是否是当前 cellConfig
- (BOOL)isTitle:(NSString *)title
{
    return [self.title isEqualToString:title];
}

#pragma mark - <Private-Method>
- (UITableViewHeaderFooterView *)sectionHeaderFooterOfCellConfigWithTableView:(UITableView *)tableView identifier:(NSString *)identifier class:(Class)class showSectionHeaderFooterInfoMethod:(SEL)method dataModels:(NSArray *)dataModels isNib:(BOOL)isNib
{
    UITableViewHeaderFooterView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (!headerFooterView) {
        
        // 加载nib的方法
        if (isNib && [class isSubclassOfClass:[UITableViewHeaderFooterView class]]) {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(class) owner:nil options:nil];
            
            for (id obj in nibs) {
                if ([obj isKindOfClass:class]) {
                    headerFooterView = obj;
                }
            }
            
            if (!headerFooterView) {
                NSLog(@"Please Check Nib File About %@", NSStringFromClass(class));
            }
            
        } else {
            
            headerFooterView = [[class?:[UITableViewHeaderFooterView class] alloc] initWithReuseIdentifier:identifier];
            
        }
    }
    
    // 执行 sectionHeader 赋值函数
    if (method && [headerFooterView respondsToSelector:method]) {
        
        [headerFooterView zb_performSelector:self.showSectionHeaderInfoMethod withObjects:dataModels];
    }
    
    return headerFooterView;
}

#pragma mark - <Setter/Getter>
- (NSString *)cellIdentifier
{
    if (!_cellIdentifier) {
        _cellIdentifier = NSStringFromClass(self.cellClass);
    }
    return _cellIdentifier;
}

- (NSString *)sectionHeaderIdentfier
{
    if (!_sectionHeaderIdentfier) {
        _sectionHeaderIdentfier = NSStringFromClass(self.sectionHeaderClass);
    }
    return _sectionHeaderIdentfier;
}

- (NSString *)sectionFooterIdentfier
{
    if (!_sectionFooterIdentfier) {
        _sectionFooterIdentfier = NSStringFromClass(self.sectionFooterClass);
    }
    return _sectionFooterIdentfier;
}

@end



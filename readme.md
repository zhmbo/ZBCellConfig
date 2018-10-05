![](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/ZBCellConfig.png)

> 当一个 tableView 中的 cell 类型过多时，我们务必会在 tableView 的各个代理中做这样那样的判断，当需要增加一种 cell，或调换 cell 的顺序的时候我们就会在 tableView 的各个代理中进行修改判断。
> 使用 ***ZBCellConfig*** 可以应对各种变态需求，当增删、调换 cell 的顺序时，只需一键配置。

# 简介
* ZBCellConfig 对象实例会将 tableView 中 cell 所需的基本信息存储下来，然后放到数组中进行管理；
* 每个 ZBCellConfig 实例与 tableView 中想要显示的 cell 相对应。（但注意，是"想要显示的"cell，由于cell的重用，实际上cell并不会生成那么多）；
* 优点：改变不同类型 cell 的顺序、增删时，极为方便，只需改变用于存放 ZBCellConfig 的数组即可，** 重点是无需在多个tableView代理方法中逐个修改 **。

## 结构
![目录结构](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/目录结构.png)

## 使用
- 支持 cocoapods 导入  `pod  'ZBCellConfig'`
- 直接讲文件拖拽到项目中 `#import "ZBCellConfig.h"`

## 知识点
> 请下载示例项目查看详细使用方法及实际中如何使用 [GitHub下载地址](https://github.com/itzhangbao/ZBCellConfig)。
> 初、中、高、高 MVVM 内容上是一样的，区别在于没一级别知识点递增。

![Demo 展示](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/Demo示例.png)

### 知识点 - 基本使用
1 . 首先在控制器中声明存放 ZBCellConfig 实例的二维数组

```
/**
* 二维数组 (匹配 tableView 的数据结构，第一层是 section，第二层放 cell)
*/
@property (nonatomic, strong) NSMutableArray <NSArray <ZBCellConfig *> *> * cellConfigs;
```

2-1 . 初始化数组，每一个 ZBCellConfig 为 cell 的基本信息，改变不同类型cell的顺序、增删时，只需在此修改即可，无需在多个tableView代理方法中逐个修改(具体查看 Demo 注释很清晰)

```
-  (NSMutableArray<NSArray<ZBCellConfig *> *> *)cellConfigs {
    _cellConfigs = [[NSMutableArray alloc] init];
    // cell1
    ZBCellConfig *cell1Config = [ZBCellConfig cellConfigWithClass:[LowTableViewCell1 class] showCellInfoMethod:@selector(setModel:)];
    [_cellConfigs addObject:@[cell1Config]];
    // cell2
    ZBCellConfig *cell2Config = [ZBCellConfig cellConfigWithClass:[LowTableViewCell1 class] showCellInfoMethod:@selector(setModel:)];
    [_cellConfigs addObject:@[cell2Config]];
    // cell3
    ....
    return _cellConfigs;
}
```
2-2 . 增删只需这样：

![增删操作.gif](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/增删操作.gif)
![效果图.gif](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/增删效果.gif)

3 . tableView 代理中实现部分

```
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellConfigs.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellConfigs[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据 indexPath 获取 对应的 cellConfig
    ZBCellConfig *cellConfig = self.cellConfigs[indexPath.section][indexPath.row];

    // 根据对应的 cellConfig 获取 cell，并给 cell 赋值 根据模型显示。
    // • dataModels: 这里由于为示例代码不是用真实数据，只起到 执行 cell 的赋值函数。在实际项目中应该传递从网络请求的真实数据。
    UITableViewCell *cell = [cellConfig cellOfCellConfigWithTableView:tableView dataModels:@[[LowModel new]]];

    return cell;
}
```

### 知识点 - cell 自适应高度

1 . tableView 设置如下 
```
/**
* default is 0, which means there is no estimate
* estimatedRowHeight 默认为 0，不估算cell高度
* 赋值不为 0 时候，开启cell估值配合 layout 约束，进行cell高度自适应
* 也就是说想要自动布局 cell 高度就给这个 estimatedRowHeight 属性赋值，值为你所有 cell 的平均高度的一个估值
*/
_heightTableView.estimatedRowHeight = 100;
// iOS8 系统中 rowHeight 的默认值已经设置成了 UITableViewAutomaticDimension
_heightTableView.rowHeight = UITableViewAutomaticDimension;
```

2 . cell 需采用 AutoLayout 布局，masory 或 xib 托线的形式皆可，约束规定上左下右还有让 cell 知道内容的高：
![AutoLayout约束](https://github.com/itzhangbao/ZBCellConfig/blob/master/ZBCellConfig/约束.png)

### 知识点 - tableView style
1. UITableViewStylePlain 和 UITableViewStyleGrouped 区别
2. UITableViewStylePlain：sectionView 当 tableView cectionHeader/Footer 会默认高度为0， 滑动到顶部时 会停留到导航栏底部
3. UITableViewStyleGrouped：sectionView 当 tableView cectionHeader/Footer 会默认高度为10， 滑动到顶部时 不会停留到导航栏底部
4. 注意：当需要 为 UITableViewStyleGrouped 时查看【MediaExample使用示例】

### 知识点 - ZBCellConfig
通过函数 `- (void)zb_performSelector:(SEL)aSelector withObjects:(NSArray *)objects`来执行 初始化时配置好的`showCellInfoMethod`。
此函数是对 `- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;`的一个扩展，以数组的形式来传递多参数。
函数实现部分：

```
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
```

# 总结
> 把将要展示的几种 cell的基本信息 以 tableView 的数据结构二维数组的形式存放，储存基本配置并不会生成多余的 cell，内部创建采用 tableView 的重用机制。示例 Demo 中注释详细。
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.
i am jumbo.

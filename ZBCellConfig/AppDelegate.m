//
//  AppDelegate.m
//  ZBCellConfig
//
//  Created by ZHANG BAO on 2017/3/7.
//  Copyright © 2017年 itzhangbao. All rights reserved.
//

#import "AppDelegate.h"
#import "ZBRootViewController.h"


@interface ZBNavigationViewController : UINavigationController

@end

@implementation ZBNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化导航
    [self setUpNavBar];
}

// 初始化导航
- (void)setUpNavBar
{
    // 是否透明
    self.navigationBar.translucent = NO;
    
    //Nav文字属性
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithWhite:0.0f alpha:1.0f];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor blackColor],
                                                           NSShadowAttributeName: [[NSShadow alloc] init],
                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:17]
                                                           }];
    
    // Nav Item 文字属性
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:17],NSFontAttributeName , nil] forState:0];
    
    // 标题颜色
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
    // Nav背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    // 返回按钮图片
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_indicator"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_indicator"]];
    
    // 解决 push/pop 导航栏黑色阴影问题
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    
}


/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        
        if ([viewController isKindOfClass:NSClassFromString(@"UIViewController")]) {
            
        }else{
            
            
        }
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 设置控制器背景颜色
    viewController.view.backgroundColor = [UIColor grayColor];
    
    // 设置左侧返回按钮
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                                       style:UIBarButtonItemStylePlain
                                                                                      target:nil action:nil];;
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setUpKeyWindow];
    return YES;
}

- (void)setUpKeyWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ZBNavigationViewController alloc] initWithRootViewController:[ZBRootViewController new]];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end


//
//  XZHNavigationController.m
//  XZHImageBrowser
//
//  Created by ycmedia_imac on 16/8/4.
//  Copyright © 2016年 何紫璇. All rights reserved.
//

#import "XZHNavigationController.h"

@interface XZHNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XZHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 清空手势代理，然后就会重新出现手势移除控制器的功能
    self.interactivePopGestureRecognizer.delegate = self;
}

+ (void)initialize{
    // 取出appearance对象，appearance一般是全部改变
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = [UIColor whiteColor];
    // 设置背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count > 0){
        viewController.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" highIcon:@"back" target:self action:@selector(back)];
    }
//    RXLog(@"导航是=====%@", viewController);
    [super pushViewController:viewController animated:YES];
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated{
    NSArray *arr = [super popToRootViewControllerAnimated:animated];
    return arr;
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果只有一个子控制器, 就禁止掉pop手势
    //    if (self.childViewControllers.count == 1) return NO;
    //    return YES;
    //    NSLog(@"当前控制器的子控制器个数是%@", self.childViewControllers);
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    //    RXLog(@"控制器是%@", self.topViewController);
    return self.childViewControllers.count > 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

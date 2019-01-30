//
//  BaseViewController.m
//  SurveyManagement
//
//  Created by Destiny on 2018/6/14.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setBackButtonHidden];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 设置导航颜色
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navi_bg"]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

/**
 *  自定义返回按钮
 */
- (void)initCustomNavigationItem
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0 , 55, 44);
    [button setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onGoBack:) forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    //在自定义leftBarButtonItem后添加下面代码就可以完美解决返回手势无效的情况
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}


/**
 导航增加右按钮

 @param rightImg 按钮图片
 @param rightAction 按钮事件
 */
- (void)setupNavigationRightItem:(UIImage *)rightImg  rightAction:(SEL)rightAction
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0 , 55, 44);
    [button setImage:rightImg forState:UIControlStateNormal];
    [button addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)setBackButtonHidden
{
    if (self.navigationController.viewControllers.count > 1) {
        [self initCustomNavigationItem];
    }
    else if ([_VCModal isEqualToString:@"present"]) {
         [self initCustomNavigationItem];
    }
}

- (void)onGoBack:(UIButton *)sender {
    if ([_VCModal isEqualToString:@"present"]) {
       [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
         [self onGoBack];
    }
}

- (void)onGoBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

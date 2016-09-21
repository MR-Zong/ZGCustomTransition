//
//  ViewController.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/18.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGNavigationController.h"
#import "ZGNavigationController.h"
#import "ZGTestViewController.h"

#import "ZGViewControllerAnimatedTransitioning.h"
#import "ZGTestAnimatedTransitioningViewController.h"
#import "ZGViewControllerDismissAnimatedTransitioning.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ZGViewControllerAnimatedTransitioning *animatedTransitioning;
@property (nonatomic, strong) ZGViewControllerDismissAnimatedTransitioning *dismissAanimatedTransitioning;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"自定义转场";
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"ios7之前自定义转场样例" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(10, 150, 200, 40);
    [btn1 addTarget:self action:@selector(didBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"ios7之后自定义转场样例" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(10, CGRectGetMaxY(btn1.frame) + 10, 200, 40);
    [btn2 addTarget:self action:@selector(didBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"系统自带push" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.frame = CGRectMake(CGRectGetMaxX(btn1.frame) + 10, 150, 100, 40);
    [btn3 addTarget:self action:@selector(didBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];

}


- (void)didBtn1:(UIButton *)btn
{
    ZGTestViewController *vc = [[ZGTestViewController alloc] init];
    
    //     自定义转场样例
    ZGNavigationController *zgNavigationController = (ZGNavigationController *)self.navigationController.parentViewController;
    [zgNavigationController pushFromViewController:self.navigationController toViewController:vc];
}

- (void)didBtn2:(UIButton *)btn
{
    ZGTestAnimatedTransitioningViewController *vc = [[ZGTestAnimatedTransitioningViewController alloc] init];
    vc.transitioningDelegate = self;
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    nav.transitioningDelegate = self;
//     UINavigationController转场
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didBtn3:(UIButton *)btn
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    //     UINavigationController转场
    [self.navigationController pushViewController:vc animated:YES];
}
     

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animatedTransitioning;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAanimatedTransitioning;
}


#pragma mark - getter
- (ZGViewControllerAnimatedTransitioning *)animatedTransitioning
{
    if (!_animatedTransitioning) {
        _animatedTransitioning = [[ZGViewControllerAnimatedTransitioning alloc] init];
    }
    return _animatedTransitioning;
}

- (ZGViewControllerDismissAnimatedTransitioning *)dismissAanimatedTransitioning
{
    if (!_dismissAanimatedTransitioning) {
        _dismissAanimatedTransitioning = [[ZGViewControllerDismissAnimatedTransitioning alloc] init];
    }
    return _dismissAanimatedTransitioning;
}

@end

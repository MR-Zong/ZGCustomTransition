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
#import "ZGTestInteractiveTransitioningViewController.h"

#import "ZGViewControllerAnimatedTransitioning.h"
#import "ZGTestAnimatedTransitioningViewController.h"
#import "ZGViewControllerDismissAnimatedTransitioning.h"
#import "ZGViewControllerInteractiveTransitioning.h"

typedef NS_ENUM(NSInteger,ZGTransitionStyle){
    ZGTransitionStylePush,
    ZGTransitionStyleBeforeIOS7,
    ZGTransitionStyleAfterIOS7,
    ZGTransitionStyleAfterIOS7Interactive
};

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ZGViewControllerAnimatedTransitioning *animatedTransitioning;
@property (nonatomic, strong) ZGViewControllerDismissAnimatedTransitioning *dismissAanimatedTransitioning;
@property (nonatomic, strong) ZGViewControllerInteractiveTransitioning *interactiveTransitioning;

@property (nonatomic, assign) ZGTransitionStyle transitionStyle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"自定义转场";
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn1 setTitle:@"ios7之前自定义转场样例" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(10, 150, 250, 40);
    [btn1 addTarget:self action:@selector(didBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn2 setTitle:@"ios7之后自定义转场样例" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(10, CGRectGetMaxY(btn1.frame) + 10, 250, 40);
    [btn2 addTarget:self action:@selector(didBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn3 setTitle:@"iOS7之后自定义交互式转场" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.frame = CGRectMake(10, CGRectGetMaxY(btn2.frame) + 10, 250, 40);
    [btn3 addTarget:self action:@selector(didBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn4 setTitle:@"系统自带push" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(10, CGRectGetMaxY(btn3.frame) + 10, 200, 100);
    [btn4 addTarget:self action:@selector(didBtn4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];

}


- (void)didBtn1:(UIButton *)btn
{
    self.transitionStyle = ZGTransitionStyleBeforeIOS7;
    ZGTestViewController *vc = [[ZGTestViewController alloc] init];
    
    //     自定义转场样例
    ZGNavigationController *zgNavigationController = (ZGNavigationController *)self.navigationController.parentViewController;
    [zgNavigationController pushFromViewController:self.navigationController toViewController:vc];
}

- (void)didBtn2:(UIButton *)btn
{
    self.transitionStyle = ZGTransitionStyleAfterIOS7;
    ZGTestAnimatedTransitioningViewController *vc = [[ZGTestAnimatedTransitioningViewController alloc] init];
    vc.transitioningDelegate = self;
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    nav.transitioningDelegate = self;
//     UINavigationController转场
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didBtn3:(UIButton *)btn
{
    self.transitionStyle = ZGTransitionStyleAfterIOS7Interactive;
    ZGTestInteractiveTransitioningViewController *vc = [[ZGTestInteractiveTransitioningViewController alloc] init];
    vc.transitioningDelegate = self;
    [self.interactiveTransitioning prepareWithViewController:vc];
    //     UINavigationController转场
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didBtn4:(UIButton *)btn
{
    self.transitionStyle = ZGTransitionStylePush;
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

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    if (self.transitionStyle == ZGTransitionStyleAfterIOS7Interactive) {
        return self.interactiveTransitioning;
    }
    return nil;
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

- (ZGViewControllerInteractiveTransitioning *)interactiveTransitioning
{
    if (!_interactiveTransitioning) {
        _interactiveTransitioning = [[ZGViewControllerInteractiveTransitioning alloc] init];
    }
    return _interactiveTransitioning;
}

@end

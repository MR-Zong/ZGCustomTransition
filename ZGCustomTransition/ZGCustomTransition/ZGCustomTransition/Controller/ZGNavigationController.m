//
//  ZGTransitionContainController.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/18.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGNavigationController.h"


static ZGNavigationController *_shareNavigationController_;
@interface ZGNavigationController ()

@end

@implementation ZGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


+ (instancetype)shareNavigationController
{
    if (!_shareNavigationController_) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _shareNavigationController_ = [[ZGNavigationController alloc] init];
        });
    }
    
    return _shareNavigationController_;
}

- (void)pushFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    [self addChildViewController:toVC];
    [self.view addSubview:toVC.view];
    [toVC willMoveToParentViewController:self];
    
    [self transitionFromViewController:fromVC toViewController:toVC duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        ;;
    } completion:^(BOOL finished) {
//        [fromVC.view removeFromSuperview];
//        [fromVC removeFromParentViewController];
        [toVC didMoveToParentViewController:self];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

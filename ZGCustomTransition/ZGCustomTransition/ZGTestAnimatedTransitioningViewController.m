//
//  ZGTestAnimatedTransitioningViewController.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/20.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGTestAnimatedTransitioningViewController.h"

@interface ZGTestAnimatedTransitioningViewController ()

@end

@implementation ZGTestAnimatedTransitioningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setupViews];
}

- (void)setupViews
{
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setTitle:@"close" forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10, 150, 100, 40);
    [closeButton addTarget:self action:@selector(didCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}

- (void)didCloseButton:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  ZGTestViewController.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/19.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGTestViewController.h"
#import "ZGNavigationController.h"

@interface ZGTestViewController ()

@end

@implementation ZGTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 150, 100, 40);
    [btn setTitle:@"close" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)didBtn:(UIButton *)btn
{
   ZGNavigationController *zgNavigationController = (ZGNavigationController *)self.parentViewController;
    [zgNavigationController popViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

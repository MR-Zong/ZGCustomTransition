//
//  ZGTestInteractiveTransitioningViewController.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/21.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGTestInteractiveTransitioningViewController.h"

@interface ZGTestInteractiveTransitioningViewController ()

@end

@implementation ZGTestInteractiveTransitioningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"根";
    [self setupViews];
}

- (void)setupViews
{
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.frame = CGRectMake(10, 150, 200, 40);
    tipLabel.text = @"手势--向下滑动";
    [self.view addSubview:tipLabel];
}

@end

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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"自定义转场";
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"自定义转场样例" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(10, 150, 100, 40);
    [btn1 addTarget:self action:@selector(didBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"push" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(CGRectGetMaxX(btn1.frame) + 10, 150, 100, 40);
    [btn2 addTarget:self action:@selector(didBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
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
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
//     UINavigationController转场
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

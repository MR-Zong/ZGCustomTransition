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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    self.navigationItem.title = @"自定义转场";
}

- (void)customTransition
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    ZGNavigationController *zgNavigationController = (ZGNavigationController *)self.parentViewController;
    [zgNavigationController pushFromViewController:self toViewController:vc];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     [self customTransition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

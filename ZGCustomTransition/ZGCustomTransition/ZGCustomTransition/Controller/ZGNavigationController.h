//
//  ZGTransitionContainController.h
//  ZGCustomTransition
//
//  Created by Zong on 16/9/18.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGNavigationController : UIViewController

+ (instancetype)shareNavigationController;

- (void)pushFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

@end

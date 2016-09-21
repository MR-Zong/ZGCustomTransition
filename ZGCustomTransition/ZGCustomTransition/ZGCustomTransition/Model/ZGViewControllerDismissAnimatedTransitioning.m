//
//  ZGViewControllerDismissTransitioning.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/21.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGViewControllerDismissAnimatedTransitioning.h"

@implementation ZGViewControllerDismissAnimatedTransitioning


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect toVCFinalFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect fromVCFinalFrame = [transitionContext finalFrameForViewController:fromVC];
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    toVC.view.frame = toVCFinalFrame;
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVC.view.frame = CGRectOffset(fromVCFinalFrame, 0, fromVCFinalFrame.size.height);
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
}

@end

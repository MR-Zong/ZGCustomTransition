//
//  ZGViewControllerInteractiveTransitioning.m
//  ZGCustomTransition
//
//  Created by Zong on 16/9/21.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGViewControllerInteractiveTransitioning.h"

@interface ZGViewControllerInteractiveTransitioning ()

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, assign) BOOL shouldComplete;

@end

@implementation ZGViewControllerInteractiveTransitioning

- (void)prepareWithViewController:(UIViewController *)viewController
{
    _viewController = viewController;
    UIPanGestureRecognizer *edgePanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didEdgePan:)];
    [viewController.view addGestureRecognizer:edgePanGesture];
}

- (void)didEdgePan:(UIPanGestureRecognizer *)edgePan
{
    CGPoint translation = [edgePan translationInView:_viewController.view];
    switch (edgePan.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
//            self.interacting = YES;
            [_viewController dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            CGFloat fraction = translation.y / _viewController.view.bounds.size.height;
            //Limit it between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:{
            // 3. Gesture over. Check if the transition should happen or not
            //            self.interacting = NO;
            if (!self.shouldComplete) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
//            self.interacting = NO;
            if (!self.shouldComplete) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end

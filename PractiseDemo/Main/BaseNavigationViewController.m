//
//  BaseNavigationViewController.m
//  PractiseDemo
//
//  Created by gz on 2018/1/25.
//  Copyright © 2018年 gz. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    id target = self.interactivePopGestureRecognizer.delegate;
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//    panGesture.delegate = self;
//    [self.view addGestureRecognizer:panGesture];
    
    UIScreenEdgePanGestureRecognizer *panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    panGesture.edges = UIRectEdgeLeft;
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
}

+ (void)load {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarTintColor:[UIColor whiteColor]];
    navigationBar.translucent = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    if (self.childViewControllers.count > 1) {
        self.interactivePopGestureRecognizer.enabled = NO;
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.interactivePopGestureRecognizer.delegate = self;
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    UIScreenEdgePanGestureRecognizer *gesture = (UIScreenEdgePanGestureRecognizer *)gestureRecognizer;
    if (gesture.edges != UIRectEdgeLeft) {
        return NO;
    } else {
        return self.viewControllers.count != 1;
    }
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end

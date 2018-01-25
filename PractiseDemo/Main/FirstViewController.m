//
//  FirstViewController.m
//  PractiseDemo
//
//  Created by gz on 2018/1/25.
//  Copyright © 2018年 gz. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"第一页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 50, 30);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)click {
    SecondViewController *firstVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}


@end

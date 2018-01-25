//
//  SecondViewController.m
//  PractiseDemo
//
//  Created by gz on 2018/1/25.
//  Copyright © 2018年 gz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>
/// <#type#>
@property (nonatomic, strong) UITableView *listTableView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"第二页";
    [self creatListUI];
}

- (void)creatListUI {
    [self.view addSubview:self.listTableView];
}

#pragma mark ========== 懒加载 ==========

- (UITableView *)listTableView {
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
    }
    return _listTableView;
}

#pragma mark ========== UITableViewDelegate ==========

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

#pragma mark ========== UITableViewDataSource ==========

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"哈哈";
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end

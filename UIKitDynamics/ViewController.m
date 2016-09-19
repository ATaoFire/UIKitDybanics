//
//  ViewController.m
//  UIKitDynamics
//
//  Created by 张涛 on 16/9/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ViewController.h"
#import "GravityBehaviorViewController.h"//重力
#import "CollisionViewController.h"//碰撞
#import "AttachmentViewController.h"//连接
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dataArray = [NSMutableArray arrayWithObjects:@"重力", @"碰撞", @"连接",  nil];
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GravityBehaviorViewController * gravityVC = [[GravityBehaviorViewController alloc] init];
        [self.navigationController pushViewController:gravityVC animated:YES];
        
    }
    if (indexPath.row == 1) {
        CollisionViewController * collisionVC = [[CollisionViewController alloc] init];
        [self.navigationController pushViewController:collisionVC animated:YES];
        
    }
    if (indexPath.row == 2) {
        AttachmentViewController * attVC = [[AttachmentViewController alloc] init];
        [self.navigationController pushViewController:attVC animated:YES];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

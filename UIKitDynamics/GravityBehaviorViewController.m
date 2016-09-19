//
//  GravityBehaviorViewController.m
//  UIKitDynamics
//
//  Created by 张涛 on 16/9/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "GravityBehaviorViewController.h"

@interface GravityBehaviorViewController ()
{
    UIDynamicAnimator * animator;
    UIImageView * frogImageView;
}
@end

@implementation GravityBehaviorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    frogImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 300, 20, 20)];
    frogImageView.backgroundColor = [UIColor redColor];
    frogImageView.userInteractionEnabled = YES;
    [self.view addSubview:frogImageView];
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //重力
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[frogImageView]];
    //改变方向
    [gravityBehavior setAngle:0 magnitude:0.1];
    [animator addBehavior:gravityBehavior];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

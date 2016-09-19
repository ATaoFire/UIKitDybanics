//
//  CollisionViewController.m
//  UIKitDynamics
//
//  Created by 张涛 on 16/9/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "CollisionViewController.h"

@interface CollisionViewController ()<UICollisionBehaviorDelegate>
{
    UIDynamicAnimator * animator;
    UIImageView * frogImageView;
    UIImageView * dragonImageView;
}
@end

@implementation CollisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    frogImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 20, 20)];
    frogImageView.backgroundColor = [UIColor redColor];
    frogImageView.userInteractionEnabled = YES;
    [self.view addSubview:frogImageView];
    
    dragonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 20, 20)];
    dragonImageView.backgroundColor = [UIColor redColor];
    dragonImageView.userInteractionEnabled = YES;
    [self.view addSubview:dragonImageView];

    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //重力
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[frogImageView, dragonImageView]];
    //改变方向
    [gravityBehavior setAngle:0 magnitude:0.1];
    
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[frogImageView, dragonImageView]];
    //。还可以设置NSBezierPath或者两点之间的线段，其中前者可以使用addBoundaryWithIdentifier: forPath:
    /**
     *  要是想要物体发生碰撞，必须要定义边界translatesReferenceBoundsIntoBoundary属性
     *  还可以设置NSBezierPath或者两点之间的线段，其中前者可以使用addBoundaryWithIdentifier: forPath:后者可以使用
     addBoundaryWithIdentifier: fromPoint: toPoint:;
     */
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    //设置代理
    collisionBehavior.collisionDelegate = self;
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collisionBehavior];
    
}


//碰撞开始的时候，并且指定了碰撞边界
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p
{
    NSLog(@"碰撞开始的时候,并且指定了碰撞边界");
}
//碰撞结束的时候，并且指定了碰撞边界

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier
{
    NSLog(@"碰撞结束的时候,并且指定了碰撞边界");
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

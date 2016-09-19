//
//  AttachmentViewController.m
//  UIKitDynamics
//
//  Created by 张涛 on 16/9/19.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "AttachmentViewController.h"

@interface AttachmentViewController ()
{
    UIDynamicAnimator * animator;
    UIImageView * frogImageView;
    UIImageView * dragonImageView;
    UIAttachmentBehavior * attachmentBehavior;
}
@end

@implementation AttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //连接（attachment）指定了两个物体之间的动态连接，让其中一个物体的行为和移动受制于另一个物体的移动。在默认情况下，UIAttachmentBehavior将物体的中心指定为连接点，但可以将任何点指定为连接点。
    //本节是基于碰撞实现的
    self.view.backgroundColor = [UIColor whiteColor];
    frogImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 20, 20)];
    frogImageView.backgroundColor = [UIColor blueColor];
    frogImageView.userInteractionEnabled = YES;
    [self.view addSubview:frogImageView];
    
    
    dragonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 300, 20, 20)];
    dragonImageView.backgroundColor = [UIColor redColor];
    dragonImageView.userInteractionEnabled = YES;
    [self.view addSubview:dragonImageView];
    
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //重力
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[frogImageView, dragonImageView]];
    //改变方向
//    [gravityBehavior setAngle:0 magnitude:0.1];
    
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[frogImageView, dragonImageView]];
    [collisionBehavior setCollisionMode:UICollisionBehaviorModeBoundaries];
   //设置碰撞边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    //这是参照点CGPoint
    CGPoint frogCeter = CGPointMake(frogImageView.center.x, frogImageView.center.y);
    //创建一个UIAttachmentBehavior
    attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:dragonImageView attachedToAnchor:frogCeter];
    //设置振动频率
    [attachmentBehavior setFrequency:1.0f];
    //设置熨平动画的峰值
    [attachmentBehavior setDamping:1.0f];
    //调整连接长度
    [attachmentBehavior setLength:100.0f];
    
    
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collisionBehavior];
    [animator addBehavior:attachmentBehavior];
    
    //现在dragonImageView要是想跟着frogImageView移动，本身frogImageView是不会移动的，我们需要给frogImageView添加手势
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(handleGesture:)];
    [frogImageView addGestureRecognizer:recognizer];
    
}
- (void)handleGesture:(UIPanGestureRecognizer*)gesture
{
    CGPoint gesturePoint = [gesture locationInView:self.view];
    frogImageView.center = gesturePoint;
    [attachmentBehavior setAnchorPoint:gesturePoint];
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

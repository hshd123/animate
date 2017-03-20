//
//  QFGroupAnimationViewController.m
//  Animations
//
//  Created by Blues on 16/6/28.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFGroupAnimationViewController.h"

@interface QFGroupAnimationViewController () {
    CALayer *_demoLayer;
}

@end

@implementation QFGroupAnimationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoLayer = [[CALayer alloc] init];
    _demoLayer.bounds = CGRectMake(0, 0, 100, 100);
    _demoLayer.backgroundColor = [UIColor blueColor].CGColor;
    _demoLayer.position = CGPointMake(200, 150);
    
    [self.view.layer addSublayer:_demoLayer];
}

#pragma mark - Actions

- (IBAction)clickGroupAnimationBtn:(id)sender {
    CABasicAnimation *pingyiAnim = [CABasicAnimation animation];
//    pingyiAnim.keyPath = @"transform.translation.y"; // **** 如果是transform，就使用transform的变量，如果是transform.translation.y，就使用单个值
//    pingyiAnim.toValue = @(200);//[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 400, 0)];
    pingyiAnim.keyPath = @"position";
    pingyiAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    CABasicAnimation *suofangAnim = [CABasicAnimation animation];
    suofangAnim.keyPath = @"bounds";
    suofangAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    
    CABasicAnimation *xuanzhuanAnim = [CABasicAnimation animation];
//    xuanzhuanAnim.keyPath = @"transform.rotation.x"; // **** transform.rotation 默认是transform.rotation.z，垂直屏幕旋转
//    xuanzhuanAnim.toValue = @(M_PI);//[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2, 0, 0, 1)];
    xuanzhuanAnim.keyPath = @"transform"; // **** transform.rotation 默认是transform.rotation.z，垂直屏幕旋转，单独的transform会覆盖之前的transform的动画
    xuanzhuanAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    
    CAAnimationGroup *anim = [CAAnimationGroup animation];
    anim.animations = @[pingyiAnim, suofangAnim, xuanzhuanAnim];
    anim.duration = 3.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_demoLayer addAnimation:anim forKey:nil];
}

@end

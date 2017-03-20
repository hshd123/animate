//
//  CHContinuousViewController.m
//  Animations
//
//  Created by coohua on 17/2/6.
//  Copyright © 2017年 Blues. All rights reserved.
//

#import "CHContinuousViewController.h"

@interface CHContinuousViewController ()
@property (weak, nonatomic) IBOutlet UIView *annimationView;

@end

@implementation CHContinuousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CABasicAnimation *popAnim = [CABasicAnimation animation];
    popAnim.keyPath = @"transform.scale";
    popAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
    popAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    popAnim.duration = 2;
    popAnim.removedOnCompletion = NO;
    popAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    popAnim.fillMode = kCAFillModeForwards;
    [self.annimationView.layer addAnimation:popAnim forKey:nil];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animation];
    rotationAnimation.keyPath = @"transform.rotation.z";
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    //设置起始时间
    rotationAnimation.beginTime = CACurrentMediaTime() + 5;
    
    
    [self.annimationView.layer addAnimation:rotationAnimation forKey:nil];
}
@end

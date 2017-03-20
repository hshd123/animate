//
//  QFBasicAnimationViewController.m
//  Animations
//
//  Created by Blues on 16/6/28.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFBasicAnimationViewController.h"

@interface QFBasicAnimationViewController () {
    CALayer *_demoLayer;
}

@end

@implementation QFBasicAnimationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoLayer = [[CALayer alloc] init];
    _demoLayer.bounds = CGRectMake(0, 0, 100, 100);
    _demoLayer.backgroundColor = [UIColor blueColor].CGColor;
    _demoLayer.position = CGPointMake(50, 150);
    _demoLayer.anchorPoint = CGPointMake(0, 0);
    _demoLayer.cornerRadius = 20;
    
    [self.view.layer addSublayer:_demoLayer];
}

#pragma mark - Actions

- (IBAction)clickPingYiBtn:(id)sender {
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"position";
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
//    anim.duration = 5.0;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    [_demoLayer addAnimation:anim forKey:nil];
    
    
//    _demoLayer.bounds = CGRectMake(0, 0, 200, 200);
    
    // **** Translation x,y,z轴上的偏移量 和 平移是一个效果
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform";
    anim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 0, 1)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 100, 1)];
    anim.duration = 3.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_demoLayer addAnimation:anim forKey:nil];
}

- (IBAction)clickSuoFangBtn:(id)sender {
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"bounds";
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_demoLayer addAnimation:anim forKey:nil];
}

- (IBAction)clickFanZhuanBtn:(id)sender {
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform";
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
    anim.duration = 5.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_demoLayer addAnimation:anim forKey:nil];
}

@end

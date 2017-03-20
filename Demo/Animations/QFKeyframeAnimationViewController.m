//
//  QFKeyframeAnimationViewController.m
//  Animations
//
//  Created by Blues on 16/6/28.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFKeyframeAnimationViewController.h"

@interface QFKeyframeAnimationViewController () {
    CALayer *_demoLayer;
}

@end

@implementation QFKeyframeAnimationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoLayer = [[CALayer alloc] init];
    _demoLayer.bounds = CGRectMake(10, 74, 50, 50);
    _demoLayer.backgroundColor = [UIColor blueColor].CGColor;
    _demoLayer.position = CGPointMake(10, 74);
    _demoLayer.anchorPoint = CGPointMake(0, 0);
    _demoLayer.cornerRadius = 0;
    
    [self.view.layer addSublayer:_demoLayer];
}

#pragma mark - Actions

- (IBAction)clickArrDataBtn:(id)sender {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 150)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(250, 100)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(300, 150)];
    NSArray *arrData = @[value1, value2, value3, value4, value5];
    anim.values = arrData;
    anim.duration = 5.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_demoLayer addAnimation:anim forKey:nil];
}

- (IBAction)clickPathBtn:(id)sender {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(150, 250) controlPoint2:CGPointMake(250, 50)];
    anim.path = path.CGPath;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.duration = 5.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_demoLayer addAnimation:anim forKey:nil];
}

- (IBAction)clickDouDongBtn :(id)sender {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    NSArray *arrData = @[@(-5 / 180.0 * M_PI), @(5 / 180.0 * M_PI), @(-5 / 180.0 * M_PI)];
    anim.values = arrData;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.2;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    _demoLayer.anchorPoint = CGPointMake(0.5, 0.5);
    _demoLayer.position = CGPointMake(35, 99);
    [_demoLayer addAnimation:anim forKey:nil];
}

@end

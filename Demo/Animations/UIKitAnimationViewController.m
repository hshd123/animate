//
//  UIKitAnimationViewController.m
//  Animations
//
//  Created by Blues on 16/7/6.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "UIKitAnimationViewController.h"

@interface UIKitAnimationViewController () {
    IBOutlet UIView *_demoView;
}

@end

@implementation UIKitAnimationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGPoint position = _demoView.layer.position;
//    CGPoint anchPoint = _demoView.layer.anchorPoint;
    _demoView.layer.cornerRadius = 3.f;
//    _demoView.layer.anchorPoint = CGPointMake(0, 0);
//    _demoView.layer.position = CGPointMake(0, 0);
//    position = _demoView.layer.position;
//    anchPoint = _demoView.layer.anchorPoint;
//    int i = 0;
//    CALayer *layer = [[CALayer alloc] init];
//    layer.bounds = _demoView.layer.bounds;
//    layer.position = CGPointMake(10, 10);
//    layer.anchorPoint = CGPointMake(0, 0);
//    layer.backgroundColor = [UIColor blueColor].CGColor;
//    
//    [_demoView.layer addSublayer:layer];
}

#pragma mark - Actions

#pragma mark - 基本动画和UIKit动画完全一样的效果

- (IBAction)clickAnimationWithBlocksBtn:(id)sender {
    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _demoView.frame = CGRectMake(200, 300, 50, 50);
    } completion:^(BOOL finished) {
        _demoView.backgroundColor = [UIColor redColor];
    }];
}

- (IBAction)clickCoreAnimation1BlocksBtn:(id)sender {
    CABasicAnimation *anim1 = [CABasicAnimation animation];
    anim1.keyPath = @"position";
    anim1.fromValue = [NSValue valueWithCGPoint:CGPointMake(15 + 45, 75 + 35)];
    anim1.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"bounds";
    anim2.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 90, 70)];
    anim2.toValue = [NSValue valueWithCGRect:CGRectMake(200, 300, 50, 50)];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = @[anim1, anim2];
    animGroup.beginTime = CACurrentMediaTime() + 1;
    animGroup.duration = 2;
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animGroup.delegate = self;
    [_demoView.layer addAnimation:animGroup forKey:nil];
}

#pragma mark - 关键帧动画和UIKit动画完全一样的效果

- (IBAction)clickKeyframeAnimationsBtn:(id)sender {
    [UIView animateKeyframesWithDuration:4 delay:1 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            _demoView.frame = CGRectMake(45, 200, 50, 50);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            _demoView.frame = CGRectMake(75, 75, 90, 70);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.50 relativeDuration:0.25 animations:^{
            _demoView.frame = CGRectMake(105, 200, 50, 50);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            _demoView.frame = CGRectMake(135, 75, 90, 70);
        }];
    } completion:^(BOOL finished) {
        _demoView.backgroundColor = [UIColor redColor];
    }];
}

- (IBAction)clickCoreAnimation2BlocksBtn:(id)sender {
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation animation];
    anim1.keyPath = @"position";
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(15 + 45, 75 + 35)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(45 + 45, 200 + 35)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(75 + 45, 75 + 35)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(105 + 45, 200 + 35)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(135 + 45, 75 + 35)];
    anim1.values = @[value0, value1, value2, value3, value4];
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animation];
    anim2.keyPath = @"bounds";
    NSValue *value20 = [NSValue valueWithCGRect:CGRectMake(0, 0, 90, 70)];
    NSValue *value21 = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    NSValue *value22 = [NSValue valueWithCGRect:CGRectMake(0, 0, 90, 70)];
    NSValue *value23 = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    NSValue *value24 = [NSValue valueWithCGRect:CGRectMake(0, 0, 90, 70)];
    anim2.values = @[value20, value21, value22, value23, value24];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = @[anim1, anim2];
    animGroup.duration = 4;
    animGroup.beginTime = CACurrentMediaTime() + 1;
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animGroup.delegate = self;
    [_demoView.layer addAnimation:animGroup forKey:nil];
}

#pragma mark - Animation delegate

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    _demoView.backgroundColor = [UIColor redColor];
}

@end

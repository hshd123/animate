//
//  QFDemo1ViewController.m
//  Animations
//
//  Created by Blues on 16/6/27.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFDemo1ViewController.h"

@interface QFDemo1ViewController () {
    IBOutlet UIView *_demoView;
    CALayer *_demoLayer;
}

@end

@implementation QFDemo1ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *demoLayer = [[CALayer alloc] init];
    demoLayer.frame = _demoView.bounds;
    demoLayer.backgroundColor =[UIColor grayColor].CGColor;
    demoLayer.position = CGPointMake(50, 50);
    demoLayer.anchorPoint = CGPointMake(0, 0);
    demoLayer.cornerRadius = 10;
    
    [_demoView.layer addSublayer:demoLayer];
    _demoLayer = demoLayer;
}

#pragma mark - Acions

- (IBAction)clickStartBtn:(id)sender {
    CABasicAnimation *anim = [CABasicAnimation animation];
    [anim setKeyPath:@"position"];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    anim.duration = 3.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
//    [_demoLayer setPosition:CGPointMake(200, 200)];
    [_demoLayer addAnimation:anim forKey:nil];
}

- (IBAction)clickInfoBtn:(id)sender {
    NSLog(@"demo layer: position: %@", NSStringFromCGPoint(_demoLayer.position));
}

@end

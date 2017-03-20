//
//  QFLayerViewController.m
//  Animations
//
//  Created by Blues on 16/7/13.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFLayerViewController.h"

@interface QFLayerViewController () {
    CALayer *_demoLayer;
}

@end

@implementation QFLayerViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoLayer = [[CALayer alloc] init];
    _demoLayer.bounds = CGRectMake(0, 0, 100, 100);
    _demoLayer.position = CGPointMake(50, 130);
    _demoLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    id pl = _demoLayer.presentationLayer;
    id ml = _demoLayer.modelLayer;
    [self.view.layer addSublayer:_demoLayer];

    pl = _demoLayer.presentationLayer;
    ml = _demoLayer.modelLayer;
    int i = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    
    id pl = _demoLayer.presentationLayer;
    int i = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    
    id pl = _demoLayer.presentationLayer;
    int i = 0;
}

#pragma mrak - Actions

- (IBAction)clickPresentationLayerBtn:(id)sender {
    
}

#pragma mark - Touch event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    id pl = _demoLayer.presentationLayer;
    if ([_demoLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        _demoLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
        NSLog(@"hittest");
    }
    else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        
        _demoLayer.position = point;
        
        [CATransaction commit];
        
        NSLog(@"move");
    }
}

@end

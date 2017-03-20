//
//  QFAnimatableViewController.m
//  Animations
//
//  Created by Blues on 16/7/11.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFAnimatableViewController.h"

@interface QFAnimatableViewController () {
    CALayer *_demoLayer;
    IBOutlet UIView *_demoView;
}

@end

@implementation QFAnimatableViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoLayer = [[CALayer alloc] init];
    _demoLayer.bounds = CGRectMake(0, 0, 100, 100);
    _demoLayer.anchorPoint = CGPointMake(0, 0);
    _demoLayer.position = CGPointMake(50, 80);
    _demoLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.view.layer addSublayer:_demoLayer];
    
    NSLog(@"Outside: %@", [_demoView actionForLayer:_demoView.layer forKey:@"backgroundColor"]);
    //begin animation block
    [UIView beginAnimations:nil context:nil];
    //test layer action when inside of animation block
    NSLog(@"Inside: %@", [_demoView actionForLayer:_demoView.layer forKey:@"backgroundColor"]);
    //end animation block
    [UIView commitAnimations];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _demoLayer.delegate = nil;
}

#pragma mark - Actions

- (IBAction)clickAnimatableBtn:(id)sender {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:3]; // **** 默认0.25秒
    
    // **** 隐式动画 仅 针对非根root layer有效
//    _demoLayer.backgroundColor = [UIColor redColor].CGColor;
    _demoLayer.position = CGPointMake(100, 250);
    
//    _demoView.layer.position = CGPointMake(200, 300);
    
    [CATransaction commit];
}

- (IBAction)clickDisanimatableBtn:(id)sender {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    _demoLayer.backgroundColor = [UIColor redColor].CGColor;
    _demoLayer.position = CGPointMake(100, 250);
    
//    _demoView.layer.position = CGPointMake(200, 300);
    [CATransaction commit];
}

- (IBAction)clickChangeDefaultAnimationByActionDirBtn:(id)sender {
    
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionPush;
    anim.subtype = kCATransitionFromRight;
//    CABasicAnimation *anim = [CABasicAnimation animation];
    _demoLayer.actions = @{@"position" : anim}; // **** style 不行
    
    _demoLayer.position = CGPointMake(100, 250);
}

- (IBAction)clickChangeDefaultAnimationByDelegateBtn:(id)sender {
    _demoLayer.delegate = self;
    
    NSLog(@"Inside: %@", [self actionForLayer:_demoLayer forKey:@"position"]);
    _demoLayer.position = CGPointMake(100, 250);
    NSLog(@" complete");
    
    
//    NSLog(@"Outside: %@", [_demoView actionForLayer:_demoView.layer forKey:@"backgroundColor"]);
//    //begin animation block
//    [UIView beginAnimations:nil context:nil];
//    //test layer action when inside of animation block
//    NSLog(@"Inside: %@", [_demoView actionForLayer:_demoView.layer forKey:@"backgroundColor"]);
//    //end animation block
//    [UIView commitAnimations];
}

#pragma mark - CALayerDelegate

- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    NSLog(@"layer: %@, key: %@", layer, event);
//    CATransition *anim = [CATransition animation];
//    anim.type = kCATransitionPush;
//    anim.subtype = kCATransitionFromRight;
//    return anim;
    return [CAAnimation animation]; // **** caanimation, 没有任何动画行为，所以动画可以停止
    return NULL;
    return nil;
}

@end

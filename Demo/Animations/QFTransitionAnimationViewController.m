//
//  QFTransitionAnimationViewController.m
//  Animations
//
//  Created by Blues on 16/6/28.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFTransitionAnimationViewController.h"

@interface QFTransitionAnimationViewController () {
    IBOutlet UIImageView *_demoImgView;
    NSInteger _index;
}

@end

@implementation QFTransitionAnimationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 1;
}

#pragma mark - Actions

- (IBAction)clickTurnTransitionPreBtn:(id)sender {
    _index --;
    if (_index == 0) {
        _index = 4;
    }
    _demoImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", _index]];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"cube";//@"pageCurl";//
    anim.subtype = kCATransitionFromTop;//kCATransitionFromLeft;
    anim.duration = 2.0;
    [_demoImgView.layer addAnimation:anim forKey:nil];
}

- (IBAction)clickTurnTransitionNextBtn:(id)sender {
    _index ++;
    if (_index == 5) {
        _index = 1;
    }
    _demoImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", _index]];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"pageUnCurl";//@"oglFlip";//kCATransitionReveal;
    anim.subtype = kCATransitionFromRight;
    anim.duration = 2.0;
//    anim.endProgress = 0.5;
    [_demoImgView.layer addAnimation:anim forKey:nil];
}

@end

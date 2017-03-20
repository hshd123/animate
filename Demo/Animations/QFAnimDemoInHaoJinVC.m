//
//  QFAnimDemoInHaoJinVC.m
//  Animations
//
//  Created by Blues on 16/7/11.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "QFAnimDemoInHaoJinVC.h"

@interface QFAnimDemoInHaoJinVC () {
    IBOutlet UIView *_attachedView;
    UIImageView *_demoImgView;
}

@end

@implementation QFAnimDemoInHaoJinVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions

- (IBAction)clickTipsDemoBtn:(id)sender {
    NSString *strNotice = @"好近为你搜罗的其他店铺的红包设置";
    CGRect rect = [strNotice boundingRectWithSize:CGSizeMake(10000, 14)
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    CGRect noticeFrame = CGRectMake(0, 10, rect.size.width + 20, 30);
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:noticeFrame];
    noticeLabel.backgroundColor = [UIColor colorWithRed:254.0/255 green:164.0/255 blue:17.0/255 alpha:1.0];
    noticeLabel.textColor = [UIColor whiteColor];
    noticeLabel.text = strNotice;
    noticeLabel.font = [UIFont systemFontOfSize:14];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.layer.cornerRadius = 3.0;
    noticeLabel.layer.masksToBounds = YES;
    noticeLabel.tag = 400;
    
    UIImage *markImg = [UIImage imageNamed:@"Triangle"];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(noticeFrame.size.width, 40), NO, 2.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    noticeLabel.layer.bounds = CGRectMake(0, 10, rect.size.width + 20, 30);
    [noticeLabel.layer renderInContext:context];
    [markImg drawInRect:CGRectMake(noticeFrame.size.width - markImg.size.width - 5, 0, markImg.size.width, markImg.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _demoImgView = [[UIImageView alloc] initWithImage:resultingImage];
    CGRect frame = _attachedView.frame;
    frame.origin.x -= (noticeFrame.size.width - frame.size.width);
    frame.origin.y += frame.size.height;
    frame.size.width = rect.size.width + 20;
    frame.size.height = 40;
    _demoImgView.frame = frame;
    [self.view addSubview:_demoImgView];
    
//    [self animationStart];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"bounds";
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, noticeFrame.size.width, 40)];
    anim.duration = 3;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    _demoImgView.layer.anchorPoint = CGPointMake(1.0, 0); // **** 根layer改变anchorPoint会改变position，也就是位置
    _demoImgView.layer.position = CGPointMake(frame.origin.x + noticeFrame.size.width, frame.origin.y);
    [_demoImgView.layer addAnimation:anim forKey:nil];
}

- (void)animationStart {
    CGRect oriRect = _demoImgView.frame;
    
    _demoImgView.layer.anchorPoint = CGPointMake(1, 0);
    _demoImgView.layer.position = CGPointMake(oriRect.origin.x + oriRect.size.width , oriRect.origin.y);
    _demoImgView.bounds = CGRectMake(0, 0, 0, 0);
    
    [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionLayoutSubviews animations:^{
//        _demoImgView.center = CGPointMake(oriRect.origin.x + oriRect.size.width,oriRect.origin.y);
        _demoImgView.bounds = CGRectMake(0, 0, oriRect.size.width, oriRect.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
}

@end

//
//  ViewController.m
//  Animations
//
//  Created by Blues on 16/6/27.
//  Copyright © 2016年 Blues. All rights reserved.
//

#import "ViewController.h"
#import "QFDemo1ViewController.h"
#import "QFBasicAnimationViewController.h"
#import "QFKeyframeAnimationViewController.h"
#import "QFGroupAnimationViewController.h"
#import "QFTransitionAnimationViewController.h"
#import "UIKitAnimationViewController.h"
#import "QFAnimDemoInHaoJinVC.h"
#import "QFAnimatableViewController.h"
#import "QFLayerViewController.h"
#import "CHContinuousViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)clickDemo1:(id)sender {
    QFDemo1ViewController *demo1VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFDemo1ViewController"];
    [self.navigationController pushViewController:demo1VC animated:YES];
}

- (IBAction)clickBasicAnimationBtn:(id)sender {
    QFBasicAnimationViewController *basicAnimVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFBasicAnimationViewController"];
    [self.navigationController pushViewController:basicAnimVC animated:YES];
}

- (IBAction)clickKeyframeAnimationBtn:(id)sender {
    QFKeyframeAnimationViewController *keyframeAnimVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFKeyframeAnimationViewController"];
    [self.navigationController pushViewController:keyframeAnimVC animated:YES];
}

- (IBAction)clickGroupAnimationBtn:(id)sender {
    QFGroupAnimationViewController *groupAnimVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFGroupAnimationViewController"];
    [self.navigationController pushViewController:groupAnimVC animated:YES];
}

- (IBAction)clickTransitionAnimationBtn:(id)sender {
    QFTransitionAnimationViewController *transitionAnimVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFTransitionAnimationViewController"];
    [self.navigationController pushViewController:transitionAnimVC animated:YES];
}

- (IBAction)clickUIKitAnimationBtn:(id)sender {
    UIKitAnimationViewController *uikitAnimVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"UIKitAnimationViewController"];
    [self.navigationController pushViewController:uikitAnimVC animated:YES];
}

- (IBAction)clickInstanceAnimationBtn:(id)sender {
    QFAnimDemoInHaoJinVC *haojinVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFAnimDemoInHaoJinVC"];
    [self.navigationController pushViewController:haojinVC animated:YES];
}

- (IBAction)clickAnimatableBtn:(id)sender {
    QFAnimatableViewController *animatableVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFAnimatableViewController"];
    [self.navigationController pushViewController:animatableVC animated:YES];
}

- (IBAction)clickLayerBtn:(id)sender {
    QFLayerViewController *layerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QFLayerViewController"];
    [self.navigationController pushViewController:layerVC animated:YES];
}
- (IBAction)clickContinuousBtn:(id)sender {
    CHContinuousViewController *continuousVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CHContinuousViewController"];
    [self.navigationController pushViewController:continuousVC animated:YES];
}

@end

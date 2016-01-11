//
//  CALayerAnimationGroupViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/9/5.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "CALayerAnimationGroupViewController.h"

@interface CALayerAnimationGroupViewController (){

    CALayer* layer;
}

@end

@implementation CALayerAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    layer=[[CALayer alloc] init];
    layer.bounds=CGRectMake(0, 0, 50, 50);
    layer.position=CGPointMake(50, 150);
    layer.contents=(id)[UIImage imageNamed:@"xuehua.jpg"].CGImage;
    
    [self.view.layer addSublayer:layer];
    [self animationGroup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (CAKeyframeAnimation*) transitionAnimation
{
    CAKeyframeAnimation* keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, layer.position.x, layer.position.y);
    CGPathAddCurveToPoint(path, nil, 160, 280, -30, 300, 55, 400);
    
    keyframeAnimation.path=path;
    
    return keyframeAnimation;
}

-(CABasicAnimation*) rotationAnimation
{
    CABasicAnimation* rotateAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotateAnimation.toValue=[NSNumber numberWithFloat:M_PI*2];
    rotateAnimation.repeatCount=HUGE_VAL;
    rotateAnimation.removedOnCompletion=NO;
    
    return rotateAnimation;
}

- (void)animationGroup
{
    CAAnimationGroup* group=[CAAnimationGroup animation];
    CABasicAnimation* basicAnimation=[self rotationAnimation];
    CAKeyframeAnimation* keyframeAnimation=[self transitionAnimation];
    
    group.animations=@[basicAnimation,keyframeAnimation];
    group.duration=8.0;
    group.delegate=self;
    group.beginTime=CACurrentMediaTime()+3;
    
    [layer addAnimation:group forKey:@"gropuAnimation"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    layer.position=CGPointMake(55, 400);
    
    [CATransaction commit];
}
@end


















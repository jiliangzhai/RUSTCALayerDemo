//
//  CALayerKeyframeAnimationViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/9/5.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "CALayerKeyframeAnimationViewController.h"

@interface CALayerKeyframeAnimationViewController ()
{
    CALayer* layer;
}

@end

@implementation CALayerKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    layer=[[CALayer alloc] init];
    layer.bounds=CGRectMake(0, 0, 20, 20);
    layer.position=CGPointMake(50, 150);
    layer.contents=(id)[UIImage imageNamed:@"0111.jpg"].CGImage;
    [self.view.layer addSublayer:layer];
    
    [self transitionAnimation2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transitionAnimation1
{
    CAKeyframeAnimation* keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue* value1=[NSValue valueWithCGPoint:layer.position];
    NSValue* value2=[NSValue valueWithCGPoint:CGPointMake(80, 220)];
    NSValue* value3=[NSValue valueWithCGPoint:CGPointMake(45, 300)];
    NSValue* value4=[NSValue valueWithCGPoint:CGPointMake(55, 400)];
    NSArray* values=@[value1,value2,value3,value4];
    
    keyframeAnimation.values=values;
    keyframeAnimation.duration=8.0;
    //cacurrentmediatime()是现在的时间
    keyframeAnimation.beginTime=CACurrentMediaTime()+2;
    
    [layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation1"];
    
}


- (void)transitionAnimation2
{
    CAKeyframeAnimation* keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, layer.position.x, layer.position.y);
    CGPathAddCurveToPoint(path, nil, 160, 280, -30, 300, 55, 400);
    
    keyframeAnimation.path=path;
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime()+2;
    
    [layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation2"];
}
@end

//可以使用 keyTime 控制帧与帧之间的时间，它是一个矩阵，例如[0.0,0.5,0.75,1];
//caculationMode可以控制帧与帧之间的插值模式，得到不同的路径。












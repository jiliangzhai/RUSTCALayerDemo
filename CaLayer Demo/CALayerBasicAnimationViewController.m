//
//  CALayerBasicAnimationViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/9/1.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "CALayerBasicAnimationViewController.h"

@interface CALayerBasicAnimationViewController ()
{
    CALayer* layer;
}


@end

@implementation CALayerBasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    
    layer=[CALayer layer];
    layer.bounds=CGRectMake(0, 0, 50, 50);
    layer.position=CGPointMake(50, 100);
    layer.contents=(id)[UIImage imageNamed:@"xuehua.jpg"].CGImage;
    layer.anchorPoint=CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)translationAnimation:(CGPoint)location
{
    CABasicAnimation* basicAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue=[NSValue valueWithCGPoint:location];
    basicAnimation.duration=3;
    basicAnimation.delegate=self;
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"animationLocation"];
    [layer addAnimation:basicAnimation forKey:@"translationAnimation"];
}

-(void) rotationAnimation
{
    CABasicAnimation* rotationAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue=[NSNumber numberWithFloat:M_PI*2];
    rotationAnimation.duration=3;
    rotationAnimation.autoreverses=NO;
    rotationAnimation.repeatCount=0;
    rotationAnimation.removedOnCompletion=NO;
    
    [layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    CGPoint location=[touch locationInView:self.view];
    
    CAAnimation* animation=[layer animationForKey:@"translationAnimation"];
    if (animation) {
        
        if (layer.speed==0) {
            
            [self animationResume];
        }else
            [self animationPause];
        
            }else{
                
    [self translationAnimation:location];
    [self rotationAnimation];
                
            }
}

-(void) animationDidStart:(CAAnimation *)anim
{
    
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    layer.position=[[anim valueForKey:@"animationLocation"] CGPointValue];
    
    [CATransaction commit];
}

-(void) animationResume
{
    CFTimeInterval begintime= CACurrentMediaTime()-layer.timeOffset;
    
    layer.timeOffset=0;
    layer.beginTime=begintime;
    layer.speed=1;

}

-(void) animationPause
{
    CFTimeInterval interval=[layer convertTime:CACurrentMediaTime() fromLayer:nil];
    [layer setTimeOffset:interval];
    layer.speed=0;
}
@end




//重点是两个代理方法动画开始以及动画结束，还有就是动画的暂停及回复操作。
//动画的暂停将暂停图层的所有动画。













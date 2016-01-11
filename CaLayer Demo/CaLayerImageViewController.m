//
//  CaLayerImageViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/8/27.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "CaLayerImageViewController.h"

@interface CaLayerImageViewController ()

@end

@implementation CaLayerImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGPoint position=CGPointMake(160, 200);
    CGRect bounds=CGRectMake(0, 0, 150, 150);
    CGFloat cornerRadius=75;
    CGFloat borderWidth=2;
    
    CALayer* layerShadow=[CALayer layer];
    
    layerShadow.bounds=bounds;
    layerShadow.position=position;
    layerShadow.cornerRadius=cornerRadius;
    layerShadow.shadowColor=[UIColor yellowColor].CGColor;
    layerShadow.shadowOffset=CGSizeMake(2, 1);
    layerShadow.shadowOpacity=1.0;
    layerShadow.borderColor=[UIColor whiteColor].CGColor;
    layerShadow.borderWidth=borderWidth;
    [self.view.layer addSublayer:layerShadow];
    
    CALayer* layer=[CALayer layer];
    layer.bounds=bounds;
    layer.position=position;
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.cornerRadius=cornerRadius;
    layer.masksToBounds=YES;
    layer.borderColor=[UIColor whiteColor].CGColor;
    layer.borderWidth=borderWidth;
    
   // layer.transform=CATransform3DMakeRotation(M_PI, 1, 0, 0);//这一步操作可以替代下面的两步操作。
    
    UIImage* image=[UIImage imageNamed:@"fafan.jpg"];
    layer.contents=(id)image.CGImage;
    
    //layer.delegate=self;
    [self.view.layer addSublayer:layer];
    //[layer setNeedsDisplay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }



-(void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    //CGContextSaveGState(ctx);
    
    //CGContextScaleCTM(ctx, 1, -1);
    //CGContextTranslateCTM(ctx, 0, -150);
    
    UIImage* image=[UIImage imageNamed:@"011.jpg"];
    
    //主要是这个方法
    CGContextDrawImage(ctx, CGRectMake(0, 0, 150, 150), image.CGImage);
    
    //CGContextRestoreGState(ctx);
    
    
}

@end

//只使用一种圆形maskToBounds会使得阴影效果无法显示，所以要使用两个图层一个负责图片一个负责阴影就可以了。













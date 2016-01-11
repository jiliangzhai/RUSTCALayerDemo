//
//  KCView.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/8/31.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "RUView.h"
#import "RULayer.h"

@implementation RUView



-(instancetype) initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        RULayer* layer=[[RULayer alloc ] init];
        layer.bounds=CGRectMake(0, 0, 185, 185);
        layer.position=CGPointMake(160, 284);
        layer.backgroundColor=[UIColor colorWithRed:0 green:146/255 blue:1 alpha:1].CGColor;
        
        layer.transform=CATransform3DMakeRotation(M_PI, 1, 0, 0);
        
        [layer setNeedsDisplay];
        [self.layer addSublayer:layer];
        
    }
    
    return self;
}

-(void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"drawLayer");
    [super drawLayer:layer inContext:ctx];
}

-(void) drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
}

@end

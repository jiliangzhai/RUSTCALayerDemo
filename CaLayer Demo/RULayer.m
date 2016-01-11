//
//  KCLayer.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/8/31.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "RULayer.h"

@implementation RULayer

-(void)drawInContext:(CGContextRef)ctx
{
    NSLog(@"drawInContext");
    
    CGContextSetRGBFillColor(ctx, 135.0/255, 232/255, 84/255, 1);
    CGContextSetRGBStrokeColor(ctx, 135/255, 232/255, 84/255, 1);
    
    CGContextMoveToPoint(ctx, 94.5, 33.5);
    CGContextAddLineToPoint(ctx, 104.02, 47.39);
    CGContextAddLineToPoint(ctx, 120.18, 52.16);
    CGContextAddLineToPoint(ctx, 109.91, 65.51);
    CGContextAddLineToPoint(ctx, 110.37, 82.34);
    CGContextAddLineToPoint(ctx, 94.5, 76.7);
    CGContextAddLineToPoint(ctx, 84.98, 47.39);
    
    CGContextClosePath(ctx);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end

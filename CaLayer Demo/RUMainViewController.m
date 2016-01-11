//
//  ViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/8/27.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "RUMainViewController.h"
#import "RUView.h"

@interface RUMainViewController ()

@end

@implementation RUMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view=[[RUView alloc] init];
    [self.view addSubview:view];
    
    //[self drawMyLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) drawMyLayer
{
    NSLog(@"reach");
    
    
    CGSize size=[UIScreen mainScreen].bounds.size;
    
    CALayer* layer=[CALayer layer];
    
    
    [layer setBackgroundColor:[UIColor colorWithRed:0 green:146/255 blue:1 alpha:1].CGColor];
    layer.bounds=CGRectMake(0, 0, 50, 50);
    layer.position=CGPointMake(size.width/2.0, size.height/2.0);
    layer.cornerRadius=size.width/2.0;
    
    layer.shadowColor=[UIColor grayColor].CGColor;
    layer.shadowOffset=CGSizeMake(2, 2);
    layer.shadowOpacity=0.9;
    
    layer.borderColor=[UIColor whiteColor].CGColor;
    layer.borderWidth=1;
    
    layer.anchorPoint=CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:layer];
    
    [layer setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    CGPoint location=[touch locationInView:self.view];
    
    CALayer* layer=self.view.layer.sublayers[0];
    CGFloat width=layer.bounds.size.width;
    
    if (width==50) {
        
        width=200;
        
    }else width=50;
    
    layer.bounds=CGRectMake(0, 0, width, width);
    layer.position=location;
    layer.cornerRadius=width/2.0;
}
@end



















//
//  UIViewTransitionAnimationViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 15/9/5.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "CALayerTransitionAnimationViewController.h"

@interface CALayerTransitionAnimationViewController (){
    
    UIImageView* imageView;
    NSArray *imageNames;
    int currentIndex;
}

@end

@implementation CALayerTransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    imageNames = @[@"yangmi.jpg",@"fafan.jpg",@"gua.jpg",@"shuiren.jpg"];
    
    imageView=[[UIImageView alloc] init];
    imageView.frame=[UIScreen mainScreen].applicationFrame;
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    imageView.image=[UIImage imageNamed:imageNames[0]];
    
    currentIndex=0;
    [self.view addSubview:imageView];
    
    UISwipeGestureRecognizer* leftSwipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    [self.view addGestureRecognizer:leftSwipe];
    leftSwipe.direction=UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizer* rightSwipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)leftSwipe:(UISwipeGestureRecognizer*)swipe
{
    [self transitionAnimation:YES];
}

- (void)rightSwipe:(UISwipeGestureRecognizer*)swipe
{
    [self transitionAnimation:NO];
}

- (void)transitionAnimation:(BOOL)isNext
{
    CATransition* transition=[[CATransition alloc] init];
    //transition.type=@"cube";
    //transition.type=@"oglFlip";
    //transition.type=@"suckEffect";//抽纸效果
    transition.type=@"rippleEffect";//波纹效果
    //transition.type=@"cameraIrisHollowOpen";//摄像头打开效果
    //以上是私有api，公开api有fade movein push reveal
    
    if (isNext) {
        transition.subtype=kCATransitionFromRight;
    }else
        transition.subtype=kCATransitionFromLeft;
    
    transition.duration=1.0;
    
    imageView.image=[self getImage:isNext];
    [imageView.layer addAnimation:transition forKey:@"transitionAnimation"];
}

- (UIImage*)getImage:(BOOL)isNext
{
    if (isNext) {
        currentIndex=(currentIndex+1)%4;
    }else
        currentIndex=(currentIndex-1+4)%4;
    
    NSString* imageName=imageNames[currentIndex];
    return [UIImage imageNamed:imageName];
}
@end











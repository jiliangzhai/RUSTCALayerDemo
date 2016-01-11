//
//  ExamplesTableViewController.m
//  CaLayer Demo
//
//  Created by rust_33 on 16/1/11.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "ExamplesTableViewController.h"

@interface ExamplesTableViewController (){
    NSMutableArray *exampleNames;
    NSMutableArray *exampleClassNames;
}

@end

@implementation ExamplesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    exampleClassNames  = [NSMutableArray array];
    [exampleClassNames addObject:@"CALayerBasicAnimationViewController"];
    [exampleClassNames addObject:@"CALayerKeyframeAnimationViewController"];
    [exampleClassNames addObject:@"CALayerAnimationGroupViewController"];
    [exampleClassNames addObject:@"CALayerTransitionAnimationViewController"];
    [exampleClassNames addObject:@"RUMainViewController"];
    [exampleClassNames addObject:@"CaLayerImageViewController"];
    
    exampleNames = [NSMutableArray array];
    [exampleNames addObject:@"基本动画"];
    [exampleNames addObject:@"关键帧动画"];
    [exampleNames addObject:@"动画组动画"];
    [exampleNames addObject:@"过场动画"];
    [exampleNames addObject:@"CALayer隐式动画"];
    [exampleNames addObject:@"自定义layer的绘制"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return exampleNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rust"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rust"];
        
    }
    
    cell.textLabel.text = exampleNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = exampleClassNames[indexPath.row];
    Class example = NSClassFromString(className);
    if (example) {
        
        UIViewController *targetController = [example new];
        [self.navigationController pushViewController:targetController animated:YES];
    }
    
}

@end





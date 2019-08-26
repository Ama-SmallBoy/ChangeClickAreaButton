//
//  ViewController.m
//  ChnageClickAreaOfButton
//
//  Created by a on 2019/8/21.
//  Copyright © 2019年 TeenageBeaconFireGroup. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //点击按钮的四个角，没有点击效果，点击内切圆的部分，才会有点击效果。//
    CustomButton * button = [[CustomButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    button.center = self.view.center;
    
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(didAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)didAction:(UIButton *)button{
    NSLog(@"=====click");
}


@end

//
//  ViewController.m
//  02-手写约束
//
//  Created by 千锋 on 16/3/18.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.关闭autoresizing
    
 //   self.view.translatesAutoresizingMaskIntoConstraints=NO;
//    [self test1];
    [self test2];
    
}



-(void)test2{
    
    UIView *redview=[[UIView alloc]init];
    redview.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redview];
    redview.translatesAutoresizingMaskIntoConstraints=NO;
    
    UIView *yellowview=[[UIView alloc]init];
    yellowview.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:yellowview];
    yellowview.translatesAutoresizingMaskIntoConstraints=NO;
    
    //=============红色视图约束=============
    //top
    NSLayoutConstraint *redTop=[NSLayoutConstraint constraintWithItem:redview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    //left
    NSLayoutConstraint *redleft=[NSLayoutConstraint constraintWithItem:redview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    //right
     NSLayoutConstraint *redRight=[NSLayoutConstraint constraintWithItem:redview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
    //bottom
    NSLayoutConstraint *redBottom=[NSLayoutConstraint constraintWithItem:redview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:yellowview attribute:NSLayoutAttributeTop multiplier:1 constant:-50];
    
    
    [self.view addConstraints:@[redTop,redleft,redRight,redBottom]];
    
    
    //===============黄色约束===================
     NSLayoutConstraint *yellowcenterX=[NSLayoutConstraint constraintWithItem:yellowview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:redview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
     NSLayoutConstraint *yellowBottom=[NSLayoutConstraint constraintWithItem:yellowview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-30];
     NSLayoutConstraint *yellowWidth=[NSLayoutConstraint constraintWithItem:yellowview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redview attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
     NSLayoutConstraint *yellowHeight=[NSLayoutConstraint constraintWithItem:yellowview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redview attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    
    [self.view addConstraints:@[yellowBottom,yellowcenterX,yellowWidth,yellowHeight]];
    

}



//让一个视图显示在屏幕的右下角
-(void)test1{
    
    //1.创建一个视图 不设置frame属性
    
    UIView *greenView=[[UIView alloc]init];
    greenView.backgroundColor=[UIColor greenColor];
    greenView.translatesAutoresizingMaskIntoConstraints=NO;
    //2.将视图添加到界面上
    [self.view addSubview:greenView];
    
    //3.添加约束
    //注意：a.保证将所有的约束添加完(通过你添加的约束可以找到一个固定的位置)
    //b.不能重复添加约束
    //(1)添加底部约束
    //参数1的参数2  参数3 参数4的参数5 *参数6+参数7
    //greenview的bottom=self.view的bottom*1 +(-20);
    NSLayoutConstraint *bottom=[NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    //2.添加右边约束
    NSLayoutConstraint *right=[NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
    //3.宽度约束
    NSLayoutConstraint *width=[NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:200];
    //高度约束
    NSLayoutConstraint *height=[NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:200];
    //4.添加约束
    
    [self.view addConstraints:@[bottom,right]];
    [greenView addConstraints:@[width,height]];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

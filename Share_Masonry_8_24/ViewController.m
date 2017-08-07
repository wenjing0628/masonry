//
//  ViewController.m
//  Share_Masonry_8_24
//
//  Created by zhangshuai on 15/8/25.
//  Copyright (c) 2015年 张帅. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Masonry是一个轻量级的布局框架 拥有自己的描述语法 采用更优雅的链式语法封装自动布局
    // 1.先用masonry写一个视图居中的效果
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置中心约束
        make.center.equalTo(weakSelf.view);
        //设置宽高约束
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    
    // 2.视图距离边缘都是20的效果
    UIView *blackView = [[UIView alloc]init];
    blackView.backgroundColor = [UIColor blackColor];
    [redView addSubview:blackView];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置上、左、下、右约束
        make.top.equalTo(redView.mas_top).offset(20);
        make.left.equalTo(redView.mas_left).offset(20);
        make.bottom.equalTo(redView.mas_bottom).offset(-20);
        make.right.equalTo(redView.mas_right).offset(-20);
//        等价于
//        make.edges.mas_equalTo(redView).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
//        //还等价于
//        make.top.and.left.bottom.and.right.equalTo(redView).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    
    // 3.让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
    UIView *oneBlueView = [[UIView alloc]init];
    oneBlueView.backgroundColor = [UIColor blueColor];
    [blackView addSubview:oneBlueView];
    UIView *twoBlueView = [[UIView alloc]init];
    twoBlueView.backgroundColor = [UIColor blueColor];
    [blackView addSubview:twoBlueView];
    
    //给第一个blueView添加约束
    [oneBlueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(blackView.mas_centerY);
        make.height.equalTo(@150);
        make.width.equalTo(twoBlueView);
        make.left.equalTo(blackView.mas_left).offset(10);
        make.right.equalTo(twoBlueView.mas_left).offset(-10);
    }];
    // 给第二个blueView
    [twoBlueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(blackView.mas_centerY);
        make.size.equalTo(oneBlueView);
        make.left.equalTo(oneBlueView.mas_right).offset(10);
        make.right.equalTo(blackView.mas_right).offset(-10);
    }];
    
    
    // 4.更新约束 ，如果之前已经有约束。则更新，如果没有约束，则添加约束
    [redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 300));
    }];
    
    
    // 5.将之前的约束全部删除，添加新的约束
    [redView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(320, 400));
    }];
    
    // 用法总结
    // equalTo()括号中可以是 UIView，NSView,NSNumber,NSArray
    //mas_equalTo()括号中出了上边几种外还可以是，int，CGPont,CGSize,UIEdgeInsets
    
    /*
     edges的用法
     
     边缘约束相等
     1.make.edges.equalTo(view2);
     
     2. make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20))
    （ make top = superview.top + 5, 
            left = superview.left + 10,
            bottom = superview.bottom - 15,
            right = superview.right - 20）
     
     
     size的用法
     
     两个视图的大小相等
    1.make.size.greaterThanOrEqualTo(titleLabel)
     
     
     2.make.size.equalTo(superview).sizeOffset(CGSizeMake(100, -50))
      （make width = superview.width + 100,
            height = superview.height - 50）
     
     center的用法
     
     两个视图的中心相等
    1.make.center.equalTo(button1)
     
     
    2. make.center.equalTo(superview).centerOffset(CGPointMake(-5, 10))
     （make centerX = superview.centerX - 5,
            centerY = superview.centerY + 10）
     
     */
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

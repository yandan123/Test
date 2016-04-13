//
//  ViewController.m
//  PackView
//
//  Created by 严丹 on 16/4/5.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DatePickerView.h"
#import "UIView+Utility.h"
#import "DateAndTimeViewController.h"
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"时间选择器";
    self.navigationController.navigationBar.backgroundColor = [UIColor darkGrayColor];
    [self createBtn];
    
}
- (void)createBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    btn.backgroundColor = [UIColor darkGrayColor];
    
    [btn setTitle:@"时间选择" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(datePackView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)datePackView{
    DateAndTimeViewController * vc  = [DateAndTimeViewController new];
    [self.navigationController.view addSubview:vc.view];
}

@end

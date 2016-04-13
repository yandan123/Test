//
//  DateAndTimeViewController.m
//  PackView
//
//  Created by 严丹 on 16/4/5.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "DateAndTimeViewController.h"
#import "DatePickerView.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
@interface DateAndTimeViewController ()
{
    DatePickerView * _datePicker;
}

@end

@implementation DateAndTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [UIView new];
    [view setFrame:self.view.bounds];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    _datePicker= [[DatePickerView alloc] initWithFrame:CGRectMake(0,KScreenHeight - 186, KScreenWidth, 186)];
    [self.view addSubview:_datePicker];
    [_datePicker showPicker];
}

-(void)dismiss:(BOOL)animated{
    [self.view removeFromSuperview];
    
}

@end

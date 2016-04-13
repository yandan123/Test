//
//  DatePickerView.m
//  BeiZhi
//
//  Created by ZhangBo on 16/3/8.
//  Copyright © 2016年 ls. All rights reserved.
//

#import "DatePickerView.h"
#import "UIView+Utility.h"
#import "DateAndTimeViewController.h"
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DatePickerView ()
{
    UIDatePicker * _datePicker;
    UIBarButtonItem * cancelButton;
    UIBarButtonItem * doneButton;
    UIBarButtonItem *itemText;
}
@end

@implementation DatePickerView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        CGRect rect  = CGRectMake(0, 0, frame.size.width, 30);
        
        UIToolbar *topView = [[UIToolbar alloc]initWithFrame:rect];
        [topView setBarStyle:UIBarStyleDefault];
        
        cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelPicker)];
        
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        itemText = [[UIBarButtonItem alloc] initWithTitle:@"日期选择" style:UIBarButtonItemStyleDone target:self action:nil];
        
        UIBarButtonItem *fixedSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        doneButton = [[UIBarButtonItem alloc]initWithTitle:@">" style:UIBarButtonItemStyleDone target:self action:@selector(nextPicker)];
        NSArray * buttonsArray = [NSArray arrayWithObjects:cancelButton,fixedSpace,itemText,fixedSpace2,doneButton,nil];
        [topView setItems:buttonsArray];
        [self addSubview:topView];
        
        rect = CGRectMake(0, topView.bottom , frame.size.width , frame.size.height - topView.height);
        _datePicker = [[UIDatePicker alloc]init];
        [_datePicker setFrame:rect];
        [_datePicker addTarget:self action:@selector(dateChanged:)
              forControlEvents:UIControlEventValueChanged];
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        
        [self addSubview:_datePicker];
    }
    return self;
}
-(void)dateChanged:(UIDatePicker *)picker{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.dateStr = [dateFormatter stringFromDate:picker.date];
    
//    if ([_askDelegate respondsToSelector:@selector(pickerViewChanged:)]) {
//        [_askDelegate pickerViewChanged:self.dateStr];
//    }
}

-(void)cancelPicker{
    self.top = KScreenHeight;//
    DateAndTimeViewController *dateAndTime ;
    [dateAndTime dismiss:YES];
}

- (void)nextPicker{
    [cancelButton setTitle:@"<"];
    [cancelButton setAction:@selector(lastPicker)];
    [doneButton setTitle:@"确定"];
    [doneButton setAction:@selector(cancelPicker)];
    [itemText setTitle:@"时间选择"];
    [_datePicker setDatePickerMode:UIDatePickerModeTime];
}

- (void)lastPicker{
    [cancelButton setTitle:@"取消"];
    [cancelButton setAction:@selector(cancelPicker)];
    [doneButton setTitle:@">"];
    [doneButton setAction:@selector(nextPicker)];
    [itemText setTitle:@"日期选择"];
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    
}

-(NSString *)showPicker{
    CGFloat height = self.frame.size.height;
    self.top = KScreenHeight - height -64;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.dateStr = [dateFormatter stringFromDate:_datePicker.date];
    return self.dateStr;
    
}
@end

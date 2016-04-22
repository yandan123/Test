//
//  ViewController.m
//  category
//
//  Created by 严丹 on 16/4/21.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "ViewController.h"
#import <PureLayout/PureLayout.h>

@interface ViewController ()
{
    UILabel *resultLabel;
    NSInteger num;
    NSInteger sum;
    NSMutableString *str;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    str =  [[NSMutableString alloc] init];
    resultLabel = [[UILabel alloc] init];
    resultLabel.backgroundColor = [UIColor clearColor];
    resultLabel.layer.cornerRadius = 5;
    resultLabel.layer.borderWidth = 1;
    resultLabel.layer.borderColor = [UIColor blackColor].CGColor;
    resultLabel.clipsToBounds = YES;
    resultLabel.text = @"0";
    resultLabel.textColor = [UIColor blackColor];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    
    [resultLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:resultLabel];
    
    [resultLabel autoSetDimension:ALDimensionHeight toSize:50];
    [resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:40];
    [resultLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:20];
    [resultLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-20];
    
    UIButton *numBtn1 = [self createBtn:@"1"];
    
    UIButton *numBtn2 = [self createBtn:@"2"];
    
    UIButton *numBtn3 = [self createBtn:@"3"];
    
    UIButton *numBtn4 = [self createBtn:@"4"];
    
    UIButton *clearBtn = [self createBtn:@"C"];
    
    UIButton *resaultBtn = [self createBtn:@"="];
    
    UIButton *addBtn = [self createBtn:@"+"];

    [numBtn1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:20];
    [numBtn1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:resultLabel withOffset:20];
    [numBtn1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:numBtn3 withOffset:-10];
    
    [numBtn2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:clearBtn withOffset:-10];
    [numBtn2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:numBtn1];
    [numBtn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:numBtn1 withOffset:10];
    [numBtn2 autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:numBtn1];
    [numBtn2 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:numBtn1];
    
    [numBtn3 autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:numBtn1];
    [numBtn3 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:numBtn1];
    [numBtn3 autoAlignAxis:ALAxisVertical toSameAxisOfView:numBtn1];
    [numBtn3 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view withOffset:-20];
    
    [numBtn4 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:numBtn1];
    [numBtn4 autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:numBtn1];
    [numBtn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:numBtn3 withOffset:10];
    [numBtn4 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:numBtn3];
    
    [clearBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-20];
    [clearBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:numBtn1];
    [clearBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:numBtn1];
    [clearBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:addBtn withOffset:-10];
    
    
    [addBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:clearBtn];
    [addBtn autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:clearBtn];
    [addBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:resaultBtn withOffset:-10];
    [addBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:clearBtn];
    
    [resaultBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:numBtn4];
    [resaultBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:clearBtn];
    [resaultBtn autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:clearBtn];
    [resaultBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:clearBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)createBtn:(NSString *)text{
    UIButton *numBtn = [[UIButton alloc] init];
    numBtn.backgroundColor = [UIColor blueColor];
    [numBtn setTitle:text forState:UIControlStateNormal];
    [self.view addSubview:numBtn];
    [numBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [numBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return numBtn;
}

- (void)btnClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [str appendString:[sender currentTitle]];//数字连续输入
    
    resultLabel.text=[NSString stringWithString:str];   //显示数值
    
    if ([btn.titleLabel.text isEqualToString:@"C"]){
        [str setString:@""];
        resultLabel.text = @"0";
    }else if ([btn.titleLabel.text isEqualToString:@"="]){
        sum = num + [str integerValue];
        [str setString:@""];
        resultLabel.text = [NSString stringWithFormat:@"%zi",sum];
    }else if([btn.titleLabel.text isEqualToString:@"+"]){
        [str setString:@""];
        num=[resultLabel.text doubleValue]; //保存输入的数值
    }
}
@end

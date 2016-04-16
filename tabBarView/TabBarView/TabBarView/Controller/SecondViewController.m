//
//  SecondViewController.m
//  TabBarView
//
//  Created by 严丹 on 16/4/15.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //回调viewDidOpen方法
    if ([_delegate conformsToProtocol:@protocol(ViewActionProtocol)]) {
        if ([_delegate respondsToSelector:@selector(viewDidOpen:)]) {
            [_delegate viewDidOpen:self];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeClick:(UIButton *)sender {
    
    //回调viewDidClose方法。关闭Navigation
    //[self.navigationController popViewControllerAnimated:YES];
    if ([_delegate conformsToProtocol:@protocol(ViewActionProtocol)]) {
        if ([_delegate respondsToSelector:@selector(viewDidClose:)]) {
            [_delegate viewDidClose:self];
            return ;
        }
    }
    
}

- (IBAction)secondSegment:(UISegmentedControl *)sender {
    //获取到选中segment的值
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    NSString *str = [segment titleForSegmentAtIndex:[segment selectedSegmentIndex]];
    
    // 回调传值给numLabel
    if ([_delegate respondsToSelector:@selector(setSelectStr:)]) {
        [_delegate setSelectStr:str];
    }
}

- (void)setSecondLabel:(NSString *)str{
    //不知道为什么加了这句nameLabel就不为NULL了
    UILabel *lab = [self.view viewWithTag:110];
    
    self.nameLabel.text = str;
   
}
@end

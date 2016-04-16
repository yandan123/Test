//
//  FirstViewController.m
//  TabBarView
//
//  Created by 严丹 on 16/4/15.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

//遵循这两个协议
@interface FirstViewController ()<ViewActionProtocol,MyProtocol>
{
    UIBarButtonItem *rightBtn;
    UIBarButtonItem *leftBtn;
    SecondViewController *fvc;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化FirstView界面
    self.title = @"FirstView";
    self.navigationItem.title = @"FirstView";
    
    // 设置导航条左右按钮和titleView
    rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:self action:@selector(editClick)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    leftBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraClick)];
    
    self.navigationItem.leftBarButtonItem = leftBtn;

    self.navigationItem.titleView = self.firstSegment;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)editClick{
    rightBtn.title = @"编辑";
    [rightBtn setAction:@selector(doneClick)];
    
}

- (void)doneClick{
    rightBtn.title = @"完成";
    [rightBtn setAction:@selector(editClick)];
}
//点击相机按钮调用
- (void)cameraClick{
    //加载SceondView xib
    fvc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
    
    // 设置代理
    fvc.delegate = self;
    
    //获取SegmentedControl，并获取其选择segment的值传值给SecondView
    UISegmentedControl *segment = (UISegmentedControl *)self.navigationItem.titleView;
    NSInteger index = [segment selectedSegmentIndex];
    NSString *str = [segment titleForSegmentAtIndex:index];
    [fvc setSecondLabel:str];
}

//点击segmentedControl调用
- (IBAction)FirstSegment:(UISegmentedControl *)sender {
//    NSString *str = [self.firstSegment titleForSegmentAtIndex:sender.tag];
//    NSLog(@"%@",str);
}


- (void)viewDidOpen:(SecondViewController *)fvc{
    NSLog(@"view did open is calling");
}
- (void)viewDidClose:(SecondViewController *)fvc{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//截收SecondView传过来的值并展示
- (void)setSelectStr:(NSString *)str{
    self.numLabel.text = str;
}
@end

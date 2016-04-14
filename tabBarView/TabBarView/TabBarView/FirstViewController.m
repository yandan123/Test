//
//  FirstViewController.m
//  HelloWorld
//
//  Created by ZhangBo on 11-12-10.
//  Copyright 2011年 ... All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController (Private)
- (void) sgChanged:(id)sender;
@end


@implementation FirstViewController
@synthesize segmentedControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) barEdit:(id)sender//点击完成按钮时调用
{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}
- (void) rightClick:(id)sender//点击右边按钮时调用
{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(barEdit:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
- (void) takePicture:(id)sender//点击相机按钮时调用
{
    /* 1. 创建第二个 ViewController */
    SecondViewController *svc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    /* 2. 把svc推到压栈 就是放在最上面 animated:以动画
     缺省是从右到左边的过程 */
    [self.navigationController pushViewController:svc animated:YES];
    
    //设置代理
    svc.delegate = self;
    
    //创建一个SegmentedControl选择器
    
    UISegmentedControl *sg = (UISegmentedControl *)self.navigationItem.titleView;
   
    NSInteger index = [sg selectedSegmentIndex];
    
    //判断是否选择Segment，防止程序崩溃
    if (index != -1) {
        NSString *str = [sg titleForSegmentAtIndex:index];
        
        /* 从FirstView--->SecondView传参数 */
        
        [svc setMyTitle:str];//设置SecondView的Label值
        svc->index = 100;
        svc.age = 20;
        [svc setAge:200];

    }
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"FirstView";
    self.navigationItem.title = @"FirstView";
    NSLog(@"navigation item %p ", self.navigationItem);
    
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]
                initWithTitle:@"右边" 
                style:UIBarButtonItemStylePlain 
                target:self 
                action:@selector(rightClick:)];
    /* 创建右边按钮 */
    self.navigationItem.rightBarButtonItem = rightBar;
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]
                initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                target:self 
                action:@selector(takePicture:)];
    //创建左边按钮
    self.navigationItem.leftBarButtonItem = leftBar;
    
    //self.navigationItem.titleView = segmentedControl;
    
    //Segment赋值
    NSArray *array = [NSArray arrayWithObjects:
                @"电影", @"连续剧", @"欧美", @"科幻", nil];
    UISegmentedControl *sg = [[UISegmentedControl alloc]
                            initWithItems:array];
    self.navigationItem.titleView = sg;
    [sg addTarget:self action:@selector(sgChanged:) forControlEvents:UIControlEventValueChanged];
}

//
- (void) sgChanged:(id)sender//选中Segment回调
{
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//设置是否支持屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//设置label文本内容为界面2选择到的Segment内容First or Second点击返回时调用
- (void) setSelectStr:(NSString *)str
{
    UILabel *label = (UILabel *)[self.view viewWithTag:99];
    label.text = [NSString stringWithString:str];
}
#pragma mark -
#pragma mark ViewActionDelegate
- (void) viewDidOpen:(SecondViewController *)svc//界面2初始化时调用
{
    NSLog(@"view did open is calling");
}
- (void) viewDidClose:(SecondViewController *)svc//在界面2中点击关闭按钮时调用
{
    NSLog(@"view did close is calling");
    //[svc.navigationController popViewControllerAnimated:YES];
    
    //关闭时取消NavigationView
    [svc dismissViewControllerAnimated:YES completion:nil];

}







@end

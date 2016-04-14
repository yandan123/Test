//
//  SecondViewController.m
//  HelloWorld
//
//  Created by ZhangBo on 11-12-10.
//  Copyright 2011年 ... All rights reserved.
//

#import "SecondViewController.h"

@interface UIView (MyLabel)
- (UILabel *) labelWithTag:(NSInteger)tag;
@end
@implementation UIView (MyLabel)
- (UILabel *) labelWithTag:(NSInteger)tag
{
    return (UILabel *) [self viewWithTag:tag];
}
@end


@implementation SecondViewController
@synthesize age;
@synthesize delegate;

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

- (void) sgClick:(id)sender
{
    /* 要得到当前选中的文本 然后在设置到FirstViewController中 
     */
    /* 1. 取得当前字符串 */
    UISegmentedControl *sg = (UISegmentedControl *)sender;
    
    NSString *str = [sg titleForSegmentAtIndex:[sg selectedSegmentIndex]];
    
    /* 2. 回调反设置回去 */
    if ([delegate respondsToSelector:@selector(setSelectStr:)]) {
        [delegate setSelectStr:str];
    }
    
}

- (void) closeClick:(id)sender//关闭按钮回调
{
    if ([delegate conformsToProtocol:@protocol(ViewActionInterface)]) {
        if ([delegate respondsToSelector:@selector(viewDidClose:)]) {
            [delegate viewDidClose:self];
            return ;
        } 
    }  
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UISegmentedControl *sg = (UISegmentedControl *)
    [self.view viewWithTag:101];
    [sg addTarget:self action:@selector(sgClick:) forControlEvents:UIControlEventValueChanged];
    
    //获取Tag为102的按钮
    UIButton *button = (UIButton *)[self.view
                            viewWithTag:102];
    [button addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if ([delegate conformsToProtocol:@protocol(ViewActionInterface)]) {
        if ([delegate respondsToSelector:@selector(viewDidOpen:)]) {
            [delegate viewDidOpen:self];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//设置是否屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) setMyTitle:(NSString *)title//选中界面一中的Segmente时调用
{
    /* 根据情况来设置 Label里面的值 tag为100的label */
  //  UILabel *label = (UILabel *)[self.view viewWithTag:100];
    UILabel *label = [self.view labelWithTag:100];
    label.text = [NSString stringWithString:title];
}


@end

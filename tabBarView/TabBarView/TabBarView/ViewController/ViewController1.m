//
//  ViewController1.m
//  TabBarView
//
//  Created by 严丹 on 16/4/13.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "ViewController1.h"
#import "TableView1.h"
#import "FirstViewController.h"
@interface ViewController1 ()<changeProtocol>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labelItem = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    labelItem.text = @"日期";
    labelItem.textColor = [UIColor blackColor];
    labelItem.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:labelItem];
    
    TableView1 *firstTable = [[TableView1 alloc] initWithFrame:CGRectMake(0, 80, KScreenWidth-20, KScreenHeight-150) style:UITableViewStylePlain];
    firstTable.changeDelegate = self;

    [self.view addSubview:firstTable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)changeView:(NSInteger)selectIndex{
    if (selectIndex == 4) {
        /* 自己手工创建一个FirstViewController对象
         这个对象使用 FirstViewController作为 界面文件
         nib就是xib的二进制文件 */
        FirstViewController *fvc = [[FirstViewController alloc]
                                    initWithNibName:@"FirstViewController" bundle:nil];
        
        /* 创建一个UINavigationController导航控制器
         这个导航控制器里面initWithRootViewController就是
         导航控制器的根视图控制对象  这里使用fvc来作为根视图控制器 */
        CustomNavigationViewController *nav = [[CustomNavigationViewController alloc] initWithRootViewController:fvc];
        /*切换到FirstView界面*/
        [self presentViewController:nav animated:YES completion:nil];
    }
}

@end

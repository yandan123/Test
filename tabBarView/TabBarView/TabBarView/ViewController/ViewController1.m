//
//  ViewController1.m
//  TabBarView
//
//  Created by 严丹 on 16/4/13.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "ViewController1.h"
#import "TableView1.h"
@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labelItem = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    labelItem.text = @"日期";
    labelItem.textColor = [UIColor blackColor];
    labelItem.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:labelItem];
    
    TableView1 *firstTable = [[TableView1 alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width-20, self.view.frame.size.height-150) style:UITableViewStylePlain];

    [self.view addSubview:firstTable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

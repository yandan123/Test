//
//  ViewController2.m
//  TabBarView
//
//  Created by 严丹 on 16/4/13.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "ViewController2.h"
#import "TableView2.h"
@interface ViewController2 ()

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    
        TableView2 *firstTable = [[TableView2 alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width-20, self.view.frame.size.height-80) style:UITableViewStylePlain];
    
    [self.view addSubview:firstTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

//
//  CustomTableView.m
//  TabBarView
//
//  Created by 严丹 on 16/4/14.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    return cell;
}

@end

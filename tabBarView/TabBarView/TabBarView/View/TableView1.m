//
//  TableView.m
//  TabBarView
//
//  Created by 严丹 on 16/4/14.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "TableView1.h"

@implementation TableView1

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style 
{
    self = [super initWithFrame:frame style:style];
    if(!self) return nil;
    
    self.delegate = self;
    self.dataSource = self;
    
    return self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 22;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"day%02zi",indexPath.row+1]];
    
    [cell.textLabel setTextColor:[UIColor blackColor]];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_changeDelegate && [_changeDelegate respondsToSelector:@selector(changeView:) ]) {
        [_changeDelegate changeView:indexPath.row];
    }

}

@end

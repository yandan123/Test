//
//  TableView.h
//  TabBarView
//
//  Created by 严丹 on 16/4/14.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol changeProtocol <NSObject>
@optional
- (void)changeView:(NSInteger)selectIndex;
@end
@interface TableView1 : UITableView
<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic,assign)id <changeProtocol> changeDelegate;
@end

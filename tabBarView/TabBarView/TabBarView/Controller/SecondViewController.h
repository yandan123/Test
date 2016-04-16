//
//  SecondViewController.h
//  TabBarView
//
//  Created by 严丹 on 16/4/15.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"
#import "FirstViewController.h"

//后面要用到名为ViewActionProtocol的协议，所以要先声明这个协议
@protocol ViewActionProtocol;

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

- (IBAction)closeClick:(UIButton *)sender;
- (IBAction)secondSegment:(UISegmentedControl *)sender;
- (void)setSecondLabel:(NSString *)str;

//声明一个代理
@property (nonatomic,assign) id <ViewActionProtocol,MyProtocol> delegate;

@end

//声明一个协议
@protocol ViewActionProtocol <NSObject>

- (void) viewDidOpen:(SecondViewController *)fvc;
- (void) viewDidClose:(SecondViewController *)fvc;

@end



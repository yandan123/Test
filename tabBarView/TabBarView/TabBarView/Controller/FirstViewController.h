//
//  FirstViewController.h
//  TabBarView
//
//  Created by 严丹 on 16/4/15.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *numLabel;

- (IBAction)FirstSegment:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *firstSegment;
@end

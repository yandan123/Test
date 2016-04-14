//
//  FirstViewController.h
//  HelloWorld
//
//  Created by ZhangBo on 11-12-10.
//  Copyright 2011年 ... All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"
#import "SecondViewController.h"

@interface FirstViewController : UIViewController 
    <MyProtocol, ViewActionInterface>
{
    UISegmentedControl *segmentedControl;    
}
- (void) setSelectStr:(NSString *)str;

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

@end

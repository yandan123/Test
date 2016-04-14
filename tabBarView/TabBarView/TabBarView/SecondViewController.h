//
//  SecondViewController.h
//  HelloWorld
//
//  Created by ZhangBo on 11-12-10.
//  Copyright 2011年 ... All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"

//#if 0
//@class SecondViewController;
///* 前向申明SecondViewController */
//@protocol ViewActionInterface <NSObject>
//
//- (void) viewDidOpen:(SecondViewController *)svc;
//- (void) viewDidClose:(SecondViewController *)svc;
//
//@end
//#endf
@protocol ViewActionInterface;

@interface SecondViewController : UIViewController {
@public
    int index;
    int age;
}
@property (nonatomic, assign)
    id <MyProtocol, ViewActionInterface> delegate;

@property (assign) int age;
- (void) setMyTitle:(NSString *)title;

@end


@protocol ViewActionInterface <NSObject>

- (void) viewDidOpen:(SecondViewController *)svc;
- (void) viewDidClose:(SecondViewController *)svc;

@end


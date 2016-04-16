//
//  MyProtocol.h
//  TabBarView
//
//  Created by 严丹 on 16/4/15.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol MyProtocol <NSObject>

@required//必须实现的方法
- (void) setSelectStr:(NSString *)str;
@optional//可以不实现的方法
- (void) setSelectStr2:(NSString *)str;

@end
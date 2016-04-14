//
//  MyProtocol.h
//  HelloWorld
//
//  Created by ZhangBo on 11-12-10.
//  Copyright 2011年 ... All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol MyProtocol <NSObject>

@required
- (void) setSelectStr:(NSString *)str;
@optional
- (void) setSelectStr2:(NSString *)str;

@end

//
//  NSDate＋utility.h
//  TabBarView
//
//  Created by 严丹 on 16/4/14.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utility)
+(NSInteger) calcDaysFromBegin:(NSDate *)inBegin end:(NSDate *)inEnd;
+(NSDate *)dateFromString:(NSString *)dateString;
@end

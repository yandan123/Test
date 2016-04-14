//
//  NSDate＋utility.m
//  TabBarView
//
//  Created by 严丹 on 16/4/14.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "NSDate＋Utility.h"

@implementation NSDate (Utility)

+(NSInteger) calcDaysFromBegin:(NSDate *)inBegin end:(NSDate *)inEnd
{
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [cal components:unitFlags fromDate:inBegin];
    NSDate *newBegin  = [cal dateFromComponents:comps];
    
    NSCalendar *cal2 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps2 = [cal2 components:unitFlags fromDate:inEnd];
    NSDate *newEnd  = [cal2 dateFromComponents:comps2];
    
    NSTimeInterval interval = [newEnd timeIntervalSinceDate:newBegin];
    NSInteger beginDays=((NSInteger)interval)/(3600*24);
    
    return beginDays;
}

+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
    
}


@end

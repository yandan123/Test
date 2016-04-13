//
//  AppDelegate.m
//  TabBarView
//
//  Created by 严丹 on 16/4/13.
//  Copyright © 2016年 yandan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"
@interface AppDelegate ()
{
    UITabBarController* tabBarViewController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self createTarBal];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)createTarBal{
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setMonth:04];
    [comp setDay:10];
    [comp setYear:2016];
    NSCalendar *myCal = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *myDate1 = [myCal dateFromComponents:comp];

    
    NSDate *nowDate = [NSDate date];
   
    
    NSInteger date = [self calcDaysFromBegin:myDate1 end:nowDate];
    NSString * date1 = [NSString stringWithFormat:@"%zi",date];
    tabBarViewController = [[UITabBarController alloc]init];
    [self.window setRootViewController:tabBarViewController];
    
    ViewController1 *first = [[ViewController1 alloc]init];
    ViewController2* second = [[ViewController2 alloc]init];
    tabBarViewController.viewControllers = [NSArray arrayWithObjects:first, second, nil];
    tabBarViewController.tabBar.backgroundColor = [UIColor orangeColor];
    first.tabBarItem.title = @"项目一";
    
    first.tabBarItem.badgeValue = date1;
    second.tabBarItem.title = @"项目二";
    second.tabBarItem.badgeValue = date1;
}

-(NSInteger) calcDaysFromBegin:(NSDate *)inBegin end:(NSDate *)inEnd
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

@end

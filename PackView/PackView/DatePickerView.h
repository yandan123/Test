//
//  DatePickerView.h
//  BeiZhi
//
//  Created by ZhangBo on 16/3/8.
//  Copyright © 2016年 ls. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AskforProtocol.h"

@interface DatePickerView : UIView
@property (nonatomic,strong) NSString * dateStr;
-(NSString *)showPicker;
//@property(nonatomic,assign) id <AskforProtocol> askDelegate;
@end

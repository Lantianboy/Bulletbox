//
//  AppUtils.m
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/19.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "AppUtils.h"
#import "SVProgressHUD.h"
@implementation AppUtils

+ (void)initialize  {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

#pragma mark - SVProgressHUD
+ (void)showSuccessMessage:(NSString *)message {
    [SVProgressHUD showSuccessWithStatus:message];
    
}

+ (void)showErrorMessage:(NSString *)message {
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)showProgressMessage:(NSString *)message {
    if (message.length == 0) {
        [SVProgressHUD show];
    }else {
        [SVProgressHUD showWithStatus:message];
    }
}
+ (void)dismissHUD {
    [SVProgressHUD dismiss];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    return [format stringFromDate:date];
}



@end

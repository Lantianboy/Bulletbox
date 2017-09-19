//
//  AppUtils.h
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/19.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject



/*********** SVProgessHUD **********/
//弹出操作错误信息提示框
+ (void)showErrorMessage:(NSString *)message;
//弹出操作成功信息提示框
+ (void)showSuccessMessage:(NSString *)message;
//弹出加载提示框
+ (void)showProgressMessage:(NSString *) message;
//取消弹出框
+ (void)dismissHUD;

/*********** NSDate **********/
+ (NSString *)stringFromDate:(NSDate *)date;


@end

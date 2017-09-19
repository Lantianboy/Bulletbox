//
//  FilterView.h
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/12.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomInputAccessoryView.h"
#import "AppUtils.h"
@protocol FilterViewdelegate <NSObject>

/**
 代理方法 传值

 @param beginDate 开始时间
 @param endDate 结束时间
 @param custName 姓名
 @param mobile 手机号
 @param number 身份证号
 */
- (void)FilterViewWithBeginDate:(NSString *)beginDate endDate:(NSString *)endDate custName:(NSString *)custName mobile:(NSString *)mobile number:(NSString *)number ;

@end


@interface FilterView : UIView

@property (weak, nonatomic) IBOutlet UITextField *mobileTf ;
@property (weak, nonatomic) IBOutlet UITextField *IdentificationNumberTf ;
@property (nonatomic, strong) UIView * bgeView ;

@property(nonatomic ,assign) id<FilterViewdelegate>delegate ;

@property (nonatomic, assign) CGFloat y;




+ (instancetype)FilterView ;

@end

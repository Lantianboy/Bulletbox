//
//  ViewController.h
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/12.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterView.h"

@interface ViewController : UIViewController<FilterViewdelegate>
{
    BOOL _isFilter;
    
    NSString *_filter_beginDate;
    NSString *_filter_endDate;
    NSString *_filter_custName;
    NSString *_filter_mobile;
    NSString *_filter_IdentificationNumber ;
    

}

@property (nonatomic, strong) FilterView *filterView;

// add
@property (nonatomic, assign) BOOL isTeam;
@property (nonatomic, strong) UITableView * tab ;
@property (nonatomic, strong) UILabel * la ;
@property (nonatomic, strong) NSMutableArray * mut ;
@property (nonatomic, strong) UIImageView * im ;

@end


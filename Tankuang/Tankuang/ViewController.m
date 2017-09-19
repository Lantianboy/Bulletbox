//
//  ViewController.m
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/12.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "ViewController.h"
//屏幕宽
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//屏幕高
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearData] ;
    [self initUI] ;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)clearData
{
    _isFilter = NO;
    _filter_beginDate = nil ;
    _filter_endDate = nil ;
    _filter_custName = nil ;
    _filter_mobile = nil ;
    _filter_IdentificationNumber = nil ;
    //self.bgView = nil ;
    self.filterView = nil ;
}

-(void)initUI
{
    
     [self.view addSubview:self.filterView] ;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //导航栏设置
    self.navigationItem.title = @"首页" ;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(filter)] ;
                                               
                                               
                                               
                                               
                                               
                                               
                                               
}


#pragma mark - action 弹窗动画
- (void)filter {
    
    _isFilter = !_isFilter ;
    
    if (self.filterView.bgeView) {
        self.filterView.bgeView.hidden = YES;
    }
    
    if (_isFilter) {
        
        self.navigationItem.rightBarButtonItem.title = @"取消" ;
       
//        self.la.hidden = YES ;
//        self.im.hidden = YES ;
        //UIView 阻力动画(Spring动画)
        //animateWithDuration      动画时间
        //usingSpringWithDamping   阻力值 0-1
        //initialSpringVelocity    动力值 越小弹力越小
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.filterView.y = 0 ;
            //self.bgView.hidden = NO ;
            
        } completion:^(BOOL finished) {
            
        }] ;
    }else {
        
        
        self.navigationItem.rightBarButtonItem.title = @"筛选" ;
        [[UIApplication sharedApplication].keyWindow endEditing:YES] ;
        
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
            //self.bgView.hidden = YES ;
            self.filterView.y -= SCREEN_HEIGHT  ;
            
        } completion:^(BOOL finished) {
            
            
            
        }] ;
        
//        self.la.hidden = NO ;
//        self.im.hidden = NO ;
        
        
    }
    
}

- (FilterView *)filterView {
    if (!_filterView) {
        _filterView = [FilterView FilterView] ;
        _filterView.frame = CGRectMake(0, -SCREEN_HEIGHT+128, SCREEN_WIDTH, -SCREEN_HEIGHT + 64 ) ;
        
        _filterView.delegate = self;
    }
    return _filterView ;
}

#pragma mark - SLPerformanceManagementFilterViewDelegate
- (void)FilterViewWithBeginDate:(NSString *)beginDate
                              endDate:(NSString *)endDate
                             custName:(NSString *)custName
                               mobile:(NSString *)mobile
                               number:(NSString *)number; {

    
    [self filter] ;
    
    //获得输入的内容
    _filter_beginDate = beginDate ;
    _filter_endDate = endDate ;
    _filter_custName = custName ;
    _filter_mobile = mobile ;
    _filter_IdentificationNumber = number ;
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

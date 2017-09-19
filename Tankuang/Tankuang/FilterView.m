//
//  FilterView.m
//  Tankuang
//
//  Created by 最爱是深蓝 on 2017/9/12.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "FilterView.h"

@interface FilterView()<CustomInputAccessoryViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *resetButton ;

@property (weak, nonatomic) IBOutlet UIButton *confirmButton ;

@property (weak, nonatomic) IBOutlet UITextField *nameTf ;
@property (weak, nonatomic) IBOutlet UIView *dateTimeView ;
@property (weak, nonatomic) IBOutlet UITextField *beginDateTf ;
@property (weak, nonatomic) IBOutlet UITextField *endDateTf ;

@property (nonatomic, strong) UIDatePicker * datePicker ;
@property (nonatomic, strong) CustomInputAccessoryView * accessoryView ;


@property (weak, nonatomic) IBOutlet UILabel *mobile ;
@property (weak, nonatomic) IBOutlet UILabel *name ;
@property (weak, nonatomic) IBOutlet UILabel *number ;

@end



@implementation FilterView

+ (instancetype)FilterView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FilterView class]) owner:self options:nil] lastObject] ;
}


-(void)awakeFromNib
{
    [super awakeFromNib] ;
    [self setup] ;
    
}

-(void)setup
{
    self.backgroundColor = [UIColor groupTableViewBackgroundColor] ;
    
    self.beginDateTf.layer.borderWidth = 0.5 ;
    self.beginDateTf.layer.borderColor = [UIColor grayColor].CGColor ;
    self.beginDateTf.inputView = self.datePicker ;
    self.beginDateTf.inputAccessoryView =self.accessoryView ;
    self.beginDateTf.delegate = self ;
    self.beginDateTf.tag = 101 ;
    
    self.endDateTf.layer.borderWidth = 0.5 ;
    self.endDateTf.layer.borderColor = [UIColor grayColor].CGColor ;
    self.endDateTf.inputView = self.datePicker ;
    self.endDateTf.inputAccessoryView = self.accessoryView ;
    self.endDateTf.delegate = self ;
    self.endDateTf.tag = 102 ;
    
    self.dateTimeView.layer.borderWidth = 0.5 ;
    self.dateTimeView.layer.borderColor = [UIColor grayColor].CGColor ;
    
    self.nameTf.leftViewMode = UITextFieldViewModeAlways ;
    self.nameTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 14, 44)] ;
    
    self.nameTf.delegate = self ;
    
    self.mobileTf.leftViewMode = UITextFieldViewModeAlways ;
    self.mobileTf.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 14, 44)] ;
   
    self.mobileTf.delegate = self ;
    
    self.IdentificationNumberTf.leftViewMode = UITextFieldViewModeAlways ;
    self.IdentificationNumberTf.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 14, 44)] ;
    
    self.IdentificationNumberTf.delegate = self ;
    
    //self.resetButton.layer.cornerRadius = 5 ;
    [self.resetButton addTarget:self action:@selector(resetButtonClick:) forControlEvents:UIControlEventTouchUpInside] ;
    //self.confirmButton.layer.cornerRadius = 5 ;
    [self.confirmButton addTarget:self action:@selector(confirmButtonClick:) forControlEvents:UIControlEventTouchUpInside] ;
    
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)] ;
//    [self addGestureRecognizer:tap] ;

    
}
//清空内容
- (void)reset
{
    self.beginDateTf.text = nil ;
    self.endDateTf.text =nil ;
    self.nameTf.text =nil ;
    self.mobileTf.text = nil ;
    self.IdentificationNumberTf.text =nil ;
    [[UIApplication sharedApplication].keyWindow endEditing:YES] ;
    
    
}

//重制按钮
- (void)resetButtonClick:(UIButton * )btn
{
    
    [self reset] ;
}

//textfiled代理
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    
}


- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
//确定按钮
- (void)confirmButtonClick:(UIButton * )btn
{

    //第一事件响应
    [[UIApplication sharedApplication].keyWindow endEditing:YES] ;
    
    if ([self.delegate respondsToSelector:@selector(FilterViewWithBeginDate:endDate:custName:mobile:number:)]) {
        [self.delegate FilterViewWithBeginDate:self.beginDateTf.text endDate:self.endDateTf.text custName:self.nameTf.text mobile:self.mobileTf.text number:self.IdentificationNumberTf.text] ;
    }
}


//datePicker
- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init] ;
        _datePicker.datePickerMode = UIDatePickerModeDate ;
        _datePicker.backgroundColor = [UIColor whiteColor] ;
        NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ;
        _datePicker.locale = locale ;
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd"] ;
            }
    return _datePicker ;
}


- (CustomInputAccessoryView *)accessoryView
{
    if (!_accessoryView) {
        _accessoryView = [[CustomInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)] ;
        _accessoryView.customDelegate = self ;
        
    }
    return _accessoryView ;
}

- (void)customInputAccessoryViewCancel
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES] ;
    
}


//日期确定按钮
- (void)customInputAccessoryViewConfirm
{
    
    NSString *currenDate = [AppUtils stringFromDate:[NSDate date]];
    if (self.beginDateTf.isFirstResponder) {
        NSString * beginDate = [AppUtils stringFromDate:self.datePicker.date] ;
        if (self.endDateTf.text.length) {
            if ([self beginDateBiggerEndDate:beginDate endDate:self.endDateTf.text]) return ;
                
            }
        NSComparisonResult resul = [beginDate compare:currenDate] ;
        if (resul == NSOrderedDescending) {
            [AppUtils showErrorMessage:@"选择日期不能超过今天"] ; return ;
        }
        self.beginDateTf.text = beginDate ;
    }else{
        NSString *endDate = [AppUtils stringFromDate:self.datePicker.date];
        if (self.beginDateTf.text.length) {
            if ([self beginDateBiggerEndDate:self.beginDateTf.text endDate:endDate]) return;
        }
        
        NSComparisonResult result = [endDate compare:currenDate];
        if (result == NSOrderedDescending) {
            [AppUtils showErrorMessage:@"选择日期不能超过今天"]; return;
        }
        
        self.endDateTf.text = endDate;
    }
    _bgeView.hidden = YES ;
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];

    


}
//限制日期选择
- (BOOL)beginDateBiggerEndDate:(NSString *)beginDate endDate:(NSString *)endDate {
    NSInteger beginDateYear = [[beginDate substringToIndex:4] integerValue];
    NSInteger beginDateMonth = [[beginDate substringWithRange:NSMakeRange(5, 2)] integerValue];
    NSInteger beginDateDay = [[beginDate substringWithRange:NSMakeRange(8, 2)] integerValue];
    
    NSInteger endDateYear = [[endDate substringToIndex:4] integerValue];
    NSInteger endDateMonth = [[endDate substringWithRange:NSMakeRange(5, 2)] integerValue];
    NSInteger endDateDay = [[endDate substringWithRange:NSMakeRange(8, 2)] integerValue];
    
    if (beginDateYear > endDateYear) {
        [AppUtils showErrorMessage:@"开始日期不能超过结束日期"];
        return YES;
    } else if (beginDateMonth > endDateMonth) {
        [AppUtils showErrorMessage:@"开始日期不能超过结束日期"];
        return YES;
    } else if (beginDateDay > endDateDay) {
        [AppUtils showErrorMessage:@"开始日期不能超过结束日期"];
        return YES;
    }
    
    return NO;
}



#pragma mark - UITextField 限制输入字符长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.nameTf) {
        if (textField.text.length + string.length > 8) {
            return NO ;
        }else {
            return YES ;
        }
    }else if (textField == self.mobileTf) {
        if (textField.text.length + string.length > 11) {
            return NO ;
        }else{
            return YES ;
        }
    }else {
        if (textField.text.length + string.length > 18) {
            return NO ;
        }else {
            return YES ;
        }
    }
    return nil ;
}



@end

//
//  CustomInputAccessoryView.m
//  XSD
//
//  Created by wuqh on 15/9/11.
//  Copyright (c) 2015年 SL. All rights reserved.
//

#import "CustomInputAccessoryView.h"
//屏幕宽
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//屏幕高
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@implementation CustomInputAccessoryView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
//        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
//        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [leftButton setTitle:@"确定" forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(SCREEN_WIDTH*0.5, 0, SCREEN_WIDTH*0.5, self.frame.size.height);
        [leftButton addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
        leftButton.layer.borderColor = [UIColor grayColor].CGColor;
        leftButton.layer.borderWidth = 0.5;
        [self addSubview:leftButton];
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rightButton setTitle:@"取消" forState:UIControlStateNormal];
        rightButton.frame = CGRectMake(0, 0, SCREEN_WIDTH*0.5, self.frame.size.height);
        rightButton.layer.borderColor = [UIColor grayColor].CGColor;
        rightButton.layer.borderWidth = 0.5;
        [rightButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
        
    
   
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return self;
}

- (void)cancel:(UIBarButtonItem *)item {
    if ([self.customDelegate respondsToSelector:@selector(customInputAccessoryViewCancel)]) {
        [self.customDelegate customInputAccessoryViewCancel];
    }
}

- (void)confirm:(UIBarButtonItem *)item {
    if ([self.customDelegate respondsToSelector:@selector(customInputAccessoryViewConfirm)]) {
        [self.customDelegate customInputAccessoryViewConfirm];
    }
}

@end

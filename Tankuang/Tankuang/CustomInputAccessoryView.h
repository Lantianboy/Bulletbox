//
//  CustomInputAccessoryView.h
//  XSD
//
//  Created by wuqh on 15/9/11.
//  Copyright (c) 2015年 SL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomInputAccessoryViewDelegate <NSObject>

@required
- (void)customInputAccessoryViewCancel;
- (void)customInputAccessoryViewConfirm;

@end

@interface CustomInputAccessoryView : UIView
@property (nonatomic, weak) id<CustomInputAccessoryViewDelegate> customDelegate;
@end

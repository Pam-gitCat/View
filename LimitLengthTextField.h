//
//  LimitLengthTextField.h
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LimitLengthTextField : UITextField
@property (nonatomic, assign) NSInteger maxLength;

-(instancetype)initWithFrame:(CGRect)frame maxLength:(NSInteger)maxLength;
@end

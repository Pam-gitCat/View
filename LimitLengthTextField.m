//
//  LimitLengthTextField.m
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "LimitLengthTextField.h"

@implementation LimitLengthTextField
-(instancetype)initWithFrame:(CGRect)frame maxLength:(NSInteger)maxLength
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _maxLength = maxLength;
    }
    return self;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    BOOL isChinese;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    if ([current.primaryLanguage isEqualToString: @"en-US"]) {
        isChinese = NO;
    }
    else {
        isChinese = YES;
    }
    NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
    if (isChinese) { //中文输入法下
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if ( str.length >= _maxLength) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:_maxLength]];
            }
        }
    }else {
        if ([str length] >= _maxLength) {
            NSString *strNew = [NSString stringWithString:str];
            [self setText:[strNew substringToIndex:_maxLength]];
        }
    }
}
@end

//
//  CopyLabel.m
//  Knorr
//
//  Created by tom.sun on 16/6/2.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "CopyLabel.h"

@implementation CopyLabel
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

-(void)copy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self addGestureRecognizer:longPress];
}

-(void)longPressAction:(UILongPressGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WillHideMenu:)name:UIMenuControllerWillHideMenuNotification object:nil];
    self.backgroundColor = UIColorFromRGB(0xf0f0f0);
}

- (void)WillHideMenu:(id)sender
{
    [self setBackgroundColor:[UIColor whiteColor]];
}
@end

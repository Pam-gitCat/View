//
//  PlaceholderTextView.h
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView
@property (nonatomic, strong) UITextView *placeholderView;
@property (nonatomic, strong) NSString *placeholder;
@end

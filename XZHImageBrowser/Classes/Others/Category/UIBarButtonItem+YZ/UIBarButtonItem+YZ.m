//
//  UIBarButtonItem+YZ.m
//  ez
//
//  Created by apple on 14-8-15.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "UIBarButtonItem+YZ.h"
#import "XZHBaseButton.h"
@implementation UIBarButtonItem (YZ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    XZHBaseButton *button = [XZHBaseButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

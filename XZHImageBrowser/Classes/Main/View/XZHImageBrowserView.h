//
//  RXPicBrowseView.h
//  RenXing
//
//  Created by ycmedia_imac on 16/8/2.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZHImageBrowserView : UIScrollView

/* 带frame的scrollView */
- (id)initWithFrame:(CGRect)frame;

/* 设置图片数据 */
-(void)setImageData:(NSArray *)imgDataArr;



/* 带frame的scrollView，加载存放链接的数组 */
- (id)initWithFrame:(CGRect)frame imgArrs:(NSArray *)imgArrs;
/* 带frame的scrollView，加载存放链接的数组，加载存放文字的数组 */
- (id)initWithFrame:(CGRect)frame imgArrs:(NSMutableArray *)imgArrs contents:(NSMutableArray *)contents;

@end

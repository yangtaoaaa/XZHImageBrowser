//
//  XZHConvertOneScrollView.h
//  XZHImageBrowser
//
//  Created by ycmedia_imac on 16/8/22.
//  Copyright © 2016年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZHConvertOneScrollView : UIScrollView


/* 浏览器中我是第几个图片 */
@property(nonatomic,assign)NSInteger index;
/* 加载web图片 */
- (void)setWebImage:(NSString *)imgUrlStr;
//回复放大缩小前的原状
-(void)reloadFrame;

@end

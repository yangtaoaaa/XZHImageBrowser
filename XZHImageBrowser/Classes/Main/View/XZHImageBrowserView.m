//
//  RXPicBrowseView.m
//  RenXing
//
//  Created by ycmedia_imac on 16/8/2.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "XZHImageBrowserView.h"

@interface XZHImageBrowserView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, strong) NSArray *imageArrs; // 图片数组
@property (nonatomic, strong) NSArray *contentArrs; // 内容
@property (nonatomic, assign) NSInteger curPage; // 当前页
@property (nonatomic, assign) NSInteger totalPage; // 总页数

@end

@implementation XZHImageBrowserView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
        scrollView.backgroundColor = [UIColor whiteColor];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        self.scrollView = scrollView;
        [self addSubview:scrollView];
    }
    return self;
}

#pragma mark - 拿到数据时展示
-(void)setImageData:(NSArray *)imgDataArr{
}

#pragma mark - 重载init方法-----暂时不用了
- (id)initWithFrame:(CGRect)frame imgArrs:(NSArray *)imgArrs{
    self = [self initWithFrame:frame];
    CGFloat imageH = self.scrollView.height;
    CGFloat imageW = self.scrollView.width;
    self.totalPage = imgArrs.count;
    self.scrollView.contentSize = CGSizeMake(imageW * self.totalPage, 0);
    // 图片放上去
    for (int i = 0; i < imgArrs.count; i++) {
        CGFloat imageX = i * imageW;
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imgArrs[i]] placeholderImage:[UIImage imageNamed:@"no"]];
        [self.scrollView addSubview:imageView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imgArrs:(NSMutableArray *)imgArrs contents:(NSMutableArray *)contents{
    self = [self initWithFrame:frame imgArrs:imgArrs];
    return self;
}





@end






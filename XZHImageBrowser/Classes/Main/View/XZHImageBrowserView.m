//
//  RXPicBrowseView.m
//  RenXing
//
//  Created by ycmedia_imac on 16/8/2.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//  外面的大的scrollView

#import "XZHImageBrowserView.h"
#import "XZHConvertOneScrollView.h"
#import "XZHImage.h"

// 图片之间的间隙
#define gap 20

@interface XZHImageBrowserView() <UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, strong) NSArray *imageArrs; // 图片数组
@property (nonatomic, strong) NSArray *contentArrs; // 内容
@property (nonatomic, assign) NSInteger curPage; // 当前页
@property (nonatomic, assign) NSInteger totalPage; // 总页数

// 封装oneScrollView
@property (nonatomic, strong) NSMutableArray *oneScrollArr; 

@end

@implementation XZHImageBrowserView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        // 设置frame，注意宽度，注意宽度，注意宽度！！！！！！！
        self.frame = CGRectMake(-gap, 0, screenWidth + gap, screenHeight);
        self.backgroundColor = [UIColor blackColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
    }
    return self;
}

#pragma mark - 拿到数据时展示
-(void)setImageData:(NSArray *)imgDataArr{
    // 设置可滚动范围
    self.contentSize = CGSizeMake(self.width * imgDataArr.count, 0);
//    RXLog(@"scrollView是====%@", self);
    // 设置图片到每个单独的scrollView上面
    for(int i = 0; i < imgDataArr.count; i++){
        XZHImage *image = imgDataArr[i];
        XZHConvertOneScrollView *oneScrollView = [[XZHConvertOneScrollView alloc]init];
        oneScrollView.index = i;
        oneScrollView.frame = CGRectMake(i * self.width + gap, 0, screenWidth, screenHeight);
        // 加载图片
        [oneScrollView setWebImage:image.urlStr];
        [self addSubview:oneScrollView];
        // 单个的scrollView放到数组里面
        [self.oneScrollArr addObject:oneScrollView];
    }
}

#pragma mark - 滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger x = scrollView.contentOffset.x;
    NSInteger w = scrollView.width;
//    RXLog(@"contentOffset的x的值是=====%ld, scrollView的宽度是======%ld", x, w);
}

#pragma mark - 重载init方法-----暂时不用了
- (id)initWithFrame:(CGRect)frame imgArrs:(NSArray *)imgArrs{
    self = [self initWithFrame:frame];
    CGFloat imageH = self.height;
    CGFloat imageW = self.width;
    self.totalPage = imgArrs.count;
    self.contentSize = CGSizeMake(imageW * self.totalPage, 0);
    // 图片放上去
    for (int i = 0; i < imgArrs.count; i++) {
        CGFloat imageX = i * imageW;
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imgArrs[i]] placeholderImage:[UIImage imageNamed:@"no"]];
        [self addSubview:imageView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imgArrs:(NSMutableArray *)imgArrs contents:(NSMutableArray *)contents{
    self = [self initWithFrame:frame imgArrs:imgArrs];
    return self;
}

- (NSMutableArray *)oneScrollArr{
    if(_oneScrollArr == nil){
        _oneScrollArr = [NSMutableArray array];
    }
    return _oneScrollArr;
}




@end






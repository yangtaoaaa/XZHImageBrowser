//
//  XZHConvertOneScrollView.m
//  XZHImageBrowser
//
//  Created by ycmedia_imac on 16/8/22.
//  Copyright © 2016年 何紫璇. All rights reserved.
//

#import "XZHConvertOneScrollView.h"

@interface XZHConvertOneScrollView ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *mainImageView;

@end


@implementation XZHConvertOneScrollView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = YES;
        self.delegate = self;
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.5;
        
        //添加主图片显示View
        UIImageView *mainImageView = [[UIImageView alloc]init];
        mainImageView.userInteractionEnabled = NO;
        [self addSubview:mainImageView];
        self.mainImageView = mainImageView;
    }
    return self;
}

#define START_X 0
#define START_Y 30
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  100
//截取部分图像
//传入原始图片对象
-(UIImage *)getImageFromImage:(UIImage *)superImage Rect:(CGRect)rect{
    CGSize subImageSize = CGSizeMake(screenWidth, HEIGHT);
    //定义裁剪的区域相对于原图片的位置
    CGRect subImageRect = CGRectMake(rect.origin.x*3, rect.origin.y*3, rect.size.width*3, rect.size.height*3);
    CGImageRef imageRef = superImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, subImageRect);
    UIGraphicsBeginImageContext(subImageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, subImageRect, subImageRef);
    UIImage* subImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    //返回裁剪的部分图像
    return subImage;
}

#pragma mark - 加载网络图片
- (void)setWebImage:(NSString *)imgUrlStr{
    self.mainImageView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    // diy
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.mainImageView.clipsToBounds = YES;
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:imgUrlStr] placeholderImage:[UIImage imageNamed:@"no"]];
    [self setFrameAndZoom:self.mainImageView];//设置最新的网络下载后的图的frame大小
}

#pragma mark - 缩放的代理方法
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGFloat centerX = screenWidth / 2;
    CGFloat centerY = screenHeight / 2;
    self.mainImageView.centerX = centerX;
    self.mainImageView.centerY = centerY;
}

#pragma mark - 🈲计算frame 核心代码
-(void)setFrameAndZoom:(UIImageView *)imageView {
}

#pragma mark - 要进行缩放的控件
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.mainImageView;
}

#pragma mark - ❤️回复原状
-(void)reloadFrame
{
    self.zoomScale = 1;
}



@end





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
        self.userInteractionEnabled = YES;
        
        self.delegate = self;
        self.backgroundColor = [UIColor blackColor];
        //添加主图片显示View
        UIImageView *mainImageView = [[UIImageView alloc]init];
        mainImageView.userInteractionEnabled = NO;
        [self addSubview:mainImageView];
        self.mainImageView = mainImageView;
    }
    return self;
}

#pragma mark - 加载网络图片
- (void)setWebImage:(NSString *)imgUrlStr{
    self.mainImageView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    // diy
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.mainImageView.clipsToBounds = YES;
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:imgUrlStr] placeholderImage:[UIImage imageNamed:@"no"]];
    [self setFrameAndZoom:self.mainImageView];//设置最新的网络下载后的图的frame大小
//    self.maximumZoomScale =2;
//    self.minimumZoomScale =0.5;
}

#pragma mark - 🈲计算frame 核心代码
-(void)setFrameAndZoom:(UIImageView *)imageView {
    //ImageView.image的大小
    CGFloat   imageH;
    CGFloat   imageW;
    //设置空image时的情况
    if(imageView.image == nil || imageView.image.size.width == 0 || imageView.image.size.height ==0){
        //设置主图片
        imageH = screenHeight;
        imageW = screenWidth;
        self.mainImageView.image = [UIImage imageNamed:@"no"];
    }else{ //不空
        //设置主图片
        imageW  = imageView.image.size.width;
        imageH = imageView.image.size.height;
        self.mainImageView.image = imageView.image;
    }
    //设置主图片Frame 与缩小比例
    CGFloat  myH_ = screenHeight;
    CGFloat  myW_ = myH_ *(imageW/imageH);
    CGFloat  myX_ = screenWidth - myW_ - ((screenWidth - myW_)/2);
    CGFloat  myY_ = 0;
    //变换设置frame
    self.mainImageView.frame = CGRectMake(myX_, myY_, myW_, myH_);
    //判断原图是小图还是大图来判断,是可以缩放,还是可以放大
    if (imageH >  myH_) {
        self.maximumZoomScale =  2*(imageH/myH_ ) ;//放大比例
    }else{
        self.minimumZoomScale = (imageH/myH_);//缩小比例
    }
}

#pragma mark - ❤️滚动栏 代理方法
//开始缩放,一开始会自动调用几次,并且要返回告来诉scroll我要缩放哪一个控件.
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.mainImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize scrollSize = scrollView.bounds.size;
    CGRect imgViewFrame = self.mainImageView.frame;
    CGSize contentSize = scrollView.contentSize;
    CGPoint centerPoint = CGPointMake(contentSize.width/2, contentSize.height/2);
    
    // 竖着长的 就是垂直居中
    if (imgViewFrame.size.width <= scrollSize.width){
        centerPoint.x = scrollSize.width/2;
    }
    
    // 横着长的  就是水平居中
    if (imgViewFrame.size.height <= scrollSize.height)
    {
        centerPoint.y = scrollSize.height/2;
    }
    
    self.mainImageView.center = centerPoint;
}

@end





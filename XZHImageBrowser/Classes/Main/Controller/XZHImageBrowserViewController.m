//
//  XZHImageBrowserViewController.m
//  XZHImageBrowser
//
//  Created by ycmedia_imac on 16/8/5.
//  Copyright © 2016年 何紫璇. All rights reserved.
//

#import "XZHImageBrowserViewController.h"
#import "XZHImageBrowserView.h"
#import "XZHImage.h"

@interface XZHImageBrowserViewController ()

@property (nonatomic, strong) NSMutableArray *imgModelArr;

@end

@implementation XZHImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"图片浏览";
    [self setupImageBrowserView];
}

- (void)setupImageBrowserView{
    NSArray *imgUrlArr = @[
                        @"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg",
                        @"http://e.hiphotos.baidu.com/image/pic/item/8cb1cb134954092359d94e479758d109b3de4952.jpg",
                        @"http://h.hiphotos.baidu.com/image/pic/item/d50735fae6cd7b8959dc17ba0a2442a7d9330e52.jpg",
                        @"http://e.hiphotos.baidu.com/image/pic/item/8cb1cb1349540923592e4e479758d109b3de4947.jpg",
                        @"http://c.hiphotos.baidu.com/image/pic/item/4034970a304e251f0f44c9c1a286c9177f3e5353.jpg",
                        @"http://e.hiphotos.baidu.com/image/pic/item/ac6eddc451da81cb851baef45766d0160924310d.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/b8389b504fc2d562ecbafdd4e21190ef76c66c5c.jpg",
                        @"http://a.hiphotos.baidu.com/image/pic/item/6a600c338744ebf89a7496e0ddf9d72a6159a7ec.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/d6ca7bcb0a46f21fc748ac8cf2246b600d33aef5.jpg",
                        @"http://g.hiphotos.baidu.com/image/pic/item/ca1349540923dd54e8807039d309b3de9d8248f4.jpg",
                        @"http://a.hiphotos.baidu.com/image/pic/item/55e736d12f2eb938d3de795ad0628535e4dd6fe2.jpg",
                        @"http://d.hiphotos.baidu.com/image/pic/item/5fdf8db1cb134954ca0604bc524e9258d0094aca.jpg",
                        @"http://g.hiphotos.baidu.com/image/pic/item/060828381f30e9244e3f894a49086e061d95f736.jpg",
                        @"http://d.hiphotos.baidu.com/image/pic/item/6f061d950a7b0208e8c886f761d9f2d3572cc8a7.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/7e3e6709c93d70cffa476304fadcd100baa12b7e.jpg",
                        @"http://d.hiphotos.baidu.com/image/pic/item/b21c8701a18b87d6d4ab8326020828381f30fd1a.jpg",
                        @"http://h.hiphotos.baidu.com/image/pic/item/0824ab18972bd4078a2cfbc47e899e510fb3091b.jpg",
                        @"http://c.hiphotos.baidu.com/image/pic/item/1f178a82b9014a9014bb6e84ac773912b31bee06.jpg",
                        @"http://h.hiphotos.baidu.com/image/pic/item/0824ab18972bd4078a6dfbc47e899e510fb30964.jpg",
                        ];
    
    [self setupImageDataWithUrl:imgUrlArr];
//    XZHImageBrowserView *imgView = [[XZHImageBrowserView alloc]initWithFrame:self.view.bounds imgArrs:imgUrlArr];
//    [self.view addSubview:imgView];
}

- (void)setupImageDataWithUrl:(NSArray *)imgUrlArr{
    // 模型数组
    NSMutableArray *imgModelArr = [[NSMutableArray alloc]initWithCapacity:6];
    
    for(int i = 0; i < imgUrlArr.count; i++){
        XZHImage *imgModel = [[XZHImage alloc]init];
        // 暂时只有url，别的版本会加入imageView或者CGRect
        if(imgUrlArr == nil){
            imgModel.urlStr = @"";
        }else{
            imgModel.urlStr = imgUrlArr[i];
        }
        [imgModelArr addObject:imgModel];
    }
    // 传递模型包给ImageBrowser
    XZHImageBrowserView *imageView = [[XZHImageBrowserView alloc]init];
    [imageView setImageData:imgModelArr];
    [self.view addSubview:imageView];
}

- (NSMutableArray *)imgModelArr{
    if(_imgModelArr == nil){
        _imgModelArr = [NSMutableArray array];
    }
    return _imgModelArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end





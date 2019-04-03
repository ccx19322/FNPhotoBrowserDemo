//
//  ViewController.m
//  FNPhotoBrowseDemo
//
//  Created by chen cx on 2019/4/3.
//  Copyright © 2019 chen cx. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>
#import "FNPhotoBrowser.h"

@interface ViewController () <FNPhotoBrowserDatasource> {
    UIImageView *_imageView1;
    UIImageView *_imageView2;
    UIImageView *_imageView3;
}

@end

@implementation ViewController

- (NSArray<UIImageView*> *)sourceImages {
    return @[_imageView1,_imageView2,_imageView3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageView1 = [[UIImageView alloc] init];
    _imageView1.contentMode = UIViewContentModeScaleAspectFill;
    _imageView1.clipsToBounds = YES;
    [self.view addSubview:_imageView1];
    
    NSURL *url1 = [NSURL URLWithString:@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg"];
    [_imageView1 sd_setImageWithURL:url1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.width.height.mas_equalTo(100);
        make.left.mas_equalTo(50);
    }];
    
    
    _imageView2 = [[UIImageView alloc] init];
    _imageView2.contentMode = UIViewContentModeScaleAspectFill;
    _imageView2.clipsToBounds = YES;
    [self.view addSubview:_imageView2];
    
    NSURL *url2 = [NSURL URLWithString:@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg"];
    [_imageView2 sd_setImageWithURL:url2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(210);
        make.width.height.mas_equalTo(100);
        make.left.mas_equalTo(50);
    }];
    
    _imageView3 = [[UIImageView alloc] init];
    _imageView3.contentMode = UIViewContentModeScaleAspectFill;
    _imageView3.clipsToBounds = YES;
    [self.view addSubview:_imageView3];
    
    NSURL *url3 = [NSURL URLWithString:@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg"];
    [_imageView3 sd_setImageWithURL:url3];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(320);
        make.width.height.mas_equalTo(100);
        make.left.mas_equalTo(50);
    }];
    
    
    _imageView1.userInteractionEnabled = YES;
    [_imageView1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
}

- (void)tapClick:(UITapGestureRecognizer *)tagGesture {
    
    NSArray *images = @[@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg",@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg",@"http://wimg.spriteapp.cn/picture/2018/0521/5b024e06ca5b3_wpd_34.jpg"];
    UIImageView * imagev = (UIImageView *)tagGesture.self.view;
    FNPhotoBrowser *browser = [FNPhotoBrowser showPhotoBrowserWithCurrentImageIndex:0 imageCount:images.count datasource:self];
    browser.images = images;
    browser.sourceImageView = imagev;
    
    [browser setActionSheetWithTitle:@"请选择" delegate:nil cancelButtonTitle:@"取消" deleteButtonTitle:@"删除" otherButtonTitles:@"男",@"女", nil];
    
}


#pragma mark -- FNPhotoBrowserDataSource ---

- (UIImage *)photoBrowser:(FNPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    return self.sourceImages[index].image;
}

- (UIImageView *)photoBrowser:(FNPhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index {
    return self.sourceImages[index];
}


@end

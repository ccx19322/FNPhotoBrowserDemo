//
//  FNPhotoBrowserConfig.h
//  FNPhotoBrowserDemo
//
//  Created by Liushannoon on 16/7/16.
//  Copyright © 2016年 LiuShannoon. All rights reserved.
//

#import "UIView+FNExtension.h"
#import "UIImage+FNExtension.h"
#import "FNPhotoBrowserTypeDefine.h"

#import <SDWebImage/UIImageView+WebCache.h>

#define FNPhotoBrowserDebug 1
//是否开启断言调试模式
#define IsOpenAssertDebug 1
#define FNPhotoBrowserVersion @"1.2.0"

/**
 *  进度视图类型类型
 */
typedef NS_ENUM(NSUInteger, FNProgressViewMode){
    /**
     *  圆环形
     */
    FNProgressViewModeLoopDiagram = 1,
    /**
     *  圆饼型
     */
    FNProgressViewModePieDiagram = 2
};

// 图片保存成功提示文字
#define FNPhotoBrowserSaveImageSuccessText @" ^_^ 保存成功 ";
// 图片保存失败提示文字
#define FNPhotoBrowserSaveImageFailText @" >_< 保存失败 ";
// 网络图片加载失败的提示文字
#define FNPhotoBrowserLoadNetworkImageFail @">_< 图片加载失败"
#define FNPhotoBrowserLoadingImageText @" >_< 图片加载中,请稍后 ";

// browser背景颜色
#define FNPhotoBrowserBackgrounColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.95]
// browser 图片间的margin
#define FNPhotoBrowserImageViewMargin 10
// browser中显示图片动画时长
#define FNPhotoBrowserShowImageAnimationDuration 0.4f
// browser中显示图片动画时长
#define FNPhotoBrowserHideImageAnimationDuration 0.4f

// 图片下载进度指示进度显示样式（FNProgressViewModeLoopDiagram 环形，FNProgressViewModePieDiagram 饼型）
#define FNProgressViewProgressMode FNProgressViewModeLoopDiagram
// 图片下载进度指示器背景色
#define FNProgressViewBackgroundColor [UIColor clearColor]
// 图片下载进度指示器圆环/圆饼颜色
#define FNProgressViewStrokeColor [UIColor whiteColor]
// 图片下载进度指示器内部控件间的间距
#define FNProgressViewItemMargin 10
// 圆环形图片下载进度指示器 环线宽度
#define FNProgressViewLoopDiagramLineWidth 8

#define FNPBLog(...) FNFormatLog(__VA_ARGS__)

#if FNPhotoBrowserDebug
#define FNFormatLog(...)\
{\
NSString *string = [NSString stringWithFormat:__VA_ARGS__];\
NSLog(@"\n===========================\n===========================\n=== FNPhotoBrowser' Log ===\n提示信息:%@\n所在方法:%s\n所在行数:%d\n===========================\n===========================",string,__func__,__LINE__);\
}

#define FNLogFunc NSLog(@"%s",__func__)

#else
#define FNFormatLog(...)
#define FNLogFunc
#endif




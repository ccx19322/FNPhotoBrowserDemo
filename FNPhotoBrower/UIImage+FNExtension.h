//
//  UIImage+FNExtension.h
//  FNPhotoBrowserDemo
//
//  Created by ehang on 2016/10/26.
//  Copyright © 2016年 LiuShannoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FNExtension)

/**
 *  返回一张指定size的指定颜色的纯色图片
 */
+ (UIImage *)fn_imageWithColor:(UIColor *)color size:(CGSize)size;

@end

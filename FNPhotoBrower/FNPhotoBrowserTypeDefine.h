//
//  FNPhotoBrowserTypeDefine.h
//  FNPhotoBrowserDemo
//
//  Created by FN on 2017/5/22.
//  Copyright © 2017年 LiuShannoon. All rights reserved.
//

/**
 *  图片浏览器的样式
 */
typedef NS_ENUM(NSUInteger, FNPhotoBrowserStyle){
    /**
     *  长按图片弹出功能组件,底部一个PageControl
     */
    FNPhotoBrowserStylePageControl = 1,
    /**
     * 长按图片弹出功能组件,顶部一个索引UILabel
     */
    FNPhotoBrowserStyleIndexLabel = 2,
    /**
     * 没有长按图片弹出的功能组件,顶部一个索引UILabel,底部一个保存图片按钮
     */
    FNPhotoBrowserStyleSimple = 3
};

/**
 *  pageControl的位置
 */
typedef NS_ENUM(NSUInteger, FNPhotoBrowserPageControlAliment){
    /**
     * pageControl在右边
     */
    FNPhotoBrowserPageControlAlimentRight = 1,
    /**
     *  pageControl 中间
     */
    FNPhotoBrowserPageControlAlimentCenter = 2,
    FNPhotoBrowserPageControlAlimentLeft = 3
};

/**
 *  pageControl的样式
 */
typedef NS_ENUM(NSUInteger, FNPhotoBrowserPageControlStyle){
    /**
     * 系统自带经典样式
     */
    FNPhotoBrowserPageControlStyleClassic = 1,
    /**
     *  动画效果pagecontrol
     */
    FNPhotoBrowserPageControlStyleAnimated = 2,
    /**
     *  不显示pagecontrol
     */
    FNPhotoBrowserPageControlStyleNone = 3
    
};

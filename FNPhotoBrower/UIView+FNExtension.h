//
//  UIView+FNExtension.h
//  TopHot
//
//  Created by Liushannoon on 16/4/20.
//  Copyright © 2016年 Liushannoon. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FNScreenBounds [UIScreen mainScreen].bounds
#define FNScreenSize [UIScreen mainScreen].bounds.size
#define FNScreenW [UIScreen mainScreen].bounds.size.width
#define FNScreenH [UIScreen mainScreen].bounds.size.height
#define fn_autoSizeScaleX ([UIScreen mainScreen].bounds.size.width / 375)
#define fn_autoSizeScaleY ([UIScreen mainScreen].bounds.size.height / 667)

#define FNDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)
#define FNKeyWindow [UIApplication sharedApplication].windows.firstObject

/**
 *  动画类型
 */
typedef NS_ENUM(NSUInteger, FNAnimationType){
    /**
     *  弹性动画放大
     */
    FNAnimationTypeToBigger = 1,
    /**
     *  缩小的弹性动画
     */
    FNAnimationTypeToSmaller = 2
};

@interface UIView (FNExtension)

@property (nonatomic, assign) CGFloat height FNDeprecated("请使用fn_height");
@property (nonatomic, assign) CGFloat width FNDeprecated("请使用fn_width");
@property (nonatomic, assign) CGFloat x  FNDeprecated("请使用fn_x");
@property (nonatomic, assign) CGFloat y FNDeprecated("请使用fn_y");
@property (nonatomic, assign) CGFloat centerX FNDeprecated("请使用fn_centerX");
@property (nonatomic, assign) CGFloat centerY FNDeprecated("请使用fn_centerY");

@property (nonatomic, assign) CGFloat fn_height;
@property (nonatomic, assign) CGFloat fn_width;
@property (nonatomic, assign) CGFloat fn_x;
@property (nonatomic, assign) CGFloat fn_y;
@property (nonatomic, assign) CGSize fn_size;
@property (nonatomic, assign) CGFloat fn_centerX;
@property (nonatomic, assign) CGFloat fn_centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)fn_isShowingOnKeyWindow;

/**
 *  加载xibview
 */
+ (instancetype)fn_viewFromXib ;

/**
 *  显示一个5*5点的红色提醒圆点
 *
 *  @param redX x坐标
 *  @param redY y坐标
 */
- (void)fn_showRedTipViewInRedX:(CGFloat)redX redY:(CGFloat)redY FNDeprecated("请使用其他同类方法");
/**
 *  在view上面绘制一个指定width宽度的红色提醒圆点
 *
 *  @param redX  x坐标
 *  @param redY  y坐标
 *  @param width 宽度
 */
- (void)fn_showRedTipViewInRedX:(CGFloat)redX redY:(CGFloat)redY redTipViewWidth:(CGFloat)width ;
/**
 *  在view上面绘制一个指定width宽度的 指定颜色的提醒圆点
 *
 *  @param redX  x坐标
 *  @param redY  y坐标
 *  @param width 圆点的直径
 *  @param backgroundColor 圆点的颜色
 */
- (void)fn_showRedTipViewInRedX:(CGFloat)redX redY:(CGFloat)redY redTipViewWidth:(CGFloat)width backgroundColor:(UIColor *)backgroundColor;
/**
 *  显示一个5*5点的红色提醒圆点
 *
 *  @param redX x坐标
 *  @param redY y坐标
 *  @param numberCount 展示的数字
 */
- (void)fn_showRedTipViewWithNumberCountInRedX:(CGFloat)redX redY:(CGFloat)redY numberCount:(NSInteger)numberCount;

/**
 *  隐藏红色提醒圆点
 */
- (void)fn_hideRedTipView;

/**
 *  类方法,对指定的layer进行弹性动画
 *
 *  @param layer 进行动画的图层
 *  @param type  动画类型
 */
+ (void)fn_showOscillatoryAnimationWithLayer:(CALayer *)layer type:(FNAnimationType)type;
/**
 *  给视图添加虚线边框
 *
 *  @param lineWidth  线宽
 *  @param lineMargin 每条虚线之间的间距
 *  @param lineLength 每条虚线的长度
 *  @param lineColor 每条虚线的颜色
 */
- (void)fn_addDottedLineBorderWithLineWidth:(CGFloat)lineWidth lineMargin:(CGFloat)lineMargin lineLength:(CGFloat)lineLength lineColor:(UIColor *)lineColor;

@end

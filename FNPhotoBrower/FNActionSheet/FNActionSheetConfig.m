//
//  FNActionSheetConfig.m
//  FNActionSheet
//
//  Created by Chencx on 6/8/16.
//  Copyright © 2016 Chencx. All rights reserved.
//

#import "FNActionSheetConfig.h"

// float
CGFloat const FNActionSheetDefaultMargin      = 10;     ///< 默认边距 (标题四边边距, 选项靠左或靠右时距离边缘的距离)
CGFloat const FNActionSheetContentMaxScale    = 0.65;   ///< 弹窗内容高度与屏幕高度的默认比例
CGFloat const FNActionSheetRowHeight          = 44;     ///< 行高
CGFloat const FNActionSheetTitleLineSpacing   = 2.5;    ///< 标题行距
CGFloat const FNActionSheetTitleKernSpacing   = 0.5;    ///< 标题字距
CGFloat const FNActionSheetItemTitleFontSize  = 16;     ///< 选项文字字体大小, default is 16.
CGFloat const FNActionSheetItemContentSpacing = 5;      ///< 选项图片和文字的间距
// color
NSString * const FNActionSheetTitleColor           = @"#888888"; ///< 标题颜色
NSString * const FNActionSheetBackColor            = @"#E8E8ED"; ///< 背景颜色
NSString * const FNActionSheetRowNormalColor       = @"#FBFBFE"; ///< 单元格背景颜色
NSString * const FNActionSheetRowHighlightedColor  = @"#F1F1F5"; ///< 选中高亮颜色
NSString * const FNActionSheetRowTopLineColor      = @"#D7D7D8"; ///< 单元格顶部线条颜色
NSString * const FNActionSheetItemNormalColor      = @"#000000"; ///< 选项默认颜色
NSString * const FNActionSheetItemHighlightedColor = @"#E64340"; ///< 选项高亮颜色

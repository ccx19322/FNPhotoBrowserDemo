//
//  FNActionSheet.h
//  FNActionSheet
//
//  Created by Chencx on 6/7/16.
//  Copyright © 2016年 Chencx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNActionSheetItem.h"
#import "FNActionSheetConfig.h"

@class FNActionSheet;
@protocol FNActionSheetDelegate <NSObject>

@optional
- (void)FNActionSheet:(FNActionSheet *)actionSheet selectedIndex:(NSInteger)selectedIndex;

@end

@interface FNActionSheet : UIView

@property (nonatomic, weak) id<FNActionSheetDelegate> delegate; ///< 代理对象
@property (nonatomic, assign) FNContentAlignment contentAlignment; ///< 默认是FNContentAlignmentCenter.
@property (nonatomic, assign) BOOL hideOnTouchOutside; ///< 是否开启点击半透明层隐藏弹窗, 默认为YES.

/*! @author Steven
 *  @brief 单文本选项快速初始化
 *  @param title                  标题
 *  @param delegate               代理
 *  @param cancelButtonTitle      取消按钮标题
 *  @param highlightedButtonTitle 高亮按钮标题
 *  @param otherButtonTitles      其他按钮标题集合
 */
- (instancetype)initWithTitle:(NSString *)title delegate:(id<FNActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle highlightedButtonTitle:(NSString *)highlightedButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles;

/*! @author Steven
 *  @brief 在外部组装选项按钮item
 *  @param title       标题
 *  @param cancelTitle 取消按钮标题
 *  @param items       选项按钮item
 */
- (instancetype)initWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle items:(NSArray<FNActionSheetItem *> *)items;

/*! @author Steven
 *  @brief 单展示, 不绑定block回调
 */
- (void)show;

/*! @author Steven
 *  @brief 展示并绑定block回调
 *  @param selectedHandler 选择选项按钮回调.
 */
- (void)showWithSelectedCompletion:(FNActionSheetHandler)selectedHandler;

@end

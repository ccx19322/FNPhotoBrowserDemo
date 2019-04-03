//
//  FNActionSheetCell.h
//  FNActionSheet
//
//  Created by Chencx on 6/7/16.
//  Copyright © 2016年 Chencx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNActionSheetConfig.h"
@class FNActionSheetItem;

@interface FNActionSheetCell : UITableViewCell

@property (nonatomic, assign) FNContentAlignment contentAlignment;
@property (nonatomic, strong) FNActionSheetItem *item;
@property (nonatomic, assign) BOOL hideTopLine; ///< 是否隐藏顶部线条

@end

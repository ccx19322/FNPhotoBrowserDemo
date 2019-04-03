//
//  FNActionSheetItem.m
//  FNActionSheet
//
//  Created by Chencx on 16/5/11.
//  Copyright © 2016年 Chencx. All rights reserved.
//

#import "FNActionSheetItem.h"

@implementation FNActionSheetItem

+ (instancetype)itemWithType:(FNActionSheetType)type image:(UIImage *)image title:(NSString *)title tintColor:(UIColor *)tintColor {
    
    FNActionSheetItem *item = [[FNActionSheetItem alloc] init];
    item.type  = type;
    item.image = image;
    item.title = title;
    item.tintColor = tintColor;
    
    return item;
}

@end

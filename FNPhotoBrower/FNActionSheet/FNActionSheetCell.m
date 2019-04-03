//
//  FNActionSheetCell.m
//  FNActionSheet
//
//  Created by Chencx on 6/7/16.
//  Copyright © 2016年 Chencx. All rights reserved.
//

#import "FNActionSheetCell.h"
#import "FNActionSheetItem.h"

@interface FNActionSheetCell ()

@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, weak) UIView *topLine; ///< 顶部线条

@end

@implementation FNActionSheetCell

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.contentView.backgroundColor = FNActionSheetColorWithString(FNActionSheetRowHighlightedColor);
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            self.contentView.backgroundColor = self.backgroundColor;
        }];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    self.backgroundColor = FNActionSheetColorWithString(FNActionSheetRowNormalColor);
    self.contentView.backgroundColor = self.backgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _contentAlignment = FNContentAlignmentCenter;
    
    [self setupSubviews];
    
    return self;
}

- (void)setupSubviews {
    _titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _titleButton.tintColor = FNActionSheetColorWithString(FNActionSheetItemNormalColor);
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:FNActionSheetItemTitleFontSize];
    _titleButton.userInteractionEnabled = NO;
    _titleButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_titleButton];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_titleButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleButton)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleButton)]];
    
    // 顶部线条
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = FNActionSheetColorWithString(FNActionSheetRowTopLineColor);
    topLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:topLine];
    self.topLine = topLine;
    CGFloat lineHeight = 1/[UIScreen mainScreen].scale; ///< 线条高度
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topLine]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(topLine)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLine(lineHeight)]" options:0 metrics:@{@"lineHeight":@(lineHeight)} views:NSDictionaryOfVariableBindings(topLine)]];
}

- (void)setItem:(FNActionSheetItem *)item {
    _item = item;
    
    // 前景色设置, 如果有自定义前景色则使用自定义的前景色, 否则使用预配置的颜色值.
    UIColor *tintColor;
    if (item.tintColor) {
        tintColor = item.tintColor;
    } else {
        if (_item.type == FNActionSheetTypeNormal) {
            tintColor = FNActionSheetColorWithString(FNActionSheetItemNormalColor);
        } else {
            tintColor = FNActionSheetColorWithString(FNActionSheetItemHighlightedColor);
        }
    }
    _titleButton.tintColor = tintColor;
    
    // 调整图片与标题的间距
    _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, _item.image?-FNActionSheetItemContentSpacing/2:0,
                                                    _item.image?1:0, _item.image?FNActionSheetItemContentSpacing/2:0);
    _titleButton.titleEdgeInsets = UIEdgeInsetsMake(_item.image?1:0, _item.image?FNActionSheetItemContentSpacing/2:0,
                                                    0, _item.image?-FNActionSheetItemContentSpacing/2:0);
    // 设置图片与标题
    [_titleButton setTitle:item.title forState:UIControlStateNormal];
    [_titleButton setImage:item.image forState:UIControlStateNormal];
}

- (void)setContentAlignment:(FNContentAlignment)contentAlignment {
    if (_contentAlignment == contentAlignment) return;
    
    _contentAlignment = contentAlignment;
    // 更新button的图片和标题Edge
    [self updateButtonContentEdge];
    // 设置内容偏移
    switch (_contentAlignment) {
            // 局左
        case FNContentAlignmentLeft: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            _titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, FNActionSheetDefaultMargin, 0, -FNActionSheetDefaultMargin);
            break;
        }
            // 居中
        case FNContentAlignmentCenter: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            _titleButton.contentEdgeInsets = UIEdgeInsetsZero;
            break;
        }
            // 居右
        case FNContentAlignmentRight: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            _titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, -FNActionSheetDefaultMargin, 0, FNActionSheetDefaultMargin);
            break;
        }
    }
}

// 更新button图片与标题的edge
- (void)updateButtonContentEdge {
    if (!_item.image) return;
    if (_contentAlignment == FNContentAlignmentRight) {
        CGFloat titleWidth = [[_titleButton titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName:_titleButton.titleLabel.font}].width;
        _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth, 1, -titleWidth);
        _titleButton.titleEdgeInsets = UIEdgeInsetsMake(1, -_item.image.size.width-FNActionSheetItemContentSpacing,
                                                        0, _item.image.size.width+FNActionSheetItemContentSpacing);
    } else {
        _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, -FNActionSheetItemContentSpacing/2, 1, FNActionSheetItemContentSpacing/2);
        _titleButton.titleEdgeInsets = UIEdgeInsetsMake(1, FNActionSheetItemContentSpacing/2, 0, -FNActionSheetItemContentSpacing/2);
    }
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    _topLine.hidden = hideTopLine;
}

@end


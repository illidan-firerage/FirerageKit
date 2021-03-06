//
//  FRFlatSegmentedControl.m
//  FirerageKit
//
//  Created by Aidian.Tang on 14-5-28.
//  Copyright (c) 2014年 Illidan.Firerage. All rights reserved.
//

#import "FRFlatSegmentedControl.h"
#import "UIImage+FRColor.h"
#import "UIColor+MLPFlatColors.h"

#define NormalColorDefault              [UIColor whiteColor]
#define SelectedColorDefault            [UIColor flatBlueColor]
#define ItemTitleNormalColorDefault     [UIColor whiteColor]
#define ItemTitleSelectedColorDefault   [UIColor flatBlueColor]
#define BorderColorDefault              [UIColor flatBlueColor]

@interface FRFlatSegmentedControl ()

@end

@implementation FRFlatSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (void)setUp
{
    self.normalColor = NormalColorDefault;
    self.selectedColor = SelectedColorDefault;
    self.itemTitleNormalColor = ItemTitleNormalColorDefault;
    self.itemTitleSelectedColor = ItemTitleSelectedColorDefault;
    self.borderColor = BorderColorDefault;
    self.cornerRadius = 5.;
}

- (void)reloadView
{
    NSMutableArray *buttons = [NSMutableArray array];
    for (NSString *itemTitle in _itemTitles) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:itemTitle forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:_normalColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:_selectedColor] forState:UIControlStateSelected];
        [btn setTitleColor:_itemTitleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:_itemTitleSelectedColor forState:UIControlStateSelected];
        if (_itemTitleFont) {
            btn.titleLabel.font = _itemTitleFont;
        }
        [buttons addObject:btn];
    }
    self.buttonsArray = buttons;
    [self setSelectedIndex:0];
}

- (void)setItemTitles:(NSArray *)itemTitles
{
    _itemTitles = itemTitles;
    [self reloadView];
}

- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
    [self reloadView];
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedColor = selectedColor;
    [self reloadView];
}

- (void)setItemTitleNormalColor:(UIColor *)itemTitleNormalColor
{
    _itemTitleNormalColor = itemTitleNormalColor;
    [self reloadView];
}

- (void)setItemTitleSelectedColor:(UIColor *)itemTitleSelectedColor
{
    _itemTitleSelectedColor = itemTitleSelectedColor;
    [self reloadView];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.separatorImage = [UIImage imageWithColor:borderColor];
    self.layer.borderWidth = 1;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont
{
    _itemTitleFont = itemTitleFont;
    [self reloadView];
}

- (NSInteger)selectedIndex
{
    return self.selectedIndexes.firstIndex;
}

@end

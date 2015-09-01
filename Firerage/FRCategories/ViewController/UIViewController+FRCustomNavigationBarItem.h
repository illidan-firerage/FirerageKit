//
//  UIViewController+FRCustomNavigationBarItem.h
//  FirerageKit
//
//  Created by Aidian on 14-5-24.
//  Copyright (c) 2014年 Illidan.Firerage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZABarButtonItem : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *normalImageName;
@property (nonatomic, copy) NSString *highlightedImageName;
@property (nonatomic, assign) SEL selector;

+ (instancetype)barButtonItemWithTarget:(id)target title:(NSString *)title normalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName selector:(SEL)selector;

@end

@interface UIViewController (FRCustomNavigationBarItem)

@property (nonatomic, copy) NSString *backBarButtonItemNormalImageName;
@property (nonatomic, copy) NSString *backBarButtonItemHighlightedImageName;
@property (nonatomic, copy) NSString *backBarButtonItemTitle;

- (void)addIOS7BackBarButtonItemAutomatically;

- (void)addIOS7BackBarButtonItemAutomaticallyWithBack:(void(^)())back;

- (void)addIOS7BackBarButtonItemWithTitle:(NSString *)title normalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName;

- (void)addLeftBarButtonItemWithTarget:(id)target title:(NSString *)title normalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName selector:(SEL)selctor;

- (void)addRightBarButtonItemWithTarget:(id)target title:(NSString *)title normalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName selector:(SEL)selctor;

- (void)addLeftBarButtonItems:(NSArray *)barButtonItems;

@end

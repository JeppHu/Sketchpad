//
//  JPSketchpadView.h
//  Sketchpad
//
//  Created by Jepp on 2019/3/20.
//  Copyright © 2019年 Jepp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPSketchpadView : UIView
@property (strong, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) CGFloat lineWidth;

- (void)clear;
- (void)back;
- (void)delete;

@end

NS_ASSUME_NONNULL_END

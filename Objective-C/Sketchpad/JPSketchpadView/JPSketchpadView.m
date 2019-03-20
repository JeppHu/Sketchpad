//
//  JPSketchpadView.m
//  Sketchpad
//
//  Created by Jepp on 2019/3/20.
//  Copyright © 2019年 Jepp. All rights reserved.
//

#import "JPSketchpadView.h"
#import "JPBezierPath.h"

@interface JPSketchpadView ()
@property (strong, nonatomic) NSMutableArray *paths;
@end

@implementation JPSketchpadView

- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    if (!self.backgroundColor) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)drawRect:(CGRect)rect {
    for (JPBezierPath *path in self.paths) {
        [path.lineColor set];
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    JPBezierPath *path = [JPBezierPath bezierPath];
    [path moveToPoint:p];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    
    [path setLineWidth:self.lineWidth];
    [path setLineColor:self.lineColor];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    [self.paths.lastObject addLineToPoint:p];
    
    [self setNeedsDisplay];
}

- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)delete {
    self.lineColor = self.backgroundColor;
}

@end

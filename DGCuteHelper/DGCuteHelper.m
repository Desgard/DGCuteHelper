//
//  DGCuteHelper.m
//  DGCuteViewDemo
//
//  Created by 段昊宇 on 16/7/16.
//  Copyright © 2016年 Desgard_Duan. All rights reserved.
//

#import "DGCuteHelper.h"
#import <UIKit/UIKit.h>

@interface DGCuteHelper()

@property (assign) CGFloat maxDistance;

@property (nonatomic, strong) CAShapeLayer *shapLayer;
@property (nonatomic, strong) UIView *view_1;
@property (nonatomic, strong) UIView *view_2;

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation DGCuteHelper


#pragma mark - 对外接口
- (void) showCuteEffectFromView: (UIView *)v1 To: (UIView *)v2 SuperView: (UIView *)sv {
    [self setShapLayerDefault];
    _view_1 = v1;
    _view_2 = v2;
    [sv.layer addSublayer: self.shapLayer];
    [self reloadBeziePath];
    
    _maxDistance = 100;
}

- (void) startAnimation {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector: @selector(reloadBeziePath)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink.paused = NO;
}

- (void) stopAnimation {
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - 计算圆心距
- (CGFloat) getDistanceBetweenDots {
    CGFloat x1 = self.view_1.center.x;
    CGFloat y1 = self.view_1.center.y;
    CGFloat x2 = self.view_2.center.x;
    CGFloat y2 = self.view_2.center.y;
    
    CGFloat distance = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    
    return distance;
}

#pragma mark - 求两点中点坐标
- (CGPoint) getCenterPointWithX: (CGPoint)p1 Y: (CGPoint)p2 {
    return CGPointMake((p1.x + p2.x) / 2.f, (p1.y + p2.y) / 2.f);
}

- (CGPoint) rotateWithCenter: (CGPoint)O Point: (CGPoint) P angle: (CGFloat)alpha {
    CGFloat x1 = P.x, y1 = P.y;
    CGFloat x2 = O.x, y2 = O.y;
    return CGPointMake((x1 - x2) * cos(alpha) - (y1 - y2) * sin(alpha) + x2,
                       (y1 - y2) * cos(alpha) + (x1 - x2) * sin(alpha) + y2);
}

#pragma mark - 绘制贝塞尔图形
- (void) reloadBeziePath {
    CALayer *layer_1 = (CALayer *)[self.view_1.layer presentationLayer];
    CALayer *layer_2 = (CALayer *)[self.view_2.layer presentationLayer];
    CGPoint positon_1 = [[layer_1 valueForKey: @"position"] CGPointValue];
    CGPoint positon_2 = [[layer_2 valueForKey: @"position"] CGPointValue];
    
    CGFloat x1 = positon_1.x;
    CGFloat y1 = positon_1.y;
    CGFloat x2 = positon_2.x;
    CGFloat y2 = positon_2.y;
    
    CGFloat distance = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) + 0.0001f;
    
    CGFloat r1 = self.view_1.frame.size.width / 2.0f;
    CGFloat r2 = self.view_2.frame.size.width / 2.0f;
    
    r1 = MAX(r1, self.view_1.frame.size.width / 2.0f / _maxDistance);
    r2 = MAX(r2, self.view_1.frame.size.width / 2.0f / _maxDistance);
    
    CGFloat theta = 22.5 / 180 * M_PI;
    
    CGFloat sinDegree = (x2 - x1) / distance;
    CGFloat cosDegree = (y2 - y1) / distance;
    
    CGPoint pointA = CGPointMake(x1 - r1 * cosDegree, y1 + r1 * sinDegree);
    CGPoint pointB = CGPointMake(x1 + r1 * cosDegree, y1 - r1 * sinDegree);
    CGPoint pointC = CGPointMake(x2 + r2 * cosDegree, y2 - r2 * sinDegree);
    CGPoint pointD = CGPointMake(x2 - r2 * cosDegree, y2 + r2 * sinDegree);
    
    CGPoint pointA_ = [self rotateWithCenter: positon_1 Point: pointA angle: -theta];
    CGPoint pointB_ = [self rotateWithCenter: positon_1 Point: pointB angle: +theta];
    CGPoint pointC_ = [self rotateWithCenter: positon_2 Point: pointC angle: -theta];
    CGPoint pointD_ = [self rotateWithCenter: positon_2 Point: pointD angle: +theta];
    
    CGPoint pointN = [self getCenterPointWithX: pointA_ Y: pointD_];
    CGPoint pointM = [self getCenterPointWithX: pointC_ Y: pointB_];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: pointA];
    [path addLineToPoint: pointB];
    [path addQuadCurveToPoint: pointC controlPoint: pointN];
    [path addLineToPoint: pointD];
    [path addQuadCurveToPoint: pointA controlPoint: pointM];
    
    self.shapLayer.path = path.CGPath;
}


#pragma mark - Setter
- (void) setShapLayerWithColor: (UIColor *) color {
    _shapLayer = [CAShapeLayer layer];
    
    if (color != nil) _shapLayer.fillColor = color.CGColor;
    else _shapLayer.fillColor = [UIColor redColor].CGColor;
    
    _shapLayer.position = CGPointMake(0, 0);
}

- (void) setShapLayerDefault {
    [self setShapLayerWithColor: nil];
}


@end

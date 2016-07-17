//
//  DGCuteDotView.m
//  DGCuteViewDemo
//
//  Created by 段昊宇 on 16/7/16.
//  Copyright © 2016年 Desgard_Duan. All rights reserved.
//

#import "DGCuteDotView.h"

@interface DGCuteDotView()

@property (nonatomic) CGPoint origin;

@end

@implementation DGCuteDotView

#pragma mark - override
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.backgroundColor = [UIColor redColor];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void) setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = CGRectGetWidth(frame) / 2.f;
}

@end



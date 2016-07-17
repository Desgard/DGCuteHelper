//
//  DGCuteHelper.h
//  DGCuteViewDemo
//
//  Created by 段昊宇 on 16/7/16.
//  Copyright © 2016年 Desgard_Duan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DGCuteHelper : NSObject

- (void) showCuteEffectFromView: (UIView *)v1 To: (UIView *)v2 SuperView: (UIView *)sv;

 
- (void) startAnimation;
- (void) stopAnimation;

@end

//
//  ViewController.m
//  DGCuteView
//
//  Created by 段昊宇 on 16/7/16.
//  Copyright © 2016年 Desgard_Duan. All rights reserved.
//

#import "ViewController.h"

#import "DGCuteKittenView.h"
#import "DGCuteTencentView.h"

#import "DGCuteHelper.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *a;
@property (nonatomic, strong) UIView *b;
@property (nonatomic, strong) UIView *c;
@property (nonatomic, strong) UIView *d;
@property (nonatomic, strong) UIView *e;
@property (nonatomic, strong) DGCuteHelper *helper1;
@property (nonatomic, strong) DGCuteHelper *helper2;
@property (nonatomic, strong) DGCuteHelper *helper3;
@property (nonatomic, strong) DGCuteHelper *helper4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    DGCuteKittenView *slimeView = [[DGCuteKittenView alloc] initWithFrame: CGRectMake(30, 30, 30, 30)];
//    [self.view addSubview: slimeView];
//    
//    DGCuteTencentView *slimeView2 = [[DGCuteTencentView alloc] initWithFrame: CGRectMake(30, 80, 30, 30)];
//    [self.view addSubview: slimeView2];
    
    
    _a = [[UIView alloc] initWithFrame: CGRectMake(30, 30, 80, 80)];
    _b = [[UIView alloc] initWithFrame: CGRectMake(30, 30, 40, 40)];
    _c = [[UIView alloc] initWithFrame: CGRectMake(30, 30, 40, 40)];
    _d = [[UIView alloc] initWithFrame: CGRectMake(30, 30, 40, 40)];
    _e = [[UIView alloc] initWithFrame: CGRectMake(30, 30, 40, 40)];
    _a.center = _b.center = _c.center = _d.center = _e.center = self.view.center;
    
    _a.layer.cornerRadius = _a.frame.size.width / 2.f;
    _a.layer.masksToBounds = YES;
    _a.backgroundColor = [UIColor redColor];
    
    _b.layer.cornerRadius = _b.frame.size.width / 2.f;
    _b.layer.masksToBounds = YES;
    _b.backgroundColor = [UIColor redColor];
    
    _c.layer.cornerRadius = _c.frame.size.width / 2.f;
    _c.layer.masksToBounds = YES;
    _c.backgroundColor = [UIColor redColor];
    
    _d.layer.cornerRadius = _d.frame.size.width / 2.f;
    _d.layer.masksToBounds = YES;
    _d.backgroundColor = [UIColor redColor];
    
    _e.layer.cornerRadius = _e.frame.size.width / 2.f;
    _e.layer.masksToBounds = YES;
    _e.backgroundColor = [UIColor redColor];
    
    [self.view addSubview: _a];
    [self.view addSubview: _b];
    [self.view addSubview: _c];
    [self.view addSubview: _d];
    [self.view addSubview: _e];
    
}

// http://www.zybang.com/question/aafa923e7f7c318cbd6f5bf8987c6c6c.html
- (CGPoint) rotateWithCenter: (CGPoint)O Point: (CGPoint) P angle: (CGFloat)alpha {
    CGFloat x1 = P.x, y1 = P.y;
    CGFloat x2 = O.x, y2 = O.y;
    return CGPointMake((x1 - x2) * cos(alpha) - (y1 - y2) * sin(alpha) + x2,
                       (y1 - y2) * cos(alpha) + (x1 - x2) * sin(alpha) + y2);
}

- (IBAction)click:(id)sender {
    CGFloat x0 = _b.center.x - 90;
    CGFloat y0 = _b.center.y;
    CGFloat angel = 40 / 180.0 * M_PI;
    
    CGPoint b = CGPointMake(x0, y0);
    CGPoint c = [self rotateWithCenter: _a.center Point: b angle: angel];
    CGPoint d = [self rotateWithCenter: _a.center Point: c angle: angel];
    CGPoint e = [self rotateWithCenter: _a.center Point: d angle: angel];

    [_helper2 startAnimation];
    [_helper3 startAnimation];
    [_helper4 startAnimation];
    
    [UIView animateWithDuration: 1
                          delay: 0
         usingSpringWithDamping: 0.8f
          initialSpringVelocity: 15
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         _a.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         _b.center = b;
                         _c.center = c;
                         _d.center = d;
                         _e.center = e;
                     }
                     completion:^(BOOL finished) {
                         [_helper2 stopAnimation];
                         [_helper3 stopAnimation];
                         [_helper4 stopAnimation];
                     }];
    
    
}
- (IBAction)click2:(id)sender {
//    _helper1 = [[DGCuteHelper alloc] init];
//    [_helper1 showCuteEffectFromView: _a To: _b SuperView: self.view];
    _helper2 = [[DGCuteHelper alloc] init];
    [_helper2 showCuteEffectFromView: _b To: _c SuperView: self.view];
    _helper3 = [[DGCuteHelper alloc] init];
    [_helper3 showCuteEffectFromView: _c To: _d SuperView: self.view];
    _helper4 = [[DGCuteHelper alloc] init];
    [_helper4 showCuteEffectFromView: _d To: _e SuperView: self.view];
}
- (IBAction)click3:(id)sender {
    [_helper2 startAnimation];
    [_helper3 startAnimation];
    [_helper4 startAnimation];
    
    [UIView animateWithDuration: 1
                          delay: 0
         usingSpringWithDamping: 0.8f
          initialSpringVelocity: 15
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         _a.transform = CGAffineTransformMakeScale(1, 1);
                         _b.center = self.view.center;
                         _c.center = self.view.center;
                         _d.center = self.view.center;
                         _e.center = self.view.center;
                     }
                     completion:^(BOOL finished) {
                         [_helper2 stopAnimation];
                         [_helper3 stopAnimation];
                         [_helper4 stopAnimation];
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

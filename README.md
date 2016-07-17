## Description

A helper Class to achieve adhesive Bond Effect between two UIView.

实现两个视图间粘性特效辅助类。

在通常绘制的时候，视图与视图之间总是独立的。这样不利于每个视图在切换衔接时候的视觉效果。`DGCuteHelper`可以作为两个视图间的视觉桥梁，使其达成某种关联程度，从而衍生出新的动画效果。

## Screenshot

<img src="/Image/screenshot.gif" width="240px">

## Interface

#### `- (void) showCuteEffectFromView: (UIView *)v1 To: (UIView *)v2 SuperView: (UIView *)sv;`

* 通过获取圆形视图半径，对两个视图进行粘性连接。
 
#### `- (void) startAnimation;`  And  `- (void) stopAnimation;`

* 开启和结束*Core Animation*的标志。之间会使用*displaylink*不断重绘贝塞尔图形。

## When to use?

当我们在有多个子视图时，我们可以考虑使用粘连效果来达到新的效果。

### e.g

<img src="/Image/demo1.gif" width="240px">

## The MIT License (MIT)

Copyright (c) 2016 Desgard_Duan

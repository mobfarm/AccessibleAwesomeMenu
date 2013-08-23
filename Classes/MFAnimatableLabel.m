//
//  MFAnimatableLabel.m
//  eXplora MuSe
//
//  Created by Matteo Gavagnin on 19/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFAnimatableLabel.h"
#import <QuartzCore/QuartzCore.h>

#define kAnimationOffset 10
#define kStartOffset 90

@implementation MFAnimatableLabel

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;

- (void)setup{
    // We don't animate opacity for now
    self.layer.opacity = 1.0;
    _endPoint = CGPointMake(self.center.x, self.center.y);
    _startPoint = CGPointMake(self.center.x , self.center.y - kStartOffset);
    _farPoint = CGPointMake(_endPoint.x, _endPoint.y + kAnimationOffset);
    _nearPoint = CGPointMake(_endPoint.x, _endPoint.y - kAnimationOffset);
    
    self.center = _startPoint;
    self.visible = NO;
}

- (void)show{
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0.5f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.startPoint.x, self.startPoint.y);
    CGPathAddLineToPoint(path, NULL, self.farPoint.x, self.farPoint.y);
    CGPathAddLineToPoint(path, NULL, self.nearPoint.x, self.nearPoint.y);
    CGPathAddLineToPoint(path, NULL, self.endPoint.x, self.endPoint.y);
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, nil];
    animationgroup.duration = 0.5f;
    animationgroup.fillMode = kCAFillModeForwards;
    animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationgroup.delegate = self;
    
    [self.layer addAnimation:animationgroup forKey:@"Expand"];
    self.center = self.endPoint;
    
    [self setVisible:YES];
}

- (void)hide{
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0.5f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.endPoint.x, self.endPoint.y);
    CGPathAddLineToPoint(path, NULL, self.farPoint.x, self.farPoint.y);
    CGPathAddLineToPoint(path, NULL, self.startPoint.x, self.startPoint.y);
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, nil];
    animationgroup.duration = 0.5f;
    animationgroup.fillMode = kCAFillModeForwards;
    animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationgroup.delegate = self;
    
    [self.layer addAnimation:animationgroup forKey:@"Expand"];
    self.center = self.startPoint;
    self.visible = NO;
}

@end

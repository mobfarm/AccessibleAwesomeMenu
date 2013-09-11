//
//  MFAnimatableButton.m
//  animatingPath
//
//  Created by Matteo Gavagnin on 04/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFAnimatableButton.h"
#import <QuartzCore/QuartzCore.h>

#define kAnimationOffset 10
#define kStartOffset 90

@implementation MFAnimatableButton

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;
@synthesize type = _type;

- (void)setupWithType:(MFAnimatableButtonType)theType{
    // We don't animate opacity for now
    self.type = theType;
    
    self.layer.opacity = 1.0;
    _endPoint = CGPointMake(self.center.x, self.center.y);
    _startPoint = CGPointMake(self.center.x - kStartOffset, self.center.y);
    _farPoint = CGPointMake(_endPoint.x + kAnimationOffset, self.center.y);
    _nearPoint = CGPointMake(_endPoint.x - kAnimationOffset, self.center.y);
    
    if (_type == MFAnimatableButtonTypeLeftHuge) {
        // Big
        _startPoint = CGPointMake(self.center.x - kStartOffset * 2, self.center.y);
    } else if (_type == MFAnimatableButtonTypeRight) {
        // From right
        _startPoint = CGPointMake(self.center.x + kStartOffset, self.center.y);
        _farPoint = CGPointMake(_endPoint.x - kAnimationOffset, self.center.y);
        _nearPoint = CGPointMake(_endPoint.x + kAnimationOffset, self.center.y);
    } else if (_type == MFAnimatableButtonTypeLeftBig) {
        // Slightly bigger
        _startPoint = CGPointMake(self.center.x - kStartOffset - 10, self.center.y);
    }
    
    self.center = _startPoint;
    self.visible = NO;
}

- (void)show{
    if (self.visible) {
        return;
    }
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
    if (!self.visible) {
        return;
    }
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

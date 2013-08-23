//
//  MFAnimatableButton.h
//  animatingPath
//
//  Created by Matteo Gavagnin on 04/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum MFAnimatableButtonType
{
    MFAnimatableButtonTypeLeft =               0,
    MFAnimatableButtonTypeRight =              1,
    MFAnimatableButtonTypeLeftBig =            2,
    MFAnimatableButtonTypeLeftHuge =           3
    
} MFAnimatableButtonType;

@interface MFAnimatableButton : UIButton {
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint;
    CGPoint _farPoint;
    MFAnimatableButtonType _type;
}

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;
@property (nonatomic, assign) MFAnimatableButtonType type;

@property (nonatomic) BOOL visible;

- (void)setupWithType:(MFAnimatableButtonType)theType;
- (void)show;
- (void)hide;
@end
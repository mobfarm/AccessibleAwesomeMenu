//
//  MFAnimatableButton.h
//  animatingPath
//
//  Created by Matteo Gavagnin on 04/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFButtonTypes.h"

@interface MFAnimatableButton : UIButton {
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint;
    CGPoint _farPoint;
    EXploraButton _type;
}

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;
@property (nonatomic, assign) EXploraButton type;

@property (nonatomic) BOOL visible;

- (void)setupWithType:(EXploraButton)theType;
- (void)show;
- (void)hide;
@end
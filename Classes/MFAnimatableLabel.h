//
//  MFAnimatableLabel.h
//  eXplora MuSe
//
//  Created by Matteo Gavagnin on 19/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFAnimatableLabel : UILabel {
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint;
    CGPoint _farPoint;
}
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;

@property (nonatomic) BOOL visible;

- (void)setup;
- (void)show;
- (void)hide;

@end

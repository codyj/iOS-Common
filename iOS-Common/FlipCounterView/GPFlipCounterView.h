//
//  GPFlipCounterView.h
//
//  Created by Charles Magahern on 10/24/11.
//  Copyright (c) 2011 omegaHern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPFlipCounterView : UIView

@property (nonatomic, assign, setter = setCounterValue:) int counterValue;
@property (nonatomic, assign) float animationSpeed;
@property (nonatomic, readonly) UILabel *counterLabel;

- (void)increment;
- (void)decrement;

@end

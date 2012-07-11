//
//  GPFlipCounterView.m
//
//  Created by Charles Magahern on 10/24/11.
//  Copyright (c) 2011 omegaHern. All rights reserved.
//

#import "GPFlipCounterView.h"

#define kDefaultAnimationSpeed 0.3

@implementation GPFlipCounterView
@synthesize counterValue    = _counterValue;
@synthesize animationSpeed  = _animationSpeed;
@synthesize counterLabel    = _counterLabel;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setupForFrame:frame];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setupForFrame:self.frame];
}

- (void)dealloc
{
    [_counterLabel release];
    [super dealloc];
}

#pragma mark - Private Helpers

- (void)setupForFrame:(CGRect)frame
{
    _counterValue = 0;
    _animationSpeed = kDefaultAnimationSpeed;
    
    CGRect labelFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _counterLabel = [[UILabel alloc] initWithFrame:labelFrame];
    _counterLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _counterLabel.adjustsFontSizeToFitWidth = YES;
    _counterLabel.font = [UIFont boldSystemFontOfSize:100.0]; // Max font size
    _counterLabel.textColor = [UIColor whiteColor];
    _counterLabel.backgroundColor = [UIColor clearColor];
    _counterLabel.text = @"0";
    _counterLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:_counterLabel];
    
    self.clipsToBounds = YES;
}

#pragma mark - Accessors

- (void)setCounterValue:(int)val
{    
    if (self.superview != nil) {
        BOOL moveUp = (val > _counterValue);
        CGFloat labelHeight = _counterLabel.bounds.size.height;
        
        [UIView animateWithDuration:_animationSpeed / 2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            _counterLabel.transform = CGAffineTransformMakeTranslation(0, moveUp ? -labelHeight : labelHeight);
            _counterLabel.alpha = 0.0;
        } completion:^(BOOL f) {
            if (f) {
                _counterLabel.transform = CGAffineTransformMakeTranslation(0, moveUp ? labelHeight : -labelHeight);
                
                [UIView animateWithDuration:_animationSpeed / 2.0 animations:^{
                    _counterLabel.transform = CGAffineTransformIdentity;
                    _counterLabel.alpha = 1.0;
                }];
            }
            
            _counterLabel.text = [NSString stringWithFormat:@"%d", val];
        }];
    } else {
        _counterLabel.text = [NSString stringWithFormat:@"%d", val];
    }
    
    _counterValue = val;
}


#pragma mark - Incrementing/Decrementing

- (void)increment
{
    [self setCounterValue:_counterValue + 1];
}

- (void)decrement
{
    [self setCounterValue:_counterValue - 1];
}

@end

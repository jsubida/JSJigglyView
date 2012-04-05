//
//  UIView+Jiggle.m
//  JSJigglyView
//
//  Created by Joseph Subida on 4/5/12.
//  Copyright (c) 2012 CraveIt. All rights reserved.
//

#import "UIView+Jiggle.h"

#define degreesToRadians(x) (M_PI * (x) / 180.0)
#define kAnimationRotateDeg 1.0

@implementation UIView (Jiggle)


#pragma mark - Private

- (void)startJiggling
{
    NSInteger randomInt = arc4random()%500;
    float r = (randomInt/500.0)+0.5;
    
    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(degreesToRadians( (kAnimationRotateDeg * -1.0) - r ));
    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(degreesToRadians( kAnimationRotateDeg + r ));
    
    self.transform = leftWobble;  // Starting point
    
    [self.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{ 
                         [UIView setAnimationRepeatCount:NSNotFound];
                         self.transform = rightWobble; 
                     }
                     completion:nil];
}

- (void)stopJiggling
{
    [self.layer removeAllAnimations];
    self.transform = CGAffineTransformIdentity;  // Set it straight
}


#pragma mark - Public

// special thanks to imnk and Vic320 for the algorithm! 
// http://stackoverflow.com/questions/6604356/ios-icon-jiggle-algorithm
- (void)setJiggling:(BOOL)shouldJiggle
{
    if (shouldJiggle)
        [self startJiggling];
    else
        [self stopJiggling];
}
@end

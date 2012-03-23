//
//  YSPlayerViewController.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSPlayerViewController.h"


@implementation YSPlayerViewController

- (id)init {
    
    if ((self = [super init])) {

        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    }
    
    return self;
}

- (void)loadView {
    
    [super loadView];
    
    YSPlayerView *v = [[YSPlayerView alloc] initWithFrame:[[self view] frame]];
    [v setDelegate:self];
    [self setView:v];
    [v release];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
}


- (void)viewDidUnload {
    
    [super viewDidUnload];
}


- (BOOL)canBecomeFirstResponder {
    
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {

    if (lastAcceleration) {

        if (!shakeTriggered && [self checkIfShaking:acceleration threshold:0.7]) {
            
            shakeTriggered = YES;
            
            // Shake happened.
            
        } else if (shakeTriggered && ![self checkIfShaking:acceleration threshold:0.2]) {

            shakeTriggered = NO;
        }
    }
    
    lastAcceleration = acceleration;
}

// Ensures the shake is strong enough on at least two axes before declaring it a shake.
// "Strong enough" means "greater than a client-supplied threshold" in G's.
- (BOOL)checkIfShaking:(UIAcceleration *)current threshold:(double)threshold {

    double  deltaX = fabs(lastAcceleration.x - current.x),
            deltaY = fabs(lastAcceleration.y - current.y),
            deltaZ = fabs(lastAcceleration.z - current.z);
    
    return  (deltaX > threshold && deltaY > threshold) ||
            (deltaX > threshold && deltaZ > threshold) ||
            (deltaY > threshold && deltaZ > threshold);
}

@end

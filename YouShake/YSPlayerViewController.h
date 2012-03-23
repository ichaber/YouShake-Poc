//
//  YSPlayerViewController.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSPlayerView.h"

@interface YSPlayerViewController : UIViewController <YSPlayerViewDelegate, UIAccelerometerDelegate> {
    
    UIAcceleration *lastAcceleration;
    BOOL shakeTriggered;
}

- (BOOL)checkIfShaking:(UIAcceleration *)current threshold:(double)threshold;

@end

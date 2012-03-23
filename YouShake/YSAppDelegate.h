//
//  YSAppDelegate.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class YSLoginViewController, YSPlayerViewController;

@interface YSAppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate> {

    UIWindow *window;
    YSLoginViewController *loginViewController;
    YSPlayerViewController *playerViewController;
    Facebook *facebook;
}

@property (nonatomic, strong) UIWindow *window;

- (void)displayPlayerView;

- (void)displayLoginView;

@end

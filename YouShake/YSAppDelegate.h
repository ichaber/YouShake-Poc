//
//  YSAppDelegate.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSLoginViewController;

@interface YSAppDelegate : UIResponder <UIApplicationDelegate> {

    UIWindow *window;
    YSLoginViewController *loginViewController;
}

@property (nonatomic, strong) UIWindow *window;

@end

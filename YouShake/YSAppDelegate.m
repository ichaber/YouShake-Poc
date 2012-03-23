//
//  YSAppDelegate.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSAppDelegate.h"
#import "YSLoginViewController.h"

@implementation YSAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setWindow:mainWindow];
    [mainWindow release];
    
    BOOL loggedIn = NO;
    
    if (!loggedIn) {
     
        loginViewController = [[YSLoginViewController alloc] init];
        
        [[self window] addSubview:[loginViewController view]];
    }
    else {
     
        // TODO Skip the login, show main view.
    }
    
    [[self window] makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (void)dealloc {
    
    [window release];
    [super dealloc];
}

@end

//
//  YSAppDelegate.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSAppDelegate.h"
#import "YSLoginViewController.h"
#import "YSPlayerViewController.h"
#import "YSUserDefaults.h"

@implementation YSAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setWindow:mainWindow];
    [mainWindow release];
    
    [facebook release];
    facebook = [[Facebook alloc] initWithAppId:kYouShakeFacebookAppID andDelegate:nil];
    [facebook setAccessToken:[YSUserDefaults facebookOAuthToken]];
    [facebook setExpirationDate:[YSUserDefaults facebookAuthExpireDate]];
        
    if (![facebook isSessionValid]) {
     
        NSLog(@"Not logged in.");
        
        [self displayLoginView];
    }
    else {
     
        NSLog(@"You are already logged in!");
        
        [self displayPlayerView];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    BOOL isFacebookURL = [[url scheme] isEqualToString:[NSString stringWithFormat:@"fb%@", kYouShakeFacebookAppID]];    

    if (isFacebookURL) {
        
        [facebook release];
		facebook = [[Facebook alloc] initWithAppId:kYouShakeFacebookAppID andDelegate:self];
        [facebook handleOpenURL:url];
    }
    
    return isFacebookURL;
}


- (void)displayLoginView {
    
    if (loginViewController) {

        return;
    }
    
    if (playerViewController) {
        
        [[playerViewController view] removeFromSuperview];
        [playerViewController release];
        playerViewController = nil;
    }
    
    loginViewController = [[YSLoginViewController alloc] init];
    
    [[self window] addSubview:[loginViewController view]];
    [[self window] makeKeyAndVisible];
}


- (void)displayPlayerView {
    
    if (playerViewController) {

        return;
    }
    
    if (loginViewController) {
        
        [[loginViewController view] removeFromSuperview];
        [loginViewController release];
        loginViewController = nil;
    }
    
    playerViewController = [[YSPlayerViewController alloc] init];
    
    [[self window] addSubview:[playerViewController view]];
    [[self window] makeKeyAndVisible];
}


#pragma mark - FBSessionDelegate Methods


- (void)fbDidLogin {
 
    NSLog(@"fbDidLogin");
    
    [YSUserDefaults setFacebookOAuthToken:[facebook accessToken]];
    [YSUserDefaults setFacebookAuthExpireDate:[facebook expirationDate]];
    
    NSLog(@"Got Token: %@", [facebook accessToken]);
    NSLog(@"  Expires: %@", [facebook expirationDate]);
    
    if ([facebook isSessionValid]) {
        
        [self displayPlayerView];
    }
}


- (void)fbDidNotLogin:(BOOL)cancelled {

    NSLog(@"fbDidLogin:%d", cancelled);
    
    [self displayLoginView];
}


- (void)fbDidLogout {
    
    NSLog(@"fbDidLogout");
    
    [self displayLoginView];
}


- (void)fbSessionInvalidated {
    
    NSLog(@"fbSessionInvalidated");
}

- (void)fbDidExtendToken:(NSString*)accessToken expiresAt:(NSDate*)expiresAt {

    NSLog(@"fbDidExtendToken:%@ expiresAt:%@", accessToken, expiresAt);
}


#pragma mark - UIApplicationDelegate Methods


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
    [facebook release];
    [loginViewController release];
    [playerViewController release];
    [super dealloc];
}

@end

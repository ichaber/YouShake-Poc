//
//  YSUserDefaults.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSUserDefaults.h"

#define kYSUserDefaultsFacebookOAuthToken @"YSUserDefaultsFacebookOAuthToken"
#define kYSUserDefaultsFacebookExpireDate @"YSUserDefaultsFacebookExpireDate"

@implementation YSUserDefaults

+ (void)setFacebookOAuthToken:(NSString *)token {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:kYSUserDefaultsFacebookOAuthToken];
    [defaults synchronize];
}

+ (NSString *)facebookOAuthToken {
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:kYSUserDefaultsFacebookOAuthToken];
}

+ (void)setFacebookAuthExpireDate:(NSDate *)expireDate {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:expireDate forKey:kYSUserDefaultsFacebookExpireDate];
    [defaults synchronize];
}

+ (NSDate *)facebookAuthExpireDate {
    
    return (NSDate *)[[NSUserDefaults standardUserDefaults] objectForKey:kYSUserDefaultsFacebookExpireDate];
}

@end
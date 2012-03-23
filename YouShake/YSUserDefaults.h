//
//  YSUserDefaults.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YSUserDefaults : NSObject

+ (void)setFacebookOAuthToken:(NSString *)token;
+ (NSString *)facebookOAuthToken;

+ (void)setFacebookAuthExpireDate:(NSDate *)expireDate;
+ (NSDate *)facebookAuthExpireDate;

@end

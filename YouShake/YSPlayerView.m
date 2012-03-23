//
//  YSPlayerView.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSPlayerView.h"

@implementation YSPlayerView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {

        [self setBackgroundColor:[UIColor whiteColor]];
        
        shakeText = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [shakeText setText:@"Shake for a recommended YouTube\u2122 video!"];
        [shakeText setTextColor:[UIColor darkGrayColor]];
        [shakeText setFont:kYouShakeDefaultFont];
        
        [self addSubview:shakeText];
        
        [shakeText release];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect selfRect = [self bounds];
    
    CGSize textSize = [[shakeText text] sizeWithFont:[shakeText font]];
    
    [shakeText setFrame:CGRectMake(floor(0.5 * (selfRect.size.width - textSize.width)),
                                   floor(0.5 * (selfRect.size.height - textSize.height)), 
                                   textSize.width, 
                                   textSize.height)];
}

@end

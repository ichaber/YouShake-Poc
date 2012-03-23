//
//  YSLoginView.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSLoginView.h"
#import "UIButton+Extensions.h"

@implementation YSLoginView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {

        [self setBackgroundColor:[UIColor whiteColor]];
        
        UIImage *fbUpImage = [UIImage imageNamed:@"facebook-login-up.png"];
        UIImage *fbDownImage = [UIImage imageNamed:@"facebook-login-highlight.png"];
        
        loginButton = [UIButton buttonWithImage:fbUpImage
                                 highlightImage:fbDownImage 
                                         target:self 
                                       selector:@selector(facebookLoginButtonPressed:)];
        
        [self addSubview:loginButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect selfRect = [self bounds];
    
    CGSize buttonSize = [loginButton frame].size;
    
    [loginButton setFrame:CGRectMake(floor(0.5 * (selfRect.size.width - buttonSize.width)),
                                     floor(0.5 * (selfRect.size.height - buttonSize.height)), 
                                     buttonSize.width, 
                                     buttonSize.height)];
}

- (void)facebookLoginButtonPressed:(id)sender {
    
    if (delegate && [delegate respondsToSelector:@selector(loginView:facebookButtonPressed:)]) {
        
        [delegate loginView:self facebookButtonPressed:sender];
    }
}

@end

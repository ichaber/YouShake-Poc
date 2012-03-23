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
    
    if (shakeText) {

        CGSize textSize = [[shakeText text] sizeWithFont:[shakeText font]];
        
        [shakeText setFrame:CGRectMake(floor(0.5 * (selfRect.size.width - textSize.width)),
                                       floor(0.5 * (selfRect.size.height - textSize.height)), 
                                       textSize.width, 
                                       textSize.height)];
    }
    
    if (webView) {
        
        [webView setFrame:selfRect];
    }
}


- (void)createWebView {
    
    if (!webView) {
        
        webView = [[UIWebView alloc] initWithFrame:[self bounds]];
        
        [webView setMediaPlaybackRequiresUserAction:NO];
        [webView setDelegate:self];
        
        // Disable scrolling in the WebView
        for (UIView *sv in [webView subviews]) {
            
            if ([sv isKindOfClass:[UIScrollView class]]) {
                
                [(UIScrollView *)sv setScrollEnabled:NO];
                break;
            }
        }
                
        [self addSubview:webView];
        [webView release];
        
        // Load up the player
        NSString *htmlLoc = [[NSBundle mainBundle] pathForResource:@"player" 
                                                            ofType:@"html"];
        
        NSData *htmlData = [NSData dataWithContentsOfFile:htmlLoc]; 
        
        [webView loadData:htmlData 
                 MIMEType:kYSPlayerViewHTMLMimeType 
         textEncodingName:kYSPlayerViewHTMLTextEncoding
                  baseURL:nil];
    }
}


- (void)displayWebViewIfNeeded {
 
    if (shakeText) {
        
        [UIView animateWithDuration:0.5 
                         animations:^{
            
                             [shakeText setAlpha:0.0];
                         } 
                         completion:^(BOOL finished) {
            
                            [shakeText removeFromSuperview], shakeText = nil;
                            [self createWebView];
                         }];
    }
    else {
        
        [self createWebView];
    }
}


- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    
    NSLog(@"webViewDidFinishLoad");
    
    if (!isLoaded) {
        
        isLoaded = YES;
        
        [webView stringByEvaluatingJavaScriptFromString:@"YouShake.Video.load('youtube', 'TzaVd6zl2bA')"];
    }
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    NSLog(@"webViewDidFailLoadWithError: %@", [error localizedDescription]);
}


- (BOOL)webView:(UIWebView *)theWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"URLRequest: %@", [request URL]);
    
    return YES;
}


@end

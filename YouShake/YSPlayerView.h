//
//  YSPlayerView.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYSPlayerViewHTMLMimeType @"text/html"
#define kYSPlayerViewHTMLTextEncoding @"UTF-8"

@protocol YSPlayerViewDelegate;

@interface YSPlayerView : UIView <UIWebViewDelegate> {

    id <YSPlayerViewDelegate>delegate;
    UILabel *shakeText;
    UIWebView *webView;
    BOOL isLoaded;
}

@property (nonatomic, readwrite, assign) id <YSPlayerViewDelegate>delegate;
@property (nonatomic, readonly) BOOL isLoaded;

- (void)createWebView;

- (void)createShakeText;

- (void)displayWebViewIfNeeded;

- (void)loadVideo:(NSString *)youtubeID;

- (void)reset;

@end

@protocol YSPlayerViewDelegate <NSObject>

@optional
- (void)playerViewDidFinishLoading:(YSPlayerView *)playerView;
@end
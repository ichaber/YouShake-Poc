//
//  YSPlayerViewController.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSPlayerViewController.h"


@implementation YSPlayerViewController

- (id)init {
    
    if ((self = [super init])) {

    }
    
    return self;
}

- (void)loadView {
    
    [super loadView];
    
    YSPlayerView *v = [[YSPlayerView alloc] initWithFrame:[[self view] frame]];
    [v setDelegate:self];
    [self setView:v];
    [v release];
}


- (YSPlayerView *)playerView {
    
    return (YSPlayerView *)[self view];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
}


- (void)viewDidUnload {
    
    [super viewDidUnload];
}


- (BOOL)canBecomeFirstResponder {
    
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)handleShake {
    
    NSLog(@"Shook the phone, Fetching a video!");
    
    [[self playerView] displayWebViewIfNeeded];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {

    switch (motion) {
        case UIEventSubtypeMotionShake:
            [self handleShake];
            break;
            
        default:
            break;
    }
}

@end

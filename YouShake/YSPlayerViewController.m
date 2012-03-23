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

        randomVideos = [[NSArray arrayWithObjects:@"TzaVd6zl2bA", 
                         @"qqXi8WmQ_WM", @"SAbCyA2rbxM", nil] retain];
        
        index = 0;
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


- (void)playerViewDidFinishLoading:(YSPlayerView *)playerView {

    [[self playerView] loadVideo:[self randomVideoID]];
}


- (void)handleShake {
    
    NSLog(@"Shook the phone, Fetching a video!");
    
    [[self playerView] displayWebViewIfNeeded];
    
    if ([[self playerView] isLoaded]) {
    
        if (index < [randomVideos count]) {
         
            [[self playerView] loadVideo:[self randomVideoID]];
        }
        else {
            
            [[self playerView] reset];
            
            index = 0;
        }
    }
}


- (NSString *)randomVideoID {
        
    NSString *randomID = [randomVideos objectAtIndex:index];
    
    index += 1;
    
    NSLog(@"Loading Video: %@", randomID);
    
    return randomID;
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


- (void)dealloc {
    
    [super dealloc];
    
    [randomVideos release];
}

@end

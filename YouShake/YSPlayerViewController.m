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

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

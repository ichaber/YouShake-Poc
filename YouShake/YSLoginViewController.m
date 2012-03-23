//
//  YSLoginViewController.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSLoginViewController.h"
#import "YSLoginView.h"

@implementation YSLoginViewController

- (id)init {
    
    if ((self = [super init])) {

    }

    return self;
}

- (void)loadView {
    
    [super loadView];
    
    UIView *v = [[YSLoginView alloc] initWithFrame:[[self view] frame]];
    
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

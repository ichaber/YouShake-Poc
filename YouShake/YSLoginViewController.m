//
//  YSLoginViewController.m
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YSLoginViewController.h"

@implementation YSLoginViewController


- (id)init {
    
    if ((self = [super init])) {

    }

    return self;
}

- (void)loadView {
    
    [super loadView];
    
    YSLoginView *v = [[YSLoginView alloc] initWithFrame:[[self view] frame]];
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


#pragma mark YSLoginViewDelegate


- (void)loginView:(YSLoginView *)view facebookButtonPressed:(UIButton *)button {
    
    NSLog(@"Starting facebook login.");
    
    Facebook *facebook = [[Facebook alloc] initWithAppId:kYouShakeFacebookAppID 
                                             andDelegate:nil];
    
    [facebook authorize:kYouShakeFacebookAppPermissions];
}

@end

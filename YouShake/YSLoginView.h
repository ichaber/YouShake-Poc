//
//  YSLoginView.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSLoginViewDelegate;

@interface YSLoginView : UIView {
    
    id <YSLoginViewDelegate>delegate;
    UIButton *loginButton;
}

@property (nonatomic, readwrite, assign) id <YSLoginViewDelegate>delegate;

@end


@protocol YSLoginViewDelegate <NSObject>

@optional
- (void)loginView:(YSLoginView *)view facebookButtonPressed:(UIButton *)button;
@end
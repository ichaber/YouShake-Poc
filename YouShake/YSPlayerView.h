//
//  YSPlayerView.h
//  YouShake
//
//  Created by Nicholas Jensen on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSPlayerViewDelegate;

@interface YSPlayerView : UIView {

    id <YSPlayerViewDelegate>delegate;
    UILabel *shakeText;
}

@property (nonatomic, readwrite, assign) id <YSPlayerViewDelegate>delegate;

@end

@protocol YSPlayerViewDelegate <NSObject>

@optional
@end
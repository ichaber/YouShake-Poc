//
//  UIButton+Extensions.m
//  Frequency
//
//  Created by nrj on 8/4/11.
//  Copyright 2011 Front-Ended. All rights reserved.
//

#import "UIButton+Extensions.h"


@implementation UIButton (Extensions)

+ (UIButton *)buttonWithImage:(UIImage *)image {
    
    return [UIButton buttonWithImage:image highlightImage:nil target:nil selector:nil];
}


+ (UIButton *)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target selector:(SEL)selector {
    
    return [UIButton buttonWithImage:image selectedImage:selectedImage initialState:UIControlStateNormal target:target selector:selector];
}

+ (UIButton *)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage initialState:(UIControlState)state target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(0, 0, [image size].width, [image size].height)];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];        
    [btn setImage:selectedImage forState:(UIControlStateHighlighted | UIControlStateSelected)];

    [btn setAdjustsImageWhenHighlighted:NO];
    [btn setSelected:(state == UIControlStateSelected)];
    
    [btn addTarget:target 
            action:selector 
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (UIButton *)buttonWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, [image size].width, [image size].height)];
    [btn setAdjustsImageWhenDisabled:NO];
    
    if (highlightImage) {
        
        [btn setImage:highlightImage forState:UIControlStateHighlighted];        

    }
        
    [btn addTarget:target 
            action:selector 
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (UIButton *)buttonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage selectedImage:(UIImage *)selectedImage target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(0, 0, [image size].width, [image size].height)];
    
    [btn setAdjustsImageWhenDisabled:NO];
    
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn setImage:highlightedImage forState:(UIControlStateHighlighted | UIControlStateSelected)];

    [btn setImage:selectedImage forState:UIControlStateSelected];      
    [btn setImage:selectedImage forState:(UIControlStateSelected|UIControlStateDisabled)];      
    
    [btn addTarget:target 
            action:selector 
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (UIButton *)buttonWithImage:(UIImage *)image 
             highlightedImage:(UIImage *)highlightedImage 
                selectedImage:(UIImage *)selectedImage 
       selectedHighlightImage:(UIImage *)selectedHighlightImage 
                       target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(0, 0, [image size].width, [image size].height)];
    [btn setAdjustsImageWhenDisabled:NO];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn setImage:selectedHighlightImage forState:(UIControlStateHighlighted | UIControlStateSelected)];    
    
    [btn addTarget:target 
            action:selector 
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


@end

//
//  UIButton+Extensions.h
//  Frequency
//
//  Created by nrj on 8/4/11.
//  Copyright 2011 Front-Ended. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIButton (Extensions)

+ (UIButton *)buttonWithImage:(UIImage *)image;

+ (UIButton *)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target selector:(SEL)selector;

+ (UIButton *)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage initialState:(UIControlState)state target:(id)target selector:(SEL)selector;

+ (UIButton *)buttonWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector;

+ (UIButton *)buttonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage selectedImage:(UIImage *)selectedImage target:(id)target selector:(SEL)selector;

+ (UIButton *)buttonWithImage:(UIImage *)image 
             highlightedImage:(UIImage *)highlightedImage 
                selectedImage:(UIImage *)selectedImage 
       selectedHighlightImage:(UIImage *)selectedHighlightImage 
                       target:(id)target selector:(SEL)selector;


@end

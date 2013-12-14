//
//  SlideFromBottomBrowserAnimator.m
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/14/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import "SlideFromBottomBrowserAnimator.h"

@implementation SlideFromBottomBrowserAnimator
-(void)showView:(UIView *)showedView inView:(UIView *)superView
{
    CGRect selfFrame = showedView.frame;
    
    showedView.frame = CGRectMake(showedView.frame.origin.x, superView.bounds.size.height, showedView.bounds.size.width, showedView.bounds.size.height);
    [UIView animateWithDuration:0.3 animations:^(void){
        
        [superView addSubview:showedView];
        
        showedView.frame = selfFrame;
        
    } completion:^(BOOL finished){
        
        
    }];
}
-(void)removeView:(UIView *)removedView 
{
    [UIView animateWithDuration:0.3 animations:^(void){
        
        
        
        removedView.frame = CGRectMake(removedView.frame.origin.x, removedView.window.bounds.size.height, removedView.bounds.size.width, removedView.bounds.size.height);
        
    } completion:^(BOOL finished){
        
        
        [removedView removeFromSuperview];
    }];
}
@end

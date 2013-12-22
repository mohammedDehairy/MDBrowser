//
//  PopUpBrowserAnimator.m
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/14/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import "PopUpBrowserAnimator.h"

@implementation PopUpBrowserAnimator
-(void)showView:(UIView *)showedView inView:(UIView *)superView
{
    CATransform3D transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
    
    showedView.layer.transform = transform;
    
    
    [UIView animateWithDuration:0.3 animations:^(void){
        
        [superView addSubview:showedView];
        showedView.alpha = 1.0;
        
        showedView.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1.05);
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.2 animations:^(void){
            
            showedView.layer.transform = CATransform3DMakeScale(0.95, 0.95, 0.95);
            
            
            
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.2 animations:^(void){
                
                showedView.layer.transform = CATransform3DIdentity;
                
                
                
            } completion:^(BOOL finished){
                
                
            }];
            
        }];
        
        
    }];

}
-(void)removeView:(UIView *)removedView withCompletionBlock:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:0.2 animations:^(void){
        
        
        removedView.alpha = 0.0;
        removedView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
        
    } completion:^(BOOL finished){
        [removedView removeFromSuperview];
        removedView.layer.transform = CATransform3DIdentity;
        completionBlock(YES);
        
    }];
}
@end

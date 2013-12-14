//
//  MDBrowserAnimatorFactory.m
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/14/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import "MDBrowserAnimatorFactory.h"

@implementation MDBrowserAnimatorFactory
+(id<MDBrowserAnimator>)getAnimatoreWithAnimationType:(MDBrowserPresetationAnimationType)animationType
{
    switch (animationType) {
        case MDBrowserPresetationAnimationTypePopUp:
            return [[PopUpBrowserAnimator alloc] init];
            break;
        case MDBrowserPresetationAnimationTypeSlideFromBottom:
            return [[SlideFromBottomBrowserAnimator alloc] init];
            
        default:
            break;
    }
}
@end

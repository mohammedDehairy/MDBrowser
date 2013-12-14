//
//  MDBrowserAnimatorFactory.h
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/14/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDBrowserAnimator.h"
#import "PopUpBrowserAnimator.h"
#import "SlideFromBottomBrowserAnimator.h"
typedef enum
{
    MDBrowserPresetationAnimationTypePopUp,
    MDBrowserPresetationAnimationTypeSlideFromBottom
    
}MDBrowserPresetationAnimationType;
@interface MDBrowserAnimatorFactory : NSObject
+(id<MDBrowserAnimator>)getAnimatoreWithAnimationType:(MDBrowserPresetationAnimationType)animationType;
@end

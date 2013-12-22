//
//  MDBrowserAnimator.h
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/14/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MDBrowserAnimator <NSObject>
-(void)showView:(UIView*)showedView inView:(UIView*)superView;
-(void)removeView:(UIView*)removedView withCompletionBlock:(void (^)(BOOL finished))completionBlock;
@end

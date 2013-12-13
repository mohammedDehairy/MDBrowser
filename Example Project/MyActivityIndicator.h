//
//  MyActivityIndicator.h
//  ArabicNews1.0
//
//  Created by Mohammed Eldehairy on 10/14/12.
//  Copyright (c) 2012 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface MyActivityIndicator : UIView
{
    IBOutlet UIActivityIndicatorView *indicator;
}
-(void)startAnimating;
-(void)stopAnimating;
-(void)setHiddenWhenStopped:(BOOL)H;
@end

//
//  MyActivityIndicator.m
//  ArabicNews1.0
//
//  Created by Mohammed Eldehairy on 10/14/12.
//  Copyright (c) 2012 Mohammed Eldehairy. All rights reserved.
//

#import "MyActivityIndicator.h"

@implementation MyActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *view = (UIView*)[[[NSBundle mainBundle] loadNibNamed:@"ActivityView" owner:self options:nil] objectAtIndex:0];
        view.layer.cornerRadius = 10;
        view.frame = frame;
        [self addSubview:view];
        view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin;
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        self.autoresizesSubviews = YES;
        
       /* UIImageView *loadingimageView = (UIImageView*)[self viewWithTag:101];
        loadingimageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"000012.gif"],
                                             [UIImage imageNamed:@"000112.gif"],
                                             [UIImage imageNamed:@"000212.gif"],
                                             [UIImage imageNamed:@"000312.gif"],
                                            [UIImage imageNamed:@"000412.gif"],
                                            [UIImage imageNamed:@"000512.gif"],
                                            [UIImage imageNamed:@"000612.gif"],
                                            [UIImage imageNamed:@"000712.gif"],
                                            [UIImage imageNamed:@"000812.gif"],
                                            [UIImage imageNamed:@"000912.gif"],
                                            [UIImage imageNamed:@"001012.gif"],
                                            [UIImage imageNamed:@"001112.gif"],
                                            [UIImage imageNamed:@"001212.gif"],
                                            
                                            nil];
        loadingimageView.animationDuration = 1.0f;
        loadingimageView.animationRepeatCount = 10000;*/
        //[loadingimageView startAnimating];
        
    }
    return self;
}
-(UIImageView*)getImageLoader
{
    UIImageView *loadingimageView = (UIImageView*)[self viewWithTag:101];
    return loadingimageView;
}
-(void)startAnimating
{
    [indicator startAnimating];
    [self setHidden:NO];
}
-(void)stopAnimating
{
    [indicator stopAnimating];
    [self setHidden:YES];
}
-(void)setHiddenWhenStopped:(BOOL)H
{
    [indicator setHidesWhenStopped:H];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

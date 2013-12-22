//
//  MDBrowser.m
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/13/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import "MDBrowser.h"

@implementation MDBrowser

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(interfaceOrientationChanged) name:@"UIDeviceOrientationDidChangeNotification"  object:nil];
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        browser = [[UIWebView alloc] initWithFrame:CGRectMake(0,0, frame.size.width-20, frame.size.height-55)];
        browser.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        self.clipsToBounds = NO;
        ContainerView = [[UIView alloc] initWithFrame:CGRectMake(10,5, frame.size.width-20, frame.size.height-5)];
        [self addSubview:ContainerView];
        ContainerView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        ContainerView.layer.cornerRadius = 10;
        ContainerView.clipsToBounds = YES;
        
        closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        closeBtn.frame = CGRectMake(0, 0, 20, 20);
        closeBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        [closeBtn addTarget:self action:@selector(CancelLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:closeBtn];
        
        
        browser.delegate = self;
        browser.scalesPageToFit = YES;
        
        ContainerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        ContainerView.layer.borderWidth = 5;
        [ContainerView addSubview:browser];
        
        buttonsView = [[UIView alloc] initWithFrame:CGRectMake(0, ContainerView.frame.size.height-50, ContainerView.frame.size.width, 50)];
        buttonsView.backgroundColor = [UIColor colorWithRed:(241.0f/255.0f) green:(241.0f/255.0f) blue:(241.0f/255.0f) alpha:1.0];
        buttonsView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth;
        [ContainerView addSubview:buttonsView];
        
        
        
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, ContainerView.frame.size.width/2, 50);
        backBtn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back_active.png"] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(BackAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttonsView addSubview:backBtn];
        
        UIButton *forwardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        forwardBtn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        forwardBtn.frame = CGRectMake(ContainerView.frame.size.width/2, 0, ContainerView.frame.size.width/2, 50);
        [forwardBtn addTarget:self action:@selector(ForwardAction:) forControlEvents:UIControlEventTouchUpInside];
        [forwardBtn setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
        [forwardBtn setImage:[UIImage imageNamed:@"next_active.png"] forState:UIControlStateHighlighted];
        [buttonsView addSubview:forwardBtn];
        
        UIView *topSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ContainerView.frame.size.width, 1)];
        topSeparator.backgroundColor = [UIColor colorWithRed:(37.0f/255.0f) green:(37.0f/255.0f) blue:(37.0f/255.0f) alpha:0.4];
        topSeparator.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [buttonsView addSubview:topSeparator];
        
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake((ContainerView.frame.size.width/2)-1, 0, 1, 50)];
        separator.backgroundColor = [UIColor colorWithRed:(37.0f/255.0f) green:(37.0f/255.0f) blue:(37.0f/255.0f) alpha:0.4];
        separator.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleHeight;
        [buttonsView addSubview:separator];
        
        [self bringSubviewToFront:closeBtn];
    }
    return self;
}
-(void)interfaceOrientationChanged
{
    [self setWebViewFrame:buttonsView.hidden];
    [self setCloseBtnFrame];
}
-(void)setWebViewFrame:(BOOL)buttonsHidden
{
    if(buttonsHidden)
    {
        browser.frame = CGRectMake(0, 0, ContainerView.bounds.size.width, ContainerView.bounds.size.height-5);
    }else
    {
        browser.frame = CGRectMake(0, 0, ContainerView.bounds.size.width, ContainerView.bounds.size.height-50);
    }
}
-(void)setCloseBtnFrame
{
    if(UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
    {
        closeBtn.frame = CGRectMake(0, 0, 20, 20);
    }else
    {
        closeBtn.frame = CGRectMake(10, 0, 20, 20);
    }
}
-(void)setButtonsHidden:(BOOL)hidden
{
    buttonsView.hidden = hidden;
    [self setWebViewFrame:hidden];
}
- (void)ForwardAction:(id)sender
{
    if([browser canGoForward])
    {
        [self startAnimatingIndicator];
        [browser goForward];
        
    }
    if([_delegate respondsToSelector:@selector(browserUserDidTapForwardBtn:canGoForward:)])
    {
        [_delegate browserUserDidTapForwardBtn:self canGoForward:browser.canGoForward];
    }
}
- (void)BackAction:(id)sender
{
    if([browser canGoBack])
    {
        [self startAnimatingIndicator];
        [browser goBack];
    }
    if([_delegate respondsToSelector:@selector(browserUserDidTapBackBtn:canGoBackward:)])
    {
        [_delegate browserUserDidTapBackBtn:self canGoBackward:browser.canGoBack];
    }
}

- (void)LoadUrl:(NSURL *)url
{
    [browser loadRequest:[[NSURLRequest alloc] initWithURL:url]];
}
-(void)LoadHtmlString:(NSString*)html
{
    [browser loadHTMLString:html baseURL:nil];
}
- (void)startAnimatingIndicator
{
    [self StopAnimatingIndicator];
    if(!indicator)
    {
        indicator = [[MyActivityIndicator alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    indicator.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:indicator];
    
    [indicator startAnimating];
}
- (void)StopAnimatingIndicator
{
    [indicator stopAnimating];
    [indicator removeFromSuperview];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self StopAnimatingIndicator];
    if([_delegate respondsToSelector:@selector(browserDidFinishLoading:)])
    {
        [_delegate browserDidFinishLoading:self];
    }
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self startAnimatingIndicator];
    if([_delegate respondsToSelector:@selector(browserDidStartLoading:)])
    {
        [_delegate browserDidStartLoading:self];
    }
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if([_delegate respondsToSelector:@selector(browser:DidFailToLoadWithError:)])
    {
        [_delegate browser:self DidFailToLoadWithError:error];
    }
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if([_delegate respondsToSelector:@selector(browserShouldStartLoadWithRequest:withNavigationType:)])
    {
        return [_delegate browserShouldStartLoadWithRequest:request withNavigationType:navigationType];
    }else
    {
        return YES;
    }
}
- (void)CancelLoginAction:(id)sender
{
    [self removeFromView];
}
- (void)removeFromView
{
    
    
    [self StopAnimatingIndicator];
    
    
    [[MDBrowserAnimatorFactory getAnimatoreWithAnimationType:animationType] removeView:self withCompletionBlock:^(BOOL finished){
    
        [UIView animateWithDuration:0.2 animations:^(void){
        
            overlayView.alpha = 0.0;
        
        } completion:^(BOOL finished){
        
            [overlayView removeFromSuperview];
        
        }];
        
    
    }];
    
    if([_delegate respondsToSelector:@selector(browserViewUserTapedCloseButton:)])
    {
        [_delegate browserViewUserTapedCloseButton:self];
    }
    [browser loadHTMLString:@"" baseURL:nil];
    
    
}
- (void)ShowInView:(UIView *)View
{
    
    
    [self ShowInView:View AddOverLayToSuperView:YES withAnimationType:MDBrowserPresetationAnimationTypePopUp];

   

}
- (void)ShowInView:(UIView *)View AddOverLayToSuperView:(BOOL)addlyOverlay withAnimationType:(MDBrowserPresetationAnimationType)animation
{
    animationType = animation;
    if(addlyOverlay)
    {
        if(!overlayView)
        {
            overlayView = [[MJPopupBackgroundView alloc] initWithFrame:View.bounds];
            overlayView.backgroundColor = [UIColor clearColor];
            overlayView.alpha = 0.0f;
            overlayView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            
            
        }
        [View addSubview:overlayView];
        [UIView animateWithDuration:0.2 animations:^(void){
            
            overlayView.alpha = 1.0;
            
        } completion:^(BOOL finished){
            
            
        }];
    }
    [[MDBrowserAnimatorFactory getAnimatoreWithAnimationType:animation] showView:self inView:View];
    
    
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

//
//  MDBrowser.h
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/13/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyActivityIndicator.h"
@protocol BrowserViewDelegate;
@interface MDBrowser : UIView <UIWebViewDelegate>
{
    MyActivityIndicator *indicator;
    UIWebView *browser;
    UIView *ContainerView;
    UIView *buttonsView;
}
@property(nonatomic,weak)id<BrowserViewDelegate> delegate;
-(void)setButtonsHidden:(BOOL)hidden;
- (void)removeFromView;
-(void)LoadUrl:(NSURL*)url;
-(void)LoadHtmlString:(NSString*)html;
-(void)ShowInView:(UIView*)View;
@end
@protocol BrowserViewDelegate <NSObject>
-(void)browserViewUserTapedCloseButton:(MDBrowser*)browser;
-(BOOL)browserShouldStartLoadWithRequest:(NSURLRequest*)request withNavigationType:(UIWebViewNavigationType)navType;
-(void)browserDidFinishLoading:(MDBrowser*)browser;
-(void)browserDidStartLoading:(MDBrowser*)browser;
-(void)browser:(MDBrowser*)browser DidFailToLoadWithError:(NSError*)err;
-(void)browserUserDidTapForwardBtn:(MDBrowser*)browser canGoForward:(BOOL)canGoForward;
-(void)browserUserDidTapBackBtn:(MDBrowser*)browser canGoBackward:(BOOL)canGoBackward;
@end

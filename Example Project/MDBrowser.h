//
//  MDBrowser.h
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/13/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyActivityIndicator.h"
#import "MJPopupBackgroundView.h"
@protocol BrowserViewDelegate;
#import "MDBrowserAnimatorFactory.h"
@interface MDBrowser : UIView <UIWebViewDelegate>
{
    MyActivityIndicator *indicator;
    UIWebView *browser;
    UIView *ContainerView;
    UIView *buttonsView;
    MJPopupBackgroundView *overlayView;
    MDBrowserPresetationAnimationType animationType;
    UIButton *closeBtn;
}
@property(nonatomic,weak)id<BrowserViewDelegate> delegate;
-(void)setButtonsHidden:(BOOL)hidden;
- (void)removeFromView;
-(void)LoadUrl:(NSURL*)url;
-(void)LoadHtmlString:(NSString*)html;
-(void)ShowInView:(UIView*)View;
- (void)ShowInView:(UIView *)View AddOverLayToSuperView:(BOOL)addlyOverlay withAnimationType:(MDBrowserPresetationAnimationType)animation;
@end
@protocol BrowserViewDelegate <NSObject>
@optional
-(void)browserViewUserTapedCloseButton:(MDBrowser*)browser;
-(BOOL)browserShouldStartLoadWithRequest:(NSURLRequest*)request withNavigationType:(UIWebViewNavigationType)navType;
-(void)browserDidFinishLoading:(MDBrowser*)browser;
-(void)browserDidStartLoading:(MDBrowser*)browser;
-(void)browser:(MDBrowser*)browser DidFailToLoadWithError:(NSError*)err;
-(void)browserUserDidTapForwardBtn:(MDBrowser*)browser canGoForward:(BOOL)canGoForward;
-(void)browserUserDidTapBackBtn:(MDBrowser*)browser canGoBackward:(BOOL)canGoBackward;
@end

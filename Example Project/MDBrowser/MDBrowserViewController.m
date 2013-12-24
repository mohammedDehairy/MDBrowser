//
//  MDBrowserViewController.m
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/13/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import "MDBrowserViewController.h"

@interface MDBrowserViewController ()

@end

@implementation MDBrowserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showBrowserAction:(id)sender
{
    browser = [[MDBrowser alloc] initWithFrame:CGRectMake(0, 25, self.view.bounds.size.width, self.view.bounds.size.height-100)];
    browser.delegate = self;
    [browser ShowInView:self.view AddOverLayToSuperView:YES withAnimationType:MDBrowserPresetationAnimationTypePopUp];
    [browser LoadUrl:[NSURL URLWithString:@"http://www.google.com"]];
    [browser setButtonsHidden:switch1.on];
}
-(void)switchChanged:(id)sender
{
    [browser setButtonsHidden:switch1.on];
}


//*******************************  BROWSER VIEW DELEGATE ************************************************************
//*******************************************************************************************************************



-(BOOL)browserShouldStartLoadWithRequest:(NSURLRequest *)request withNavigationType:(UIWebViewNavigationType)navType
{
    // called when a request is about to be loaded And return whether the request should be loaded or not 
    return YES;
}
-(void)browserViewUserTapedCloseButton:(MDBrowser *)browser
{
    // called when user tap the close button
}
-(void)browserDidStartLoading:(MDBrowser *)browser
{
    // called when browser start loading a page
}
-(void)browserDidFinishLoading:(MDBrowser *)browser
{
    // called when browser finish loading a page
}
-(void)browser:(MDBrowser *)browser DidFailToLoadWithError:(NSError *)err
{
    // called when browser fail to load a page
}
-(void)browserUserDidTapForwardBtn:(MDBrowser *)browser canGoForward:(BOOL)canGoForward
{
    // called when user tap forward button with bool parameter whether the browser can go forward or not
}
-(void)browserUserDidTapBackBtn:(MDBrowser *)browser canGoBackward:(BOOL)canGoBackward
{
    // called when user tap back button with bool parameter whether the browser can go backward or not
}
@end

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
    if(!browser)
        browser = [[MDBrowser alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300)];
    [browser ShowInView:self.view];
    [browser LoadUrl:[NSURL URLWithString:@"http://www.google.com"]];
    [browser setButtonsHidden:switch1.on];
}
-(void)switchChanged:(id)sender
{
    
}
@end

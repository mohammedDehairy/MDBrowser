//
//  MDBrowserViewController.h
//  MDBrowser
//
//  Created by Mohammed Eldehairy on 12/13/13.
//  Copyright (c) 2013 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDBrowser.h"
@interface MDBrowserViewController : UIViewController
{
    MDBrowser *browser;
    IBOutlet UISwitch *switch1;
}
-(IBAction)showBrowserAction:(id)sender;
-(IBAction)switchChanged:(id)sender;
@end

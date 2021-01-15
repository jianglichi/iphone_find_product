//
//  AlertAnimationViewController.m
//  AlertAnimation
//
//  Created by babyfish0226 on 2009/3/29.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AlertAnimationViewController.h"

@implementation AlertAnimationViewController

@synthesize myWebView,myAlert;

-(void) NavURL{
	[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iphonetw.net"]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	
	if (myAlert==nil){		
	
	myAlert = [[UIAlertView alloc] initWithTitle: nil
															message: @"正在讀取網路資料"
														   delegate: self
												  cancelButtonTitle: nil
												  otherButtonTitles: nil];
	
	
	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	activityView.frame = CGRectMake(120.f, 48.0f, 37.0f, 37.0f);
	[myAlert addSubview:activityView];
	[activityView startAnimating];
	
	[myAlert show];
}
	
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[myAlert dismissWithClickedButtonIndex:0 animated:YES];
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//    [super viewDidLoad];
	[self NavURL];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[myWebView release];
	[myAlert release];
    [super dealloc];
}

@end

//
//  AlertAnimationViewController.h
//  AlertAnimation
//
//  Created by babyfish0226 on 2009/3/29.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertAnimationViewController : UIViewController<UIWebViewDelegate> {
IBOutlet	UIWebView *myWebView;
	UIAlertView *myAlert; 
}

@property (nonatomic,retain) UIWebView *myWebView;
@property (nonatomic,retain) UIAlertView *myAlert; 

-(void) NavURL;

@end


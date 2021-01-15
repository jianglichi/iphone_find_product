#import <UIKit/UIKit.h>
#import "AsynchronousImageView.h"


@interface view_yahoo_product : UIViewController <UIApplicationDelegate,UIWebViewDelegate >
{
	UIColor *defaultTintColor;
	
	IBOutlet UIWebView* web;
	UIAlertView *myAlert; 
}

@property (nonatomic, retain) IBOutlet UIWebView* web;




- (id)initWithFrame :(NSString *) url  ;

- (IBAction)segmentAction:(id)sender;


@end

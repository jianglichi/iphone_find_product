#import "view_yahoo_product.h"


@implementation view_yahoo_product



@synthesize web;

NSString *product_url;

//UILabel *yourLabel;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
	
	//subject.numberOfLines = 0;
	
	return self;
}


- (id)initWithFrame :(NSString *) url  
{
	product_url = url;
	/*
	view_subject = [listItems objectAtIndex:(nowRow*rowcount+1)];
	[main_img loadImageFromURLString:[listItems objectAtIndex:nowRow*rowcount]];
	
	//main_img.image = asyncImage.image;
	//[main_img loadImageFromURLString:[listItems objectAtIndex:nowRow*rowcount]];
	
	imgurl = [listItems objectAtIndex:nowRow*rowcount];
	
	imgurl = [imgurl stringByReplacingOccurrencesOfString:@"s100"
								   withString:@"s200"];
	
	*/
	/*
	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
											 initWithItems:
											 [NSArray arrayWithObjects:@"上頁", @"下頁", nil]];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.frame = CGRectMake(0, 0, 95, 40);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = YES;
	UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
	
	//[segmentedControl release];
	
	self.navigationItem.rightBarButtonItem = segmentBarItem;
	*/
	
	
}





- (void)viewDidLoad {  
	
	UISegmentedControl *segmentedControl = [[[UISegmentedControl alloc]
											initWithItems:
											[NSArray arrayWithObjects:@"上頁", @"下頁", nil]]autorelease];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.frame = CGRectMake(0, 0, 95, 40);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = YES;
	UIBarButtonItem *segmentBarItem = [[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] autorelease];
	
	//[segmentedControl release];
	
	self.navigationItem.rightBarButtonItem = segmentBarItem;
	
	
	
	myAlert = [[UIAlertView alloc] initWithTitle: nil
										 message: @"資料讀取中"
										delegate: self
							   cancelButtonTitle: nil
							   otherButtonTitles: nil];
	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	activityView.frame = CGRectMake(120.f, 48.0f, 37.0f, 37.0f);
	[myAlert addSubview:activityView];
	[activityView startAnimating];
	[myAlert show];

	[web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product_url]]];

	
}  


- (IBAction)segmentAction:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	
	if(segmentedControl.selectedSegmentIndex == 0 && self.web.canGoBack==true){
		[self.web goBack];
	}
	if(segmentedControl.selectedSegmentIndex == 1 && self.web.canGoForward==true){
		[self.web goForward];
	}
	//[segmentedControl release];
	
	
	
}




- (void)webViewDidStartLoad:(UIWebView *)webView{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{  
	[myAlert dismissWithClickedButtonIndex:0 animated:YES];
}



- (void)dealloc
{
    web.delegate = nil;
    [web stopLoading];
    [web release];

	[defaultTintColor release];
	[super dealloc];
}



@end

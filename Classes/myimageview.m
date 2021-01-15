//
//  myimage.m
//  test5
//
//  Created by jianglichi on 2011/2/14.
//  Copyright 2011 myhome. All rights reserved.
//

#import "myimageview.h"


@implementation myimageview

//@synthesize myview;

- (void)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	
	//self = [UIImageView alloc];
	//[self initWithFrame:frame];
	//[myview initWithFrame:frame];

	
	//[self.myview touchesBegan:(NSSet *)touches withEvent:<#(UIEvent *)event#>];

}




- (void)loadByUrl:(NSString *)url {

	NSURL *dataurl = [NSURL URLWithString:url];
	NSData *data = [NSData dataWithContentsOfURL:dataurl];
	UIImage *img = [[UIImage alloc] initWithData:data];
	self.image = img;
	
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"test touch");
	
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"11111YOur Message" message:@"11111111Your description"
												   delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];
	[alert release];
	
	
	
}





- (void)dealloc {
    [super dealloc];
}


@end

//
//  set_button.m
//  hiprice
//
//  Created by jianglichi on 2011/5/13.
//  Copyright 2011 myhome. All rights reserved.
//

#import "set_button.h"



@implementation set_button



@synthesize item_get_type1,item_get_type2,item_get_type3,item_get_type4,item_get_type5;
@synthesize price_start,price_end;
@synthesize sort_type;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	
	
	
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
    
	
    self.title = NSLocalizedString(@"ModalTitle", @"");
	
	//self.price_start = [UITextField alloc];
	//self.price_end = [UITextField alloc];
	
	
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor whiteColor];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) 
												 name:UIKeyboardWillShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) 
												 name:UIKeyboardWillHideNotification object:nil];
	
}

- (void)viewDidUnload
{


}

- (IBAction)dismissAction:(id)sender
{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
	

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}


- (void)keyboardWillShow:(NSNotification *)aNotification {
	
	
	
	//CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
	NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
	
	
	
	CGRect bounds = self.view.bounds;
	
	//bounds.origin.y += keyboardRect.size.height;
	bounds.origin.y += 110;
	
	
	[UIView beginAnimations:@"ResizeForKeyboard" context:nil];
	
	[UIView setAnimationDuration:animationDuration];
	
	self.view.bounds = bounds;
	
	[UIView commitAnimations];
	
}



- (void)keyboardWillHide:(NSNotification *)aNotification {
	

	CGRect _keyboardEndFrame;
	[[aNotification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue:&_keyboardEndFrame];
	CGFloat _keyboardHeight;
	if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) {
		_keyboardHeight = _keyboardEndFrame.size.height;
	}
	else {
		_keyboardHeight = _keyboardEndFrame.size.width;
	}	
	
CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
	
CGRect bounds = self.view.bounds;
	
//bounds.origin.y -= keyboardRect.size.height;
	bounds.origin.y -= 110;
	
	
[UIView beginAnimations:@"ResizeForKeyboard" context:nil];
	
[UIView setAnimationDuration:animationDuration];
	
self.view.bounds = bounds;
	
[UIView commitAnimations];
	
}




@end

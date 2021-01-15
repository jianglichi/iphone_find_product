//
//  testview.m
//  test5
//
//  Created by jianglichi on 2011/2/11.
//  Copyright 2011 myhome. All rights reserved.
//

#import "mytablecell.h"
#import "myimageview.h"


@implementation mytablecell


@synthesize startRow;
@synthesize endRow;

NSInteger nowRow;
myimageview *myiview;
UILabel *yourLabel;

- (id)initWithFrame:(CGRect)frame :(NSMutableArray *) listItems :(NSInteger)nowRow :(int)rowcount :(int)head_count :(int)fields_height {
    
    self = [super initWithFrame:frame];
    if (self) {
		
		
		//myimageview *myiview = [[myimageview alloc ]autorelease];
		//product img
		/*
		myiview = [myimageview alloc ];
		[myiview initWithFrame:CGRectMake(5, 5, 60, 60)];
		[myiview loadByUrl:[listItems objectAtIndex:(nowRow*3)]];
		[self addSubview:myiview];
		[myiview release];
		
		*/
		/*
		[myiview initWithFrame:CGRectMake(5, 5, 60, 60)];
		[myiview loadByUrl:[listItems objectAtIndex:(nowRow*3)]];
		[self addSubview:myiview];
		[myiview release];
		*/

		
		//商品名稱
		yourLabel = [UILabel alloc];
		[yourLabel initWithFrame:CGRectMake(fields_height, 2, 200, 50)];
		yourLabel.text = [listItems objectAtIndex:head_count+(nowRow*rowcount+1)];
        [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
		yourLabel.lineBreakMode = UILineBreakModeWordWrap; 
		yourLabel.numberOfLines = 0;
		[yourLabel setBackgroundColor:[UIColor clearColor] ];

		[self addSubview:yourLabel];
		[yourLabel release];
		
		
		//說明一
		yourLabel = [UILabel alloc];
		[yourLabel initWithFrame:CGRectMake(fields_height, 40, 200, 50)];
		yourLabel.text = [listItems objectAtIndex:head_count+(nowRow*rowcount+4)];
        [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 12.0f]];
		yourLabel.lineBreakMode = UILineBreakModeWordWrap; 
		yourLabel.numberOfLines = 0;
		[yourLabel setBackgroundColor:[UIColor clearColor] ];
		[self addSubview:yourLabel];
		[yourLabel release];
		
		
		
		//價格
		yourLabel = [UILabel alloc];
		[yourLabel initWithFrame:CGRectMake(fields_height, fields_height-25, 100, 25)];
		//yourLabel.text = @"價格";
		if([listItems objectAtIndex:head_count+(nowRow*rowcount+3)] != nil)
		yourLabel.text = [@"價格:" stringByAppendingString: [listItems objectAtIndex:head_count+(nowRow*rowcount+3)]];
        [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 16.0f]]; 
		yourLabel.textColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1];
		[self addSubview:yourLabel];
		[yourLabel release];
		
		

		
		NSLog(@"cell data make ok!! ");

		
		
		
    }
    return self;
}



- (IBAction) btntest:(id) sender{
	//NSLog(@"test touch");
	
	/*
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"11111YOur Message" message:@"11111111Your description"
												   delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];
	[alert release];*/
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[[NSNotificationCenter defaultCenter]removeObserver:self];

    [super dealloc];
}


@end

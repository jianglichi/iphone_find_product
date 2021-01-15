//
//  view_store.m
//  hiprice
//
//  Created by jianglichi on 2011/4/13.
//  Copyright 2011 myhome. All rights reserved.
//

#import "view_store.h"


@implementation view_store
@synthesize theSearchBar;   
@synthesize store;  
@synthesize tablemyview_store;  
@synthesize setbutton;
@synthesize Vstore;



int rowUsedList[300];
NSInteger rowcount;
NSString *searchtext;
int head_count; //搜尋回傳標頭筆數
int rowfields;  //搜尋回傳每筆欄位數
NSInteger nowpages;  //搜尋目前頁數 
int nowswitch; //目前menu
int fields_height;

- (void)viewDidLoad {  
	nowpages = 1;
	nowswitch = 1;
	head_count = 5;
	rowfields = 6;
	fields_height = 120;
	rowcount = 0;
	[self set_search_bar:1];
	store = [[price_store alloc]init];
	
	self.setbutton = [[set_button alloc] initWithNibName:
					  @"set_button" bundle:[NSBundle mainBundle] ];
	search_msg_store.text  = @"";
    [self.setbutton viewDidLoad]; //載入view 
	[super viewDidLoad];  
	
	
}  



// Since this view is only for searching give the UISearchBar   
// focus right away  
- (void)viewDidAppear:(BOOL)animated { 
	
	
	//if (self.setbutton == nil) {
	//	self.setbutton = [[[set_button alloc] initWithNibName:
	//					   @"set_button" bundle:[NSBundle mainBundle]] autorelease];
	//}
	
	// [self.theSearchBar1 becomeFirstResponder];  
	// [super viewDidAppear:animated];  
	//self.navigationController.navigationBarHidden = TRUE;
	//self.navigationItem.backBarButtonItem = nil;
	
	
	//UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:@"myButton" style:UIBarButtonItemStyleBordered target:self action:@selector(backAction:)]; 
	//self.navigationItem.backBarButtonItem = button;  
	// UIBarButtonItem *back=[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonSystemItemDone target:self action:@selector(backAction)];
    //[self.navigationController.navigationItem setHidesBackButton:YES];
    //self.navigationController.navigationItem.leftBarButtonItem=back;
    //[back release];
	
	
	
    //UIBarButtonItem * leftButtonItem = [[[UIBarButtonItem alloc] initWithTitle: @"Don't Show Again" 
	//										style: UIBarButtonItemStyleBordered target: self action: @selector(backAction)] autorelease];
	//  [[self navigationItem] setLeftBarButtonItem: leftButtonItem];
	
	//[tabbaritem setAction:@selector(pressItem1:)];
	//[tabbaritem setdelegate:self];
	NSLog(@"posi=------\n");
	
	
}  


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {  
	
	
	
	
	
	//[self.parentViewController performSelectorOnMainThread:@selector(threadImage) withObject:nil waitUnitilDone:NO];
	
	
	
	
	
	[self SearchItems :nowpages];
	//[myAlert dismissWithClickedButtonIndex:0 animated:YES];
	//[myAlert release];
	
}  



- (void)SearchItems :(NSInteger *)pages
{
	
	NSString * str = [[NSString alloc]autorelease];
	
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
	
	
	
	//for (int i=0;i<rowcount+1; i++) {
	for (int i=0;i<300; i++) {
		rowUsedList[i] = 0;
	}
	
	//str  = [NSString stringWithFormat:@"%s&page=%d",str,pages];
	
	//searchtext = str;
	str = theSearchBar.text;
	
    NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    str = [strData base64EncodedString];
	
	
	searchtext = [NSString stringWithFormat:@"%@&page=%d",str,pages];
	
	

	
	
	
	
	//base64str = [NSString base64StringWithHMACSHA1Digest:searchtext];
	
	[store getItem:searchtext :self.setbutton :self];
	//[store getItem:searchtext :self.setbutton :self];
	
	
	
	
}


- (IBAction) search_result :(NSMutableArray *)returnlistItems
{
	//NSLog(@"go%@",result);
	listItems = returnlistItems;
	
	//收keyboard
	[theSearchBar resignFirstResponder];
	
	rowcount = 0;
	if([listItems count]>0)
		rowcount = ([listItems count]-head_count) /rowfields;
	
	if(rowcount>0 && rowcount<1000){
		search_msg_store.text  = [NSString stringWithFormat:@"%d/%@",nowpages,[listItems objectAtIndex:0]];
	}else{
		search_msg_store.text  = @"";
	}
	
	//頁數
	[self set_search_bar:2];
	
	[tablemyview_store reloadData];
	if(rowcount>0 && rowcount<1000)
		[tablemyview_store scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
	
	[myAlert dismissWithClickedButtonIndex:0 animated:YES];
	
	
}





// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return rowcount;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return fields_height;
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *CellIdentifier = @"storeCell";
	CellIdentifier = [NSString stringWithFormat:@"%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil ||rowUsedList[indexPath.row]==0) {
		
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ]autorelease];
		
		//取消往右鍵
		//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		mytablecell* myview = [[mytablecell alloc]autorelease];
		[myview initWithFrame:CGRectMake(0, 0, 300, 60):listItems:indexPath.row:rowfields:head_count:fields_height];
		[cell.contentView addSubview:myview];
		
		
		//載入主圖
		if([listItems objectAtIndex:head_count + (indexPath.row*rowfields)]!=""){
			AsynchronousImageView* asyncImage = [[[AsynchronousImageView alloc]
												  initWithFrame:CGRectMake(0, 0, fields_height-5, fields_height-5)] autorelease];
			asyncImage.tag = head_count + (indexPath.row*rowfields);
			[asyncImage loadImageFromURLString:[listItems objectAtIndex:head_count + (indexPath.row*rowfields)]];
			[cell.contentView addSubview:asyncImage];
		}
		
		NSLog(@"row cell is %d!!  created!!",indexPath.row);
		
	}else{
		NSLog(@"row cell is %d!!  reused!!",indexPath.row);
	}
	rowUsedList[indexPath.row] = 1;
	return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[theSearchBar resignFirstResponder];
	view_yahoo_product *product = [[[view_yahoo_product alloc] initWithNibName:@"view_yahoo_product" bundle:nil ]autorelease];
	[product initWithFrame:[listItems objectAtIndex:head_count + (indexPath.row*rowfields+2)]];
	[self.navigationController pushViewController:product animated:YES];
	 
}


/*
 -(void)pressItem1:(UITabBarItem *) item1 
 {
 UIAlertView* alert =[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you really want to go back?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
 
 CGAffineTransform myTransForm = CGAffineTransformMakeTranslation((CGFloat)0.0, (CGFloat)90.0);
 [alert setTransform:myTransForm];
 [alert show];
 }*/

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
	//[self set_search_bar:1];
	
	
}



- (IBAction)switch_search_bar
{
	if(nowswitch==1)nowswitch = 2;
	else nowswitch = 1;
	
	[self set_search_bar:nowswitch];
	
}


- (void)set_search_bar :(int )btn
{
	self.navigationItem.rightBarButtonItem = nil;
	
	if (btn==1) {
		//self.navigationItem.rightBarButtonItem =BARBUTTON(@"設定", @selector(seacch_config:));
		
		UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
												initWithItems:
												[NSArray arrayWithObjects: @"功能設定",[UIImage imageNamed:@"down.png"], nil]];
		[segmentedControl addTarget:self action:@selector(segmentAction_set:) forControlEvents:UIControlEventValueChanged];
		segmentedControl.frame = CGRectMake(0, 0, 95, 40);
		segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
		segmentedControl.momentary = YES;
		UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
		[segmentedControl release];
		self.navigationItem.rightBarButtonItem = segmentBarItem;
		
		
		nowswitch = 1;
	}
	
	if (btn==2) {
		nowswitch = 2;
		UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
												initWithItems:
												[NSArray arrayWithObjects:@"上頁", @"下頁",[UIImage imageNamed:@"down.png"], nil]];
		[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
		segmentedControl.frame = CGRectMake(0, 0, 95, 40);
		segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
		segmentedControl.momentary = YES;
		UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
		[segmentedControl release];
		self.navigationItem.rightBarButtonItem = segmentBarItem;
		/*UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:
		 [NSArray arrayWithObjects:
		 [UIImage imageNamed:@"up.png"],
		 [UIImage imageNamed:@"down.png"],
		 nil]];*/
		
		
	}
	
}




- (IBAction)segmentAction_set:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	
	if(segmentedControl.selectedSegmentIndex == 0){
		[self seacch_config:nil];
	}
	if(segmentedControl.selectedSegmentIndex == 1){
		[self switch_search_bar];
	}
	
	
	
	
}






- (IBAction)segmentAction:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	NSLog(@"Segment clicked: %d", segmentedControl.selectedSegmentIndex);
	
	if(segmentedControl.selectedSegmentIndex == 1)nowpages++;
	if(segmentedControl.selectedSegmentIndex == 0) {
		if(nowpages>=2)nowpages--;
		else {
			return;
		}
	}
	
	if(segmentedControl.selectedSegmentIndex == 2)[self switch_search_bar];
	
	if(segmentedControl.selectedSegmentIndex != 2)[self SearchItems :nowpages];
}





- (void)seacch_config:(id)sender{
	[self.parentViewController presentModalViewController:self.setbutton animated:YES];
	
}







@end

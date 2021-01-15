//
//  hipriceAppDelegate.m
//  hiprice
//
//  Created by jianglichi on 2011/2/18.
//  Copyright 2011 myhome. All rights reserved.
//

#import "hipriceAppDelegate.h"
#import "hipriceViewController.h"
#import "AsynchronousImageView.h"

@implementation hipriceAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize theSearchBar;  
@synthesize yahoo;  
@synthesize store;  
@synthesize setbutton; 
@synthesize search_msg_yahoo;

@synthesize tablemyview_yahoo;  
@synthesize tablemyview_store;  
@synthesize tablemyview;  
//@synthesize store_view;  
@synthesize barcontroller;
@synthesize navigation1;
@synthesize Vyahoo;
@synthesize Vstore;

@synthesize navigationItem;

@synthesize listItems;
///搜尋筆數
NSInteger rowcount;
//重新搜尋
int rowUsedList[300];
int rowUsedList_pic[300];
UIButton *btn;
NSString *searchtext;

#pragma mark -
#pragma mark Application lifecycle





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
	
	// research ＝ 1;
	tablemyview = tablemyview_yahoo;
	
	rowcount = 0;
	yahoo = [[price_yahoo alloc]init];
	store = [[price_store alloc]init];
	self.search_msg_yahoo.text = @"";
	
	//listItems = [NSMutableArray arrayWithCapacity:300];
	//listItems = [[NSMutableArray alloc] initWithObjects:nil];
	
   // self.listItems = listItems;
    //[listItems release];
	
	
	
	//listItems = [[NSMutableArray alloc] initWithCapacity:0];
    //self.array = aarray;
    //[aarray release];
	
	
	//NSMutableArray *aarray = [[NSMutableArray alloc] initWithCapacity:0];
    //self.listItems = aarray;
    //[aarray release];
	
	//[self.window addSubview:store_view];
	//store_view.hidden = YES;
	//yahoo_btn.style = UIBarButtonItemStyleDone;
	//[view_product setFrame:CGRectMake(0,20,350,350)];
	
	//[store_view setFrame:CGRectMake(0,60,320,370)];
	
	//yahoo_view.frame = store_view.frame;
	
	
	//[self.window addSubview:barcontroller.view];
	//barcontroller
    //[self.window addSubview:viewController.view];
	
	//[self.window addSubview:store_view];
	//[self.window addSubview:yahoo_view];
	//[self.window addSubview:view_product];
	
	//store_view.hidden = YES;
  //  [self.window makeKeyAndVisible];
	
	
    [self.window addSubview:barcontroller.view];
    [self.window makeKeyAndVisible];
	
	/*
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Network Connection Error" 
						  message:@"You need to be connected to the internet to use this feature." 
						  delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
	[alert show];
	[alert release];
	*/
	
	/*
    UIBarButtonSystemItemDone,
	03
    UIBarButtonSystemItemCancel,
	04
    UIBarButtonSystemItemEdit, 
	05
    UIBarButtonSystemItemSave, 
	06
    UIBarButtonSystemItemAdd,
	07
    UIBarButtonSystemItemFlexibleSpace,
	08
    UIBarButtonSystemItemFixedSpace,
	09
    UIBarButtonSystemItemCompose,
	10
    UIBarButtonSystemItemReply,
	11
    UIBarButtonSystemItemAction,
	12
    UIBarButtonSystemItemOrganize,
	13
    UIBarButtonSystemItemBookmarks,
	14
    UIBarButtonSystemItemSearch,
	15
    UIBarButtonSystemItemRefresh,
	16
    UIBarButtonSystemItemStop,
	17
    UIBarButtonSystemItemCamera,
	18
    UIBarButtonSystemItemTrash,
	19
    UIBarButtonSystemItemPlay,
	20
    UIBarButtonSystemItemPause,
	21
    UIBarButtonSystemItemRewind,
	22
    UIBarButtonSystemItemFastForward,
	23
#if __IPHONE_3_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
	24
    UIBarButtonSystemItemUndo,
	25
    UIBarButtonSystemItemRedo,
	26
#endif
	27
#if __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
	28
    UIBarButtonSystemItemPageCurl,
	*/
	
	/*
	UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(fadeOut:)];
	self.navigationItem.rightBarButtonItem = addBarButtonItem;
	[addBarButtonItem release];
	*/
	
	//self.navigationItem.rightBarButtonItem =BARBUTTON(@"编辑", @selector(deleteContent:));
											   
	/*
	UIButton* modalViewButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[modalViewButton addTarget:self action:@selector(deleteContent:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:modalViewButton];
	self.navigationItem.rightBarButtonItem = modalBarButtonItem;
	[modalBarButtonItem release];
	*/
    return YES;
}



-(void)deleteContent:(id)sender

{
	
    if (self.setbutton == nil)
       // self.setbutton = [[[set_button alloc] initWithNibName:
		//							   NSStringFromClass([set_button class]) bundle:nil] autorelease];
	
	
	//self.setbutton = [[[set_button alloc] initWithNibName:
	//				   NSStringFromClass([set_button class]) bundle:nil] autorelease];
	
	
	self.setbutton = [[[set_button alloc] initWithNibName:
					   @"set_button" bundle:[NSBundle mainBundle]] autorelease];

	//[self.navigationController presentModalViewController:self.setbutton animated:YES];

	
	//[self.navigation1 presentModalViewController:self.setbutton animated:YES];
	//[self.navigation1.navigationController presentModalViewController:self.setbutton animated:YES];
	
	//[self.navigation1.navigationController presentModalViewController:nil animated:YES];
    //[self.window addSubview:self.setbutton.view];
	[self.Vyahoo.navigationController presentModalViewController:self.setbutton animated:YES];
	
	//self.setbutton;
	/*
    if (self.myModalViewController == nil)
        self.myModalViewController = [[[ModalViewController alloc] initWithNibName:
									   NSStringFromClass([ModalViewController class]) bundle:nil] autorelease];
	[self.navigationController presentModalViewController:self.myModalViewController animated:YES];
	*/
}




- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}




// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return rowcount;
	return 1+arc4random() % 3;
	return 10;
    //return 0;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80;
	
	
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *CellIdentifier = @"Cell----------------------------------------------------------------------------";
	
	CellIdentifier = [NSString stringWithFormat:@"%d",indexPath.row];
	
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	
	if (cell == nil ||rowUsedList[indexPath.row]==0) {
	//if (cell == nil) {
		
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ]autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		mytablecell* myview = [[mytablecell alloc]autorelease];
		[myview initWithFrame:CGRectMake(0, 0, 300, 60):self.listItems:indexPath.row];
		[cell.contentView addSubview:myview];
		//[NSThread detachNewThreadSelector:@selector(updateImageForCellAtIndexPath:) toTarget:self withObject:indexPath]; 	
		
		//載入主圖
		AsynchronousImageView* asyncImage = [[[AsynchronousImageView alloc]
											  initWithFrame:CGRectMake(0, 0, 75, 75)] autorelease];
		asyncImage.tag = indexPath.row;
		[asyncImage loadImageFromURLString:[listItems objectAtIndex:indexPath.row*3]];
		[cell.contentView addSubview:asyncImage];
		
		
		
		rowUsedList_pic[indexPath.row] = 1;
		
		NSLog(@"row cell is %d!!  created!!",indexPath.row);

	}else{
		
		//[cell.contentView viewWithTag:indexPath.row];
		
		
		NSLog(@"row cell is %d!!  reused!!",indexPath.row);
	}
	
	rowUsedList[indexPath.row] = 1;


	return cell;
	 
	/*
	
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	
	//memory note
   // if (cell == nil ||rowUsedList[indexPath.row]==0) {
	if (cell == nil) {
		
		
		if(cell != nil && 1){
			[cell release];
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		}
        
		//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
		
		//CGRect Label2Frame = CGRectMake(0, 0, 300, 60);
		mytablecell* myview = [mytablecell alloc];
		[myview initWithFrame:CGRectMake(0, 0, 300, 60):listItems:indexPath.row];
		[cell.contentView addSubview:myview];
		[myview release];
		
		
		//hidden click button
		//UIButton *btn = [UIButton buttonWithType:UIControlStateNormal];
		btn = [UIButton buttonWithType:UIControlStateNormal];
		
		btn.frame = CGRectMake(0, 0, 50, 40);
		//[btn setTitle:@"aawwwwwwaa" forState:UIControlStateNormal];
		[btn setTitle:@"" forState:UIControlStateNormal];
		[btn addTarget:self action:@selector(btntest) forControlEvents:UIControlEventTouchUpInside];
		//[cell addSubview:btn];
		//hidden click button
    }else{
		NSLog(@"cell reused!! ");
	}
	
	rowUsedList[indexPath.row] = 1;
	
	return cell;*/
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//self.selectedDrug = [self.drugs objectAtIndex:indexPath.row];
	NSLog(@"selected id=%d",indexPath.row);
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {  
	//[listItems setArray:nil];
	for (int i=0;i<rowcount+1; i++) {
		rowUsedList[i] = 0;
		rowUsedList_pic[i] = 0;
	}
	
	searchtext = [NSString stringWithFormat:@"%s",searchBar.text];
	
	if(tablemyview==tablemyview_yahoo){
		
		listItems = [yahoo getItem:searchBar.text];
	}else {
		listItems = [store getItem:searchBar.text];
	}
	
	
	
	//收keyboard
	[theSearchBar resignFirstResponder];
	rowcount = [listItems count] /3;
	
	if(rowcount>0){
		
		[tablemyview reloadData];
		[tablemyview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
	}
	
}  


- (IBAction)goyahoo{
	
	tablemyview = tablemyview_yahoo;
	store_view.hidden = true;
	yahoo_view.hidden = false;
	store_btn.style = UIBarButtonItemStyleBordered;
	yahoo_btn.style = UIBarButtonItemStyleDone;
	
}

- (IBAction)gostore{
	tablemyview = tablemyview_store;
	store_view.hidden = false;
	yahoo_view.hidden = true;
	store_btn.style = UIBarButtonItemStyleDone;
	yahoo_btn.style = UIBarButtonItemStyleBordered;
}




- (IBAction) btntest{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOur hello" message:@"Your hello"
												   delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];
	[alert release];
	
}




- (void)backAction:(id)sender
{
	UIAlertView* alert =[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you really want to go back?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
	
	CGAffineTransform myTransForm = CGAffineTransformMakeTranslation((CGFloat)0.0, (CGFloat)90.0);
	[alert setTransform:myTransForm];
	[alert show];
}



- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	UIAlertView* alert =[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you really want to go back?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
	
	CGAffineTransform myTransForm = CGAffineTransformMakeTranslation((CGFloat)0.0, (CGFloat)90.0);
	[alert setTransform:myTransForm];
	[alert show];
	
}




- (void)dealloc {
	
    [[NSNotificationCenter defaultCenter]removeObserver:self];
	[yahoo release];
    [viewController release];
    [window release];
    [super dealloc];
}






@end

//
//  view_store.h
//  hiprice
//
//  Created by jianglichi on 2011/4/13.
//  Copyright 2011 myhome. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "Curl.h"
#import "price_store.h"
#import "mytablecell.h"
#import "AsynchronousImageView.h"
#import "view_yahoo_product.h"
#import "NSData+Base64.h"


@interface view_store : UIViewController <UITabBarControllerDelegate,UIApplicationDelegate
			,UITableViewDelegate,UISearchBarDelegate,UITableViewDataSource>{
	
	IBOutlet UITableView *tablemyview_store;
	IBOutlet UINavigationController *navtroller;
	IBOutlet UINavigationBar *navtrollerbar;
	UISearchBar *theSearchBar;
	IBOutlet UILabel *search_msg_store;
	IBOutlet UITabBarItem* tabbaritem;
	IBOutlet UITabBarController* tabbarctrl;
	set_button* setbutton;
	IBOutlet view_store* Vstore;
	UIAlertView *myAlert; 
	NSMutableArray *listItems;

}

@property (nonatomic, retain) IBOutlet UISearchBar *theSearchBar;
@property (nonatomic, retain) IBOutlet price_store *store;  
@property (nonatomic, retain) IBOutlet UITableView *tablemyview_store;  
@property (nonatomic, retain) IBOutlet UITabBarItem* tabbaritem;
@property (nonatomic, retain) IBOutlet UITabBarController* tabbarctrl;
@property (nonatomic, retain) IBOutlet set_button* setbutton;
@property (nonatomic, retain) IBOutlet view_store* Vstore;
@property ( retain) IBOutlet NSMutableArray *listItems;;

/*
- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active;  
- (IBAction) search_result :(NSMutableArray *)listItems;
- (void)set_search_bar:(int )btn;
- (IBAction)switch_search_bar;


- (void)SearchItems :(NSInteger *)pages;
- (void)seacch_config:(id)sender;
- (IBAction)segmentAction:(id)sender;
- (IBAction)segmentAction_set:(id)sender;
*/

@end

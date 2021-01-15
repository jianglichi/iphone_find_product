//
//  view_yahoo.h
//  hiprice
//
//  Created by jianglichi on 2011/4/13.
//  Copyright 2011 myhome. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "Curl.h"
#import "price_yahoo.h"
#import "mytablecell.h"
#import "AsynchronousImageView.h"
#import "view_yahoo_product.h"
#import "Constant.h"
#import "set_button.h"




@interface view_yahoo : UIViewController <UITabBarControllerDelegate,UIApplicationDelegate,
UITableViewDelegate,UISearchBarDelegate,UITableViewDataSource,
UITabBarControllerDelegate,UITabBarDelegate>{
								
							
							
//@interface view_yahoo : UIViewController <UITabBarControllerDelegate,UIApplicationDelegate,UITableViewDelegate,UISearchBarDelegate,UITableViewDataSource>{
	
	IBOutlet UITableView *tablemyview_yahoo;
	IBOutlet UINavigationController *navtroller;
	IBOutlet UINavigationBar *navtrollerbar;
	UISearchBar *theSearchBar;
	IBOutlet UILabel *search_msg_yahoo;
	IBOutlet UITabBarItem* tabbaritem;
	IBOutlet UITabBarController* tabbarctrl;
	set_button* setbutton;
	IBOutlet view_yahoo* Vyahoo;
	UIAlertView *myAlert; 

}

@property (nonatomic, retain) IBOutlet UISearchBar *theSearchBar;
@property (nonatomic, retain) IBOutlet price_yahoo *yahoo;  
@property (nonatomic, retain) IBOutlet UITableView *tablemyview_yahoo;  
@property (nonatomic, retain) IBOutlet UITabBarItem* tabbaritem;
@property (nonatomic, retain) IBOutlet UITabBarController* tabbarctrl;
@property (nonatomic, retain) IBOutlet set_button* setbutton;
@property (nonatomic, retain) IBOutlet view_yahoo* Vyahoo;
@property ( retain) IBOutlet NSMutableArray *listItems;;


- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active;  
- (IBAction) search_result :(NSMutableArray *)listItems;
- (void)set_search_bar:(int )btn;
- (IBAction)switch_search_bar;


- (void)SearchItems :(NSInteger *)pages;
- (void)seacch_config:(id)sender;
- (IBAction)segmentAction:(id)sender;
- (IBAction)segmentAction_set:(id)sender;


@end

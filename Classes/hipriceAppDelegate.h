//
//  hipriceAppDelegate.h
//  hiprice
//
//  Created by jianglichi on 2011/2/18.
//  Copyright 2011 myhome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Curl.h"
#import "price_yahoo.h"
#import "price_store.h"

#import "mytablecell.h"
#import "set_button.h"

#import "view_yahoo.h"
#import "view_store.h"



@class hipriceViewController;

@interface hipriceAppDelegate : NSObject <UIApplicationDelegate,UITableViewDelegate,
								UISearchBarDelegate,UITableViewDataSource,
								UITabBarControllerDelegate,UITabBarDelegate> {
    UIWindow *window;
    hipriceViewController *viewController;
	IBOutlet UITabBarController *barcontroller;
	
   // IBOutlet  UISearchBar *theSearchBar;
	price_yahoo *yahoo;
	price_store *store;
	IBOutlet UITableView *tablemyview_yahoo;
	IBOutlet UITableView *tablemyview_store;
	NSMutableArray *listItems;
	IBOutlet UIView *store_view;
	IBOutlet UIView *yahoo_view;
	IBOutlet UIView *view_product;
	IBOutlet UIBarButtonItem *yahoo_btn,*store_btn;
	
	IBOutlet UINavigationController *navtroller;
	IBOutlet UISearchBar *theSearchBar;
	IBOutlet UINavigationItem* navigationItem;
	set_button* setbutton;
	IBOutlet UINavigationController* navigation1;
	IBOutlet UINavigationController* navigation2;
	IBOutlet view_yahoo* Vyahoo;
	IBOutlet view_store* Vstore;
	IBOutlet UILabel *search_msg_yahoo;
    IBOutlet UILabel *search_msg_store;
									
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet hipriceViewController *viewController;
@property (nonatomic, retain) IBOutlet UITabBarController *barcontroller;
@property (nonatomic, retain) IBOutlet UINavigationController *navtroller;
@property (nonatomic, retain) IBOutlet UINavigationItem* navigationItem;
@property (nonatomic, retain) IBOutlet set_button* setbutton;
@property (nonatomic, retain) IBOutlet UINavigationController* navigation1;
@property (nonatomic, retain) IBOutlet UINavigationController* navigation2;
@property (nonatomic, retain) IBOutlet view_yahoo* Vyahoo;
@property (nonatomic, retain) IBOutlet view_store* Vstore;
@property (nonatomic, retain) IBOutlet UILabel *search_msg_yahoo;
@property (nonatomic, retain) IBOutlet UILabel *search_msg_store;


@property (nonatomic, retain) IBOutlet UISearchBar *theSearchBar;  
@property (nonatomic, retain) IBOutlet price_yahoo *yahoo;  
@property (nonatomic, retain) IBOutlet price_store *store;  

@property (nonatomic, retain) IBOutlet UITableView *tablemyview_yahoo;  
@property (nonatomic, retain) IBOutlet UITableView *tablemyview_store;  
@property (nonatomic, retain) IBOutlet UITableView *tablemyview;  



@property (nonatomic, retain) IBOutlet NSMutableArray *listItems;  
//@property (nonatomic, retain) IBOutlet UIView *store_view;  


- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active;  
- (IBAction) goyahoo;  
- (IBAction) gostore;  


-(UIImage *)getImageForCellAtIndexPath:(NSIndexPath *)indexPath;
- (IBAction) btntest;


-(void)deleteContent:(id)sender;

@end


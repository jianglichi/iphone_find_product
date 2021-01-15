//
//  set_button.h
//  hiprice
//
//  Created by jianglichi on 2011/5/13.
//  Copyright 2011 myhome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface set_button : UIViewController <UITextFieldDelegate>{
	IBOutlet UISwitch *item_get_type1,*item_get_type2,*item_get_type3,*item_get_type4,*item_get_type5;
	IBOutlet UITextField *price_start,*price_end;
	IBOutlet UISegmentedControl*  sort_type;

}

@property (nonatomic, retain) IBOutlet UISwitch *item_get_type1,*item_get_type2,*item_get_type3,*item_get_type4,*item_get_type5;
@property (nonatomic, retain) IBOutlet UITextField *price_start,*price_end;
@property (nonatomic, retain) IBOutlet UISegmentedControl*  sort_type;



- (IBAction)dismissAction:(id)sender;


@end

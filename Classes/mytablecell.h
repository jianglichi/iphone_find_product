//
//  testview.h
//  test5
//
//  Created by jianglichi on 2011/2/11.
//  Copyright 2011 myhome. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface mytablecell : UIView {
	IBOutlet UIView* thisview;
	IBOutlet UILabel* label1;
	
}

@property ( retain) IBOutlet UILabel *label1;
@property NSInteger *startRow;
@property NSInteger *endRow;


- (IBAction) btntest:(id) sender;

- (id)initWithFrame:(CGRect)frame :(NSMutableArray *) listItems :(NSInteger)nowRow :(int)rowcount :(int)head_count :(int)fields_height ;


@end

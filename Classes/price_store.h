//
//  price_store.h
//  hiprice
//
//  Created by jianglichi on 2011/2/21.
//  Copyright 2011 myhome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Curl.h"
#import "RegexKitLite.h"
#import <Foundation/NSString.h>
#import <Foundation/NSObject.h>
#import "set_button.h"




@interface price_store : NSObject {
	Curl* myurl;
	NSMutableArray *returnItems;
    NSMutableData *httpresult;
}

@property (retain) Curl* myurl ;
@property (nonatomic, retain) IBOutlet NSMutableArray *returnItems;  


- (NSString *)flattenHtml: (NSString *) html ;
-(NSMutableArray*)getItem:(NSString *  )text :(set_button *)btn;


-(id)init;



@end

//
//  Curl.h
//  myproject
//
//  Created by jianglichi on 2010/7/22.
//  Copyright 2010 myhome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Curl.h"



@interface Curl : NSObject {
	NSString* reponseText;
	NSMutableData* receiveData;
}

@property (retain) NSString* reponseText;
@property (retain) NSMutableData* receiveData;

-(NSString*)getUrl:(NSString *  )text :(bool*)rsync :(bool *)asccode :(id *)obj;



@end


//
//  Curl.m
//  myproject
//
//  Created by jianglichi on 2010/7/22.
//  Copyright 2010 myhome. All rights reserved.
//

#import "Curl.h"


@implementation Curl

@synthesize reponseText;
@synthesize receiveData;

NSURL* url;
NSURLRequest* request;
NSData* urldata;
NSURLResponse* response;
NSError* error;


//support ssl??
-(NSString*)getUrl:(NSString *  )text :(bool*)rsync :(bool *)asccode :(id *)obj
{
	
	url = [NSURL URLWithString:text];
	request = [NSURLRequest requestWithURL:url];
	
	//data rsync
	if (rsync){
		urldata = [NSURLConnection sendSynchronousRequest:request 
										returningResponse:&response error:&error];
		if(asccode){
			//return [[[NSString alloc] initWithData:urldata encoding:NSASCIIStringEncoding]autorelease];
			CFStringRef* big5Str = [CFStringCreateWithBytes(NULL, 
														  [urldata bytes], 
														  [urldata length], 
														  kCFStringEncodingBig5_HKSCS_1999, 
														  false)autorelease];
			NSString *big5NSString = (NSString *)big5Str; 
			
			return [[[NSString alloc] initWithData:[big5NSString dataUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF8StringEncoding]autorelease];
		}
		return [[[NSString alloc] initWithData:urldata encoding:NSUTF8StringEncoding]autorelease];
		//unrsync
	}else{
		
		NSURLConnection* connection = [[NSURLConnection alloc]initWithRequest:request delegate:obj];
		if (connection){
			receiveData = [[NSMutableData data]retain]; 
		}
		return @"";
		
	}
	
	
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	
	[receiveData appendData:data];
	
}


-(void)connection:(NSURLConnection *)connection didReceiveReponse:(NSURLResponse*)reponse{
	
	  
	NSLog(@"finish");
	
	
}




@end

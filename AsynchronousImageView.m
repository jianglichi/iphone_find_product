//
//  AsynchronousImageView.m
//  hiprice
//
//  Created by jianglichi on 2011/3/1.
//  Copyright 2011 myhome. All rights reserved.
//

#import "AsynchronousImageView.h"


@implementation AsynchronousImageView





- (void)loadImageFromURLString:(NSString *)theUrlString
{
	[self.image release], self.image = nil;
	request = [NSURLRequest requestWithURL:[NSURL URLWithString:theUrlString] 
											 cachePolicy:NSURLRequestReturnCacheDataElseLoad 
										 timeoutInterval:30.0];
	
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)theConnection 
	didReceiveData:(NSData *)incrementalData 
{
    if (data == nil)
        data = [[NSMutableData alloc] initWithCapacity:2048];
	
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection 
{
    self.image = [UIImage imageWithData:data];
    [data release], data = nil;
	[connection release], connection = nil;
}

- (void)dealloc {
    //[connection cancel];
    //[connection release];
	//[request release];
    [super dealloc];
}


@end

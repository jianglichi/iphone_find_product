//
//  AsynchronousImageView.h
//  hiprice
//
//  Created by jianglichi on 2011/3/1.
//  Copyright 2011 myhome. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol IconDownloaderDelegate;


@interface AsynchronousImageView : UIImageView 
{
    NSURLConnection *connection;
    NSMutableData *data;
	NSURLRequest *request;
}

@property (nonatomic, assign) id <IconDownloaderDelegate> delegate;



- (void)loadImageFromURLString:(NSString *)theUrlString;
@end






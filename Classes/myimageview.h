//
//  myimage.h
//  test5
//
//  Created by jianglichi on 2011/2/14.
//  Copyright 2011 myhome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface myimageview : UIImageView {

	//UIImageView *myview;
	
}


//@property (retain) UIImageView *myview;

- (void)loadByUrl:(NSString *)url ;
- (void)initWithFrame:(CGRect)frame;

@end

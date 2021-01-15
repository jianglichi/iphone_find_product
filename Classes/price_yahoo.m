//
//  price_yahoo.m
//  hiprice
//
//  Created by jianglichi on 2011/2/21.
//  Copyright 2011 myhome. All rights reserved.
//

#import "price_yahoo.h"


@implementation price_yahoo
@synthesize myurl;  

@synthesize returnItems;

NSString *myStr,*myStr1,*myStr2;
NSArray *listItems,*listItems1,*listItems2;
NSString* result;
id* func;
//NSMutableArray *returnItems ;
NSMutableData* receiveData;

//-(NSMutableArray*)getItem:(NSString *  )text{
-(NSMutableArray*)getItem:(NSString *  )text :(set_button *)btn :(id *)obj{

	func = obj;
	//result = @"";
	result = nil;
	
	[self.returnItems setArray:nil];
		
	myStr = @"http://search.buy.yahoo.com.tw/search.php?hpp=gdsearch&kw=";
	myStr = [myStr stringByAppendingString:text];
	myStr = [myStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	
	
	
	//myStr = [myStr stringByAppendingString:text];
	//stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding
	myStr = [myStr stringByAppendingString:@"&catsel=&btn_srch=&z=0&subno=0&from="];
	
	
	//limit price
	//NSLog(@"price_start = %d",btn.price_start.text.length);
	//NSLog(@"price_end=%d",[[btn.price_end text]length]);
	//NSLog(@"price_end=%@",[btn.price_end text]);
	
	myStr2 = @"&refine=";
	if (btn.item_get_type1.on == YES) {
		myStr2 = [myStr2 stringByAppendingString:@"ship_home"];
	}
	if (btn.item_get_type2.on == YES) {
		myStr2 = [myStr2 stringByAppendingString:@"ship_fast"];
	}
	if (btn.item_get_type3.on == YES) {
		myStr2 = [myStr2 stringByAppendingString:@"ship_dvs"];
	}
	if (btn.item_get_type4.on == YES) {
		myStr2 = [myStr2 stringByAppendingString:@"promo_gather"];
	}
	if (btn.item_get_type5.on == YES) {
		myStr2 = [myStr2 stringByAppendingString:@"promo_auction"];
	}
	myStr = [myStr stringByAppendingString:myStr2];
	
	//limit price
	if(btn.price_start != nil && btn.price_end != nil){
		myStr = [myStr stringByAppendingString:@"&limit_price1="];
		myStr = [myStr stringByAppendingString:btn.price_start.text];
		myStr = [myStr stringByAppendingString:@"&limit_price2="];
		myStr = [myStr stringByAppendingString:btn.price_end.text];
	}
	//sort
	
	myStr = [myStr stringByAppendingString:@"&sort1="];
	if(btn.sort_type.selectedSegmentIndex==0){
		myStr = [myStr stringByAppendingString:@"precise"];
	}
	if(btn.sort_type.selectedSegmentIndex==1){
		myStr = [myStr stringByAppendingString:@"+price"];
	}
	if(btn.sort_type.selectedSegmentIndex==2){
		myStr = [myStr stringByAppendingString:@"-price"];
	}
	if(btn.sort_type.selectedSegmentIndex==3){
		myStr = [myStr stringByAppendingString:@"hot"];
	}
	if(btn.sort_type.selectedSegmentIndex==4){
		myStr = [myStr stringByAppendingString:@"-pubdate"];
	}
	
	result = [self.myurl getUrl:myStr : false :true :self];
	

	
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (httpresult == nil)
        httpresult = [[NSMutableData alloc] initWithCapacity:2048];
	[httpresult appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	
	result = [[[NSString alloc] initWithData:httpresult encoding:NSUTF8StringEncoding]autorelease];
	listItems = [result arrayOfCaptureComponentsMatchedByRegex:@"(?s:<li class=\"cfx\".*?li>)"];
	//標頭檔 5
	//pages頁數 
	listItems2 = [result arrayOfCaptureComponentsMatchedByRegex:@"(?s:<span class='tct'>(.*?)</span>)"];
	
	if([listItems2 count]>0  )[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
	else {
		httpresult = nil;
		[func search_result :nil];
		return;
	}
	
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	
	//回傳數必須與rowfields相同
	
	for( listItems1 in listItems ) {
		
		//0 get picture url
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:http://rp1.monday(.*?).jpg)"];
		//yahoo 有時會有破圖
		if([listItems2 count]>0  ){
			[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :0]];
		}else{
			[self.returnItems addObject: @""];
		}
		
		
		//1 get product name
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:<h3><a href=\"(.*?)\" class='name'>(.*?)</a></h3>)"];
		[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :2]];
		
		//2 get product url
		[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
		
		
		//3 get product price
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:<em>(.*?)</em>)"];
		[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
		
		//4 get @ desc
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:class='desc'>(.*?)<br>)"];
		if([listItems2 count]>0  ){
			[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
		}else {
			[self.returnItems addObject: @""];
		}
		
		//5 get @
		[self.returnItems addObject: @""];
		
		
	}
	
	httpresult = nil;
	[func search_result :returnItems];
	
	
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	[func search_result :returnItems];
}




-(id)init{

	self.returnItems = [NSMutableArray arrayWithCapacity:300];
	self.returnItems = [[NSMutableArray alloc] initWithObjects:nil];
	listItems = [NSArray alloc];
	listItems1 = [NSArray alloc];
	listItems2 = [NSArray alloc];

	result = [NSString alloc];
	myStr = [[NSString alloc] init];
	myStr1 = [[NSString alloc]init];
	self = [super init];
	self.myurl = [[Curl alloc]init];
	
	return self;
}



- (void)dealloc {
	[[NSNotificationCenter defaultCenter]removeObserver:self];
	[returnItems release];
	[listItems release];
	[listItems1 release];
	[listItems2 release];
	[result release];
	[myStr release];
	[myStr1 release];
	[myStr2 release];
	[self.myurl release];
    [super dealloc];
	
}



@end

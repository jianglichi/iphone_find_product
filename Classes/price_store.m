//
//  price_store.m
//  hiprice
//
//  Created by jianglichi on 2011/2/21.
//  Copyright 2011 myhome. All rights reserved.
//

#import "price_store.h"


@implementation price_store
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
	
	myStr = @"http://store.pchome.com.tw/adm/psearch.htm?store_k_word=";
	myStr = [myStr stringByAppendingString:text];
	myStr = [myStr stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	
	
	myStr = [myStr stringByAppendingString:@"&slt_k_option=1"];
	
	//limit price
	//if(btn.price_start != nil){
	//	myStr = [myStr stringByAppendingString:@"&limit_price1="];
	//	myStr = [myStr stringByAppendingString:btn.price_start.text];
	//	myStr = [myStr stringByAppendingString:@"&limit_price2="];
	//	myStr = [myStr stringByAppendingString:btn.price_end.text];
	//}
	
	result = [self.myurl getUrl:myStr : false :true :self];
	
	
	
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (httpresult == nil)
        httpresult = [[NSMutableData alloc] initWithCapacity:2048];
	[httpresult appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	
	
	CFStringRef big5Str = CFStringCreateWithBytes(NULL, 
												  [httpresult bytes], 
												  [httpresult length], 
												  kCFStringEncodingBig5_HKSCS_1999, 
												  false);
	NSString *big5NSString = (NSString *)big5Str; 
	result = [[[NSString alloc] initWithData:[big5NSString dataUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF8StringEncoding]autorelease];
	//result = [[[NSString alloc] initWithData:httpresult encoding:NSUTF8StringEncoding]autorelease];
	
	listItems = [result arrayOfCaptureComponentsMatchedByRegex:@"(?s:<td valign=\"top\" width=\"20%\">.*?td>)"];
	
	
	//標頭檔 5
	//pages頁數 
	listItems2 = [result arrayOfCaptureComponentsMatchedByRegex:@"(?s:get_page_bar\((.*?),(.*?),(.*?)'pql_search'\))"];
	
	NSLog(@"%@",listItems2);
	
	
	if([listItems2 count]>0  )[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :3]];
	else {
		httpresult = nil;
		[func search_result :nil];
		return;
	}
	NSLog(@"%@",returnItems);
	
	
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	[self.returnItems addObject: @""];
	
	//回傳數必須與rowfields相同
	
	for( listItems1 in listItems ) {
		
		//0 get picture url
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:<img src=\"(.*?)\".*?height=\"120\">)"];
		//yahoo 有時會有破圖
		if([listItems2 count]>0  ){
			[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
		}else{
			[self.returnItems addObject: @""];
		}
		
		
		//1 get product name
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:<a href=\"(.*?htm)\">(.*?)</a>)"];
		//移除html tag
		myStr1 = [@"" stringByAppendingString: [[listItems2 objectAtIndex:1] objectAtIndex :2]];
		myStr1 = [self flattenHtml:myStr1];
		[self.returnItems addObject: myStr1];
		
		
		//2 get product url
		[self.returnItems addObject: [[listItems2 objectAtIndex:1] objectAtIndex :1]];
		
		
		//3 get product price
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:<span>(.*?)</span>)"];
		[self.returnItems addObject: [[listItems2 objectAtIndex:0] objectAtIndex :1]];
		
		//4 get @ desc
		myStr1 = @"";
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:bn_bon.gif)"];
		if([listItems2 count]>0  )myStr1 = [@"" stringByAppendingString: @"[享紅利]"];
		
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:icon_calendr01_04.gif)"];
		if([listItems2 count]>0  )myStr1 = [myStr1 stringByAppendingString: @"[今日可出貨] "];
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:bn_bonstore.gif)"];
		if([listItems2 count]>0  )myStr1 = [myStr1 stringByAppendingString: @"[現金積點特約店] "];
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:rp_02.gif)"];
		if([listItems2 count]>0  )myStr1 = [myStr1 stringByAppendingString: @"[現金積點優惠] "];
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:bn_cvs.gif)"];
		if([listItems2 count]>0  )myStr1 = [myStr1 stringByAppendingString: @"[超商取貨] "];
		listItems2 = [[listItems1 objectAtIndex:0] arrayOfCaptureComponentsMatchedByRegex:@"(?s:bn_oneday.gif)"];
		if([listItems2 count]>0  )myStr1 = [myStr1 stringByAppendingString: @"[隔日配] "];
		[self.returnItems addObject: myStr1];
		
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


- (NSString *)flattenHtml: (NSString *) html {
	NSScanner *theScanner;
	NSString *text = nil;
	theScanner = [NSScanner scannerWithString: html];
	while ([theScanner isAtEnd] == NO) {
		[theScanner scanUpToString: @"<" intoString: NULL];
		[theScanner scanUpToString: @">" intoString: &text];
		html = [html stringByReplacingOccurrencesOfString:
				[ NSString stringWithFormat:@"%@>", text] withString:@""]; 
	}
	
	return html;
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

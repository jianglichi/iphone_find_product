#import <Foundation/NSString.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (NSStringAdditions)

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;
- (NSString *) base64StringWithHMACSHA1Digest:(NSString *)secretKey;

@end

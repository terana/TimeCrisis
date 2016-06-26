//
// Created by Anastasia on 6/26/16.
//

#import "NSDate+TCDateString.h"

@implementation NSDate (TCDateString)
+ (NSDate *) dateFromString:(NSString *)str
{
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = @"dd.MM.yy";
	return [dateFormatter dateFromString:str];
}

- (NSString *) stringFromDate;
{
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = @"dd.MM.yy";
	return [dateFormatter stringFromDate:self];
}
@end
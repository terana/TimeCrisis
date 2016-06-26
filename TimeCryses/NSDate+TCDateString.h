//
// Created by Anastasia on 6/26/16.
//

#import <Foundation/Foundation.h>

@interface NSDate (TCDateString)
+ (NSDate *) dateFromString:(NSString *)str;
- (NSString *) stringFromDate;
@end
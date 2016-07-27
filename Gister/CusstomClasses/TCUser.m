//
// Created by Anastasia on 6/26/16.
//

#import "TCUser.h"
#import "NSDate+TCDateString.h"

@implementation TCUser
{
}
+ (instancetype) unmap:(NSDictionary *)dictionary
{
	TCUser *user = [self new];
	user.avatarURL        = dictionary[@"avatar_url"];
	user.login            = dictionary[@"login"];
	user.registrationDate = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
	return user;
}
@end
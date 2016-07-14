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
	user.avatar_url = dictionary[@"avatar_url"];
	user.login = dictionary[@"login"];
	user.followersURL = [NSURL URLWithString:dictionary[@"followers_url"]];
	user.followingsURL = [NSURL URLWithString:dictionary[@"following_url"]];
	user.gitURL = [NSURL URLWithString:dictionary[@"url"]];
	user.gistsURL = [NSURL URLWithString:dictionary[@"gists_url"]];
	user.registrationDate = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
	return user;
}
@end
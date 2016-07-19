//
// Created by Anastasia on 6/26/16.
//

#import "TCUser.h"
#import "NSDate+TCDateString.h"
#import "TCImageView.h"

@implementation TCUser
{
}
+ (instancetype) unmap:(NSDictionary *)dictionary
{
	TCUser *user = [self new];
	user.avatarURL = dictionary[@"avatar_url"];
	user.login = dictionary[@"login"];
	user.followersURL = dictionary[@"following_url"];
	user.gitURL = dictionary[@"url"];
	user.gistsURL = dictionary[@"gists_url"];
	user.registrationDate = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
 	return user;
}
@end
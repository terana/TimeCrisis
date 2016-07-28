//
// Created by Anastasia on 6/26/16.
//

#import "TCUser.h"
#import "NSDate+TCDateString.h"

@implementation TCUser

+ (instancetype) unmap:(NSDictionary *)dictionary
{
	TCUser *user = [self new];
	user.avatarURL        = dictionary[@"avatar_url"];
	user.login            = dictionary[@"login"];
	user.name           = dictionary[@"name"];
	user.registrationDate = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
	user.company = dictionary[@"company"];
	user.followers = dictionary[@"followers"];
	user.following = dictionary[@"following"];
	user.publicGists = dictionary[@"public_gists"];
	user.privateGists = dictionary[@"private_gists"];
	return user;
}
@end
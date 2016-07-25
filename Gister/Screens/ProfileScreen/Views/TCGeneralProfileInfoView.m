//
// Created by Anastasia on 7/12/16.
//

#import "TCGeneralProfileInfoView.h"
#import "TCUser.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"

@implementation TCGeneralProfileInfoView
{
	TCImageView *_avatar;
	UILabel     *_login;
	UILabel     *_joinedOn;
	UILabel     *_numberOfGists;
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused TCImageView *avatar = _avatar = [TCImageView tc_with:^(TCImageView *o) {
			[self addSubview:o];
			o.keepTopInset.equal    = 0;
			o.keepBottomInset.equal = 0;
			o.keepLeftInset.equal   = 0;
		}];

		__unused UILabel *login = _login = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepTopInset.equal             = 5;
			o.keepLeftOffsetTo(avatar).equal = 10;
			o.keepLeftInset.equal            = KeepFitting(110);
			o.keepRightInset.min             = 0;
		}];

		__unused UILabel *joinedOn = _joinedOn = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepTopOffsetTo(login).equal   = 5;
			o.keepLeftOffsetTo(avatar).equal = 10;
			o.keepRightInset.min             = 0;
		}];
	}

	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	_avatar.imageURL    = user.avatarURL;
	_login.text         = user.login;
	_joinedOn.text      = [NSString stringWithFormat:@"Joined on %@", [_user.registrationDate stringFromDate]];
	_numberOfGists.text = [NSString stringWithFormat:@"%d gists", user.gists.count];
	[self reloadInputViews];
}
@end
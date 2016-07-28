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
	UILabel     *_name;
	UILabel     *_company;
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused TCImageView *avatar = _avatar = [TCImageView tc_with:^(TCImageView *o) {
			[self addSubview:o];
			o.keepTopMarginInset.equal    = 0;
			o.keepBottomMarginInset.equal = 0;
			o.keepLeftMarginInset.equal   = 0;
		}];

		__unused UIView *viewWithLabels = [UIView tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepTopMarginInset.equal              = 0;
			o.keepBottomMarginInset.equal           = 0;
			o.keepRightMarginInset.equal            = 0;
			o.keepLeftOffsetTo(_avatar).equal = 10;
			o.keepLeftMarginInset.equal             = KeepFitting(110);

			__unused UILabel *login = _login = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopInset.equal  = 0;
				oo.keepLeftInset.equal = 0;
				oo.keepRightInset.min  = 0;
			}];

			__unused UILabel *name = _name = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_login).equal = 0;
				oo.keepLeftInset.equal           = 0;
				oo.keepRightInset.min            = 0;
			}];

			__unused UILabel *company  = _company  = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_name).equal = 0;
				oo.keepLeftInset.equal          = 0;
				oo.keepRightInset.min           = 0;
			}];
			__unused UILabel *joinedOn = _joinedOn = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_company).equal = 0;
				oo.keepLeftInset.equal             = 0;
				oo.keepRightInset.min              = 0;
			}];
		}];
	}

	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	_avatar.imageURL = user.avatarURL;
	_login.text      = user.login;
	if (_user.registrationDate)
	{
		_joinedOn.text = [NSString stringWithFormat:@"Joined on %@", [_user.registrationDate stringFromDate]];
	}
	_name.text       = _user.name ? _user.name : @"";
	_company.text    = _user.company ? _user.company : @"";

	[self reloadInputViews];
}
@end
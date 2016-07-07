//
// Created by Anastasia on 7/7/16.
//

#import "TCUserPageView.h"
#import "TCUser.h"
#import "TCImageView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"
#import "TCUserInformationTableView.h"

@implementation TCUserPageView
{
	CGFloat                    _topInset;
	TCImageView                *_avatar;
	UILabel                    *_login;
	UILabel                    *_date;
	TCUserInformationTableView *_userInfo;
}

- (TCUserPageView *) initWithTopInset:(CGFloat)topInset
{
	self = [super init];
	if (self)
	{
		_topInset = topInset;
		self.backgroundColor = [UIColor whiteColor];
		__unused UIView *userInformationview = [UIView tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepTopMarginInset.equal  = _topInset;
			//o.keepHeight.max            = 200;
			o.keepLeftMarginInset.equal = 0;
			o.keepRightMarginInset.min  = 0;

			__unused TCImageView *avatar = _avatar = [TCImageView tc_with:^(TCImageView *oo) {
				[o addSubview:oo];
				oo.keepTopInset.equal  = 0;
				oo.keepLeftInset.equal = 0;
				oo.keepHeight.max      = 100;
				oo.keepWidth.max       = 100;
			}];

			__unused TCUserInformationTableView *userInfo = _userInfo = [TCUserInformationTableView tc_with:^(TCUserInformationTableView *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopInset.equal             = 0;
				oo.keepBottomInset.min            = 0;
				oo.keepLeftOffsetTo(avatar).equal = 5;
				oo.keepRightInset.min             = 0;
			}];


//			__unused UILabel *login = _login = [UILabel tc_with:^(UILabel *oo) {
//				oo.backgroundColor = [UIColor whiteColor];
//				[o addSubview:oo];
//				oo.keepTopOffsetTo(avatar).equal     = 5;
//				oo.keepVerticalAlignTo(avatar).equal = 0;
//				oo.keepRightInset.min                = 0;
//				oo.keepLeftInset.min                 = 0;
//			}];
//
//			__unused UILabel *dateStr = [UILabel tc_with:^(UILabel *oo) {
//				oo.backgroundColor = [UIColor whiteColor];
//				oo.text            = @"Joined on";
//				[o addSubview:oo];
//				oo.keepTopOffsetTo(login).equal      = 5;
//				oo.keepVerticalAlignTo(avatar).equal = 0;
//				oo.keepRightInset.min                = 0;
//				oo.keepLeftInset.min                 = 0;
//			}];
//
//			__unused UILabel *date = _date = [UILabel tc_with:^(UILabel *oo) {
//				oo.backgroundColor = [UIColor whiteColor];
//				[o addSubview:oo];
//				oo.keepTopOffsetTo(dateStr).equal    = 0;
//				oo.keepVerticalAlignTo(avatar).equal = 0;
//				oo.keepRightInset.min                = 0;
//				oo.keepLeftInset.min                 = 0;
//				oo.keepBottomInset.min               = 0;
//			}];
//
//			__unused UILabel *followers = [UILabel tc_with:^(UILabel *oo) {
//				oo.backgroundColor = [UIColor whiteColor];
//				oo.text            = @"Followers";
//				[o addSubview:oo];
//				oo.keepTopInset.equal             = 0;
//				oo.keepLeftOffsetTo(avatar).equal = 5;
//				oo.keepRightInset.min             = 0;
//			}];
//
//			__unused UILabel *following = [UILabel tc_with:^(UILabel *oo) {
//				oo.backgroundColor = [UIColor whiteColor];
//				oo.text            = @"Following";
//				[o addSubview:oo];
//				oo.keepTopOffsetTo(followers).equal = 15;
//				oo.keepRightInset.min               = 0;
//				oo.keepLeftOffsetTo(avatar).equal   = 5;
//				oo.keepBottomInset.min              = 0;
//			}];
		}];
	}
	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	_userInfo.user = user;
	_avatar.image  = user.avatar;
	_login.text    = user.login;
	_date.text     = [user.registrationDate stringFromDate];
}
@end
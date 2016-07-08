//
// Created by Anastasia on 7/7/16.
//

#import "TCUserPageView.h"
#import "TCUser.h"
#import "TCImageView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCUserInformationTableView.h"
#import "TCUserGistPreView.h"

@implementation TCUserPageView
{
	CGFloat                    _topInset;
	TCImageView                *_avatar;
	TCUserInformationTableView *_userInfo;
	TCUserGistPreView          *_gists;
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
			o.keepTopMarginInset.equal    = _topInset;
			o.keepBottomMarginInset.equal = 0;
			o.keepLeftMarginInset.equal   = 0;
			o.keepRightMarginInset.equal  = 0;

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
				oo.keepTopInset.equal    = 0;
				oo.keepHeight.equal      = 100;
				oo.keepLeftInset.equal   = 105;
				oo.keepRightInset.equal  = 0;
				oo.keepWidth.equal       = 100;
			}];

			__unused TCUserGistPreView *gists = _gists = [TCUserGistPreView tc_with:^(TCUserGistPreView *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_userInfo).equal = 10;
				oo.keepBottomInset.equal            = 0;
				oo.keepHorizontalInsets.equal       = 0;
				oo.keepHeight.min = 100;
				oo.keepWidth.min = 100;
			}];
		}];
	}
	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	_userInfo.user = user;
	_avatar.image  = user.avatar;
	NSData  *gistsData = [[NSData alloc] initWithContentsOfURL:user.gistsURL];
	NSError *error     = nil;
	if (gistsData)
	{
		NSArray *parsedData = [NSJSONSerialization JSONObjectWithData:gistsData options:kNilOptions error:&error];
		_gists.gistsArray = parsedData;
	}
	else
	{_gists.gistsArray = nil;}
}
@end
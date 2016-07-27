//
// Created by Anastasia on 6/26/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCUserTableCell.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"

@implementation TCUserTableCell
{
	TCImageView *_avatar;
	UILabel     *_loginLabel;
	UILabel     *_organisationLabel;
}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		UIView *view = self.contentView;
		[view tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];

			__unused TCImageView *avatar = _avatar                             = [TCImageView tc_with:^(TCImageView *oo) {
				[o addSubview:oo];
				oo.keepTopMarginInset.equal    = 0;
				oo.keepBottomMarginInset.equal = 0;
				oo.keepLeftMarginInset.equal   = 0;
			}];

			__unused UIView  *viewWithNameAndOrganisation = [UIView tc_with:^(UIView *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal        = 0;
				oo.keepLeftMarginInset.equal       = KeepFitting(110);
				oo.keepLeftOffsetTo(_avatar).equal = 10;
				oo.keepRightMarginInset.equal      = 0;

				__unused UILabel *nameLabel = _loginLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepTopInset.equal  = 5;
					ooo.keepLeftInset.equal = 0;
					ooo.keepRightInset.min  = 0;
				}];

				__unused UILabel *organisationLabel= _organisationLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepTopOffsetTo(_loginLabel).equal  = 5;
					ooo.keepLeftInset.equal = 0;
					ooo.keepRightInset.min  = 0;
				}];
			}];
		}];
	}
	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	_avatar.imageURL    = user.avatarURL;
	_loginLabel.text        = user.login;
}
@end
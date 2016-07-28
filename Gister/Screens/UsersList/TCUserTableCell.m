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
}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		UIView *view = self.contentView;
		[view tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];

			__unused TCImageView *avatar = _avatar = [TCImageView tc_with:^(TCImageView *oo) {
				[o addSubview:oo];
				oo.keepTopMarginInset.equal    = 0;
				oo.keepBottomMarginInset.equal = 0;
				oo.keepLeftMarginInset.equal   = 0;
			}];

			__unused UILabel *nameLabel = _loginLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepHorizontalAlignTo(_avatar).equal = 1;
				oo.keepLeftOffsetTo(_avatar).equal = 5;
				oo.keepRightInset.min  = 0;
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
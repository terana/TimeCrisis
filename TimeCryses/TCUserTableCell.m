//
// Created by Anastasia on 6/26/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCUserTableCell.h"
#import "TCUser.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"

@implementation TCUserTableCell
{
	UIImageView *_photo;
	UILabel     *_nameLabel;
	UILabel     *_rangLabel;
	UILabel     *_registrationDateLabel;
}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		UIView *view = self.contentView;
		[view tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];

			__unused UIImageView *photo = _photo = [UIImageView tc_with:^(UIImageView *oo) {
				[o addSubview:oo];
				oo.keepLeftInset.equal = 20;
				oo.keepTopInset.equal  = 5;
				oo.keepWidth.equal     = 95;
				oo.keepHeight.equal    = 95;
			}];

			__unused UILabel *nameLabel = _nameLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepHorizontalCenter.equal = 0.5;
				oo.keepTopInset.equal         = 5;
			}];

			__unused UILabel *rangLabel = _rangLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepHorizontalCenter.equal       = 0.5;
				oo.keepTopOffsetTo(nameLabel).equal = 5;
			}];

			__unused UILabel *registrationDateLabel = _registrationDateLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepHorizontalCenter.equal       = 0.5;
				oo.keepTopOffsetTo(rangLabel).equal = 5;
				oo.keepBottomInset.equal            = 5;
			}];
		}];
	}
	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	_photo.image                = user.photo;
	_nameLabel.text             = user.name;
	_rangLabel.text             = user.rang;
	_registrationDateLabel.text = [user.registrationDate stringFromDate];
}
@end
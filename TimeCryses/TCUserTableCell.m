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

			__unused UIImageView *photo = _photo                             = [UIImageView tc_with:^(UIImageView *oo) {
				oo.contentMode = UIViewContentModeScaleAspectFit;
				[o addSubview:oo];
				oo.keepTopMarginInset.equal    = 0;
				oo.keepBottomMarginInset.min   = 0;
				oo.keepBottomMarginInset.equal = KeepFitting(0);
				oo.keepLeftMarginInset.equal   = 0;
			}];

			__unused UIView  *viewWithNameAndRang   = [UIView tc_with:^(UIView *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal      = 10;
				oo.keepLeftMarginInset.equal     = 100;
				oo.keepLeftOffsetTo(photo).equal = 10;
				oo.keepRightMarginInset.min      = 0;

				__unused UILabel *nameLabel = _nameLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepTopInset.equal  = 5;
					ooo.keepLeftInset.equal = 0;
					ooo.keepRightInset.min  = 0;
				}];

				__unused UILabel *rangLabel = _rangLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepTopOffsetTo(nameLabel).equal = 5;
					ooo.keepBottomInset.min              = 0;
					ooo.keepLeftInset.equal              = 0;
					ooo.keepRightInset.min               = 0;
				}];
			}];
			__unused UILabel *registrationDateLabel = _registrationDateLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepBottomMarginInset.equal                = 0;
				oo.keepTopOffsetTo(viewWithNameAndRang).equal = 5;
				oo.keepRightMarginInset.equal                 = 0;
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
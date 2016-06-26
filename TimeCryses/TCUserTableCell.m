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

			__unused UIImageView *photo = _photo  = [UIImageView tc_with:^(UIImageView *oo) {
				[o addSubview:oo];
				oo.keepTopMarginInset.equal  = 0;
				oo.keepBottomMarginInset.min = 0;
				oo.keepLeftMarginInset.equal = 0;
				oo.keepWidth.max = 95;
				//AAAAAAAAAAAAAA I DONT KNOW HOW TO KEEP RIGHT INSET!!!
			}];

			__unused UIView  *viewWithNameAndRang = [UIView tc_with:^(UIView *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal = 10;
				oo.keepLeftOffsetTo(photo).equal = 10;

				__unused UILabel *nameLabel = _nameLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepHorizontalCenter.equal = 0.5;
					ooo.keepTopInset.equal         = 5;
				}];

				__unused UILabel *rangLabel = _rangLabel = [UILabel tc_with:^(UILabel *ooo) {
					ooo.backgroundColor = [UIColor whiteColor];
					[oo addSubview:ooo];
					ooo.keepHorizontalCenter.equal       = 0.5;
					ooo.keepTopOffsetTo(nameLabel).equal = 5;
				}];
			}];

			__unused UILabel *registrationDateLabel = _registrationDateLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepRightMarginInset.equal = 0;
				oo.keepBottomMarginInset.equal = 0;
				oo.keepTopOffsetTo(viewWithNameAndRang).equal = 10;
				oo.keepLeftOffsetTo(viewWithNameAndRang).equal = 10;
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
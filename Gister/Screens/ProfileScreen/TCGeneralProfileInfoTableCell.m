//
// Created by Anastasia on 7/30/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCGeneralProfileInfoTableCell.h"
#import "TCGeneralProfileInfoView.h"
#import "TCUser.h"
#import "NSObject+TCDoWith.h"

@implementation TCGeneralProfileInfoTableCell
{
	TCGeneralProfileInfoView *_profileInfoView;
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		self.accessoryType = UITableViewCellAccessoryNone;
		__unused TCGeneralProfileInfoView *view = _profileInfoView = [TCGeneralProfileInfoView tc_with:^(TCGeneralProfileInfoView *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self.contentView addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}
	return self;
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	_profileInfoView.user = user;
}
@end
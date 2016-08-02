//
// Created by Anastasia on 6/27/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCGistTableCell.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"

@implementation TCGistTableCell
{
	UILabel *_descriptionLabel;
	UILabel *_creationDateLabel;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		UIView *view = self.contentView;
		[view tc_with:^(UIView *o) {
			o.backgroundColor = [UIColor whiteColor];

			__unused UILabel *descriptionString = [UILabel tc_with:^(UILabel *oo) {
				oo.text            = @"Description:";
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal  = 0;
				oo.keepWidth.max             = 100;
				oo.keepLeftMarginInset.equal = 0;
			}];
			__unused UILabel *descriptionLabel  = _descriptionLabel  = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal  = 0;
				oo.keepRightMarginInset.min  = 0;
				oo.keepLeftMarginInset.equal = 105;
			}];

			__unused UILabel *dateString        = [UILabel tc_with:^(UILabel *oo) {
				oo.text            = @"Created at:";
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(descriptionString).equal = 10;
				oo.keepWidth.max                            = 100;
				oo.keepLeftMarginInset.equal                = 0;
			}];
			__unused UILabel *creationDateLabel = _creationDateLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(descriptionString).equal = 10;
				oo.keepRightMarginInset.min                 = 0;
				oo.keepLeftMarginInset.equal                = 105;
			}];
		}];
	}
	return self;
}

- (void) setGist:(TCGist *)gist
{
	_gist = gist;

	_descriptionLabel.text  = gist.gistDescription;
	_creationDateLabel.text = [gist.creationDate stringFromDate];
}
@end
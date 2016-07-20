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
	UILabel *_urlLabel;
	UILabel *_idLabel;
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

			__unused UILabel *idString = [UILabel tc_with:^(UILabel *oo) {
				oo.text            = @"id:";
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal = 10;
				oo.keepWidth.max                    = 100;
				oo.keepLeftMarginInset.equal        = 0;
			}];
			__unused UILabel *idLabel  = _idLabel                    = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopMarginInset.equal = 10;
				oo.keepRightMarginInset.min         = 0;
				oo.keepLeftMarginInset.equal        = 105;
			}];

			__unused UILabel *dateString        = [UILabel tc_with:^(UILabel *oo) {
				oo.text            = @"created at:";
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_idLabel).equal = 10;
				oo.keepWidth.max                   = 100;
				oo.keepLeftMarginInset.equal       = 0;
			}];
			__unused UILabel *creationDateLabel = _creationDateLabel = [UILabel tc_with:^(UILabel *oo) {
				oo.backgroundColor = [UIColor whiteColor];
				[o addSubview:oo];
				oo.keepTopOffsetTo(_idLabel).equal = 10;
				oo.keepLeftMarginInset.equal       = 50;
				oo.keepRightMarginInset.min        = 0;
				oo.keepLeftMarginInset.equal       = 105;
			}];
		}];
	}
	return self;
}

- (void) setGist:(TCGist *)gist
{
	_gist = gist;

	_idLabel.text           = gist.id;
	_creationDateLabel.text = [gist.creationDate stringFromDate];
}
@end
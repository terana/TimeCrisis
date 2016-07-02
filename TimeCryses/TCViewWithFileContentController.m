//
// Created by Anastasia on 7/2/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCViewWithFileContentController.h"
#import "NSObject+TCDoWith.h"

@implementation TCViewWithFileContentController
{
}
- (void) loadView
{
	self.title = _file.filename;
	self.view  = [UIView tc_with:^(UIView *o) {
		o.backgroundColor = [UIColor whiteColor];

		__unused UILabel *filenameStr   = [UILabel tc_with:^(UILabel *oo) {
			oo.backgroundColor = [UIColor whiteColor];
			oo.text            = @"name:";
			[o addSubview:oo];
			oo.keepTopMarginInset.equal  = 70;
			oo.keepLeftMarginInset.equal = 0;
			oo.keepWidth.max             = 80;
		}];
		__unused UILabel *filenameLabel = [UILabel tc_with:^(UILabel *oo) {
			oo.backgroundColor = [UIColor whiteColor];
			oo.text            = _file.filename;
			[o addSubview:oo];
			oo.keepTopMarginInset.equal  = 70;
			oo.keepLeftMarginInset.equal = 85;
			oo.keepRightMarginInset.min  = 0;
		}];

		__unused UILabel *typeStr   = [UILabel tc_with:^(UILabel *oo) {
			oo.text = @"type:";
			[o addSubview:oo];
			oo.keepTopOffsetTo(filenameStr).equal = 10;
			oo.keepLeftMarginInset.equal          = 0;
			oo.keepWidth.max                      = 80;
		}];
		__unused UILabel *typeLabel = [UILabel tc_with:^(UILabel *oo) {
			oo.text = _file.fileType;
			[o addSubview:oo];
			oo.keepTopOffsetTo(filenameLabel).equal = 10;
			oo.keepLeftMarginInset.equal            = 85;
			oo.keepRightMarginInset.min             = 0;
		}];

		__unused UILabel *languageStr   = [UILabel tc_with:^(UILabel *oo) {
			oo.text = @"language:";
			[o addSubview:oo];
			oo.keepTopOffsetTo(typeStr).equal = 10;
			oo.keepLeftMarginInset.equal      = 0;
			oo.keepWidth.max                  = 80;
		}];
		__unused UILabel *languageLabel = [UILabel tc_with:^(UILabel *oo) {
			oo.text = _file.language;
			[o addSubview:oo];
			oo.keepTopOffsetTo(typeLabel).equal = 10;
			oo.keepLeftMarginInset.equal        = 85;
			oo.keepRightMarginInset.min         = 0;
		}];

		__unused UILabel *rawURLStr   = [UILabel tc_with:^(UILabel *oo) {
			oo.text = @"raw URL:";
			[o addSubview:oo];
			oo.keepTopOffsetTo(languageStr).equal = 10;
			oo.keepLeftMarginInset.equal          = 0;
			oo.keepWidth.max                      = 80;
		}];
		__unused UILabel *rawURLLabel = [UILabel tc_with:^(UILabel *oo) {
			oo.text = [_file.rawURL absoluteString];
			[o addSubview:oo];
			oo.keepTopOffsetTo(languageLabel).equal = 10;
			oo.keepLeftMarginInset.equal            = 85;
			oo.keepRightMarginInset.min             = 0;
		}];

		__unused UILabel *sizeStr   = [UILabel tc_with:^(UILabel *oo) {
			oo.text = @"size:";
			[o addSubview:oo];
			oo.keepTopOffsetTo(rawURLStr).equal = 10;
			oo.keepLeftMarginInset.equal        = 0;
			oo.keepWidth.max                    = 80;
		}];
		__unused UILabel *sizeLabel = [UILabel tc_with:^(UILabel *oo) {
			oo.text = [NSString stringWithFormat:@"%d", _file.fileSize];
			[o addSubview:oo];
			oo.keepTopOffsetTo(rawURLLabel).equal = 10;
			oo.keepLeftMarginInset.equal          = 85;
			oo.keepRightMarginInset.min           = 0;
		}];
	}];
}
@end
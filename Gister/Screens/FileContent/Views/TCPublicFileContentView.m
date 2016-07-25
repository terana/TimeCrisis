//
// Created by Anastasia on 7/25/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCPublicFileContentView.h"
#import "NSObject+TCDoWith.h"

@implementation TCPublicFileContentView
{
	UITextView *_fileContentView;
}
-(instancetype)init
{
	self = [super init];
	if(self)
	{
		__unused UITextView *textView = _fileContentView = [UITextView tc_with:^(UITextView *o) {
			o.backgroundColor = [UIColor whiteColor];
			o.editable = NO;
			[_contentView addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}
	return self;
}
- (void) setFileContent:(NSString *)fileContent
{
	_fileContent = fileContent;
	_fileContentView.text = fileContent;
	[self reloadInputViews];
}
@end
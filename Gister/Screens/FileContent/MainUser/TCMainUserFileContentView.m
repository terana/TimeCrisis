//
// Created by Anastasia on 8/2/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMainUserFileContentView.h"
#import "TCFileContentView.h"
#import "NSObject+TCDoWith.h"

@implementation TCMainUserFileContentView
{
	TCFileContentView *_fileContentView;
}

- (UITextView *) textView
{
	return _fileContentView.textView;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor whiteColor];
		__unused TCFileContentView *fileContentView = _fileContentView = [TCFileContentView tc_with:^(TCFileContentView *o) {
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepHorizontalMarginInsets.equal = 0;
			o.keepTopMarginInset.equal         = 0;
		}];
		__unused UIToolbar         *toolbar         = [UIToolbar tc_with:^(UIToolbar *o) {

			UIBarButtonItem *renameItem    = [[UIBarButtonItem alloc] initWithTitle:@"Rename" style:UIBarButtonItemStylePlain target:_delegate action:@selector(renameFile)];
			UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
			                                                                               target:nil
			                                                                               action:nil];
			UIBarButtonItem *deleteItem    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:_delegate action:@selector(deleteFile)];
			[o setItems:@[ renameItem, flexibleSpace, deleteItem ] animated:YES];
			[self addSubview:o];
			o.keepTopOffsetTo(fileContentView).equal = 5;
			o.keepBottomInset.equal            = 0;
			o.keepHorizontalInsets.equal       = 0;
		}];
	}
	return self;
}

- (void) setFileContent:(NSString *)fileContent
{
	_fileContent = fileContent;
	_fileContentView.fileContent = fileContent;
}
@end
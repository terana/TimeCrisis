//
// Created by Anastasia on 7/22/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCUserFileContentView.h"
#import "NSObject+TCDoWith.h"
#import "TCUserFileContentViewDelegate.h"

@implementation TCUserFileContentView
{
}
-(instancetype) init
{
	self = [super init];
	if(self)
	{
		self.backgroundColor = [UIColor whiteColor];
		__unused UITextView *contentView = _contentView = [UITextView tc_with:^(UITextView *o) {
			//o.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
			o.editable                    = YES;
			o.backgroundColor = [UIColor whiteColor];
			[self addSubview:o];
			o.keepTopInset.equal = 70;
			o.keepHorizontalInsets.equal = 0;
			o.keepBottomInset.min = 0;
		}];

		__unused UIToolbar *toolbar = [UIToolbar tc_with:^(UIToolbar *o) {
			UIBarButtonItem *renameItem = [[UIBarButtonItem alloc] initWithTitle:@"Rename" style:UIBarButtonItemStylePlain target:_delegate action:@selector(renameFile)];
			UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
			                                                                               target:nil
			                                                                               action:nil];
			UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:_delegate action:@selector(deleteFile)];
			[o setItems:@[renameItem, flexibleSpace, deleteItem]];
			[self addSubview:o];
			o.keepTopOffsetTo(_contentView).equal = 0;
			o.keepBottomInset.equal = 0;
			o.keepHeight.equal = 44;
			o.keepHorizontalInsets.equal = 0;
		}];


	}
	return self;
}

- (void) setFileContent:(NSString *)fileContent
{
	_fileContent = fileContent;
	_contentView.text = fileContent;
	[self reloadInputViews];
}
@end
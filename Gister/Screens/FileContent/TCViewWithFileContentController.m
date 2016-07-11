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
	NSError  *error       = nil;
	NSString *fileContent = [NSString stringWithContentsOfURL:_file.rawURL encoding:NSASCIIStringEncoding error:&error];
	self.view = [UITextView tc_with:^(UITextView *o) {
		o.backgroundColor             = [UIColor whiteColor];
		o.text                        = fileContent;
		o.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
		o.editable = NO;
	}];
}

//- (void) viewWillAppear:(BOOL)animated
//{
//	UITextView *view = self.view;
//	view.contentInset = UIEdgeInsetsMake(view.contentInset.top + self.navigationController.navigationBar.frame.size.height, view.contentInset.left, view.contentInset.bottom, view.contentInset.right);
//}

@end
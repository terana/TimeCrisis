//
// Created by Anastasia on 7/2/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCFileContentView.h"
#import "NSObject+TCDoWith.h"

@implementation TCFileContentView
{
}
-(instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = _file.filename;

		self.navigationItem.rightBarButtonItem = [UIBarButtonItem tc_with:^(UIBarButtonItem *o){
			o.title = @"Edit";
			o.action = @selector(editFile);
		}];
	}
	return self;
}

-(void) editFile
{

}
- (void) loadView
{

	NSError  *error       = nil;
	NSString *fileContent = [NSString stringWithContentsOfURL:_file.rawURL encoding:NSASCIIStringEncoding error:&error];
	self.view = [UITextView tc_with:^(UITextView *o) {
		o.backgroundColor             = [UIColor whiteColor];
		o.text                        = fileContent;
		o.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
		o.editable = NO;
	}];
}

@end
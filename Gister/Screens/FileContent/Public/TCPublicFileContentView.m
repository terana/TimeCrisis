//
// Created by Anastasia on 7/25/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCPublicFileContentView.h"
#import "NSObject+TCDoWith.h"

@implementation TCPublicFileContentView

- (void) setFileContent:(NSString *)fileContent
{
	_fileContent = fileContent;
	_textView.text = fileContent;
	[self reloadInputViews];
}
@end
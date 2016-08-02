//
// Created by Anastasia on 7/22/16.
//

#import <KeepLayout/KeepView.h>
#import "TCFileContentView.h"

@implementation TCFileContentView
{
}

- (void) setFileContent:(NSString *)fileContent
{
	_fileContent = fileContent;
	_textView.text = fileContent;
}

@end
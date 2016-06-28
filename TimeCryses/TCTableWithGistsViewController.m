//
// Created by Anastasia on 6/27/16.
//

#import "TCTableWithGistsViewController.h"
#import "TCViewWithUserTable.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithGistTable.h"

@implementation TCTableWithGistsViewController
{
}
- (void) loadView
{
	self.view = [TCViewWithGistTable tc_with:^(TCViewWithGistTable *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	NSData  *urlData    = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://api.github.com/gists/public"]];
	NSError *error      = nil;
	NSArray *parsedData = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
	TCViewWithGistTable *view = self.view;
	view.data = parsedData;
}
@end
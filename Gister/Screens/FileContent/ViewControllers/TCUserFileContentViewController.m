//
// Created by Anastasia on 7/2/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCUserFileContentViewController.h"
#import "TCServerManager.h"
#import "TCUserFileContentView.h"
#import "TCFilesListViewController.h"

@implementation TCUserFileContentViewController
{
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(editFile)];
	}
	return self;
}

- (void) setFile:(TCFile *)file
{
	_file = file;
	self.title = _file.filename;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[TCServerManager shared] getFileContentForFile:_file withCallback:^(NSString *content, NSError *error) {
		if (!error)
		{
			TCUserFileContentView *view = self.view;
			view.fileContent = content;
			_file.content = content;
			[self reloadInputViews];
		}
	}];
}

- (void) renameFile
{

	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Rename file"
	                                                               message:@"Write new name"
	                                                        preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Rename" style:UIAlertActionStyleDefault
	                                                      handler:^(UIAlertAction * action) {
		                                                      UITextField *nameTextField = [alert textFields][0];
		                                                      _file.changedName = nameTextField.text;
		                                                      _file.changed = YES;
		                                                      [[TCServerManager shared] editGist:_file.gist withCallback:^(TCGist *gist, NSError *error){
			                                                     if(!error)
			                                                     {
				                                                     _file.gist = gist;
				                                                     [[self navigationController] popViewControllerAnimated:YES];
			                                                     }
		                                                      }];
	                                                      }];

	[alert addAction:defaultAction];
	[alert addTextFieldWithConfigurationHandler:^(UITextField *textField){}];
	[self presentViewController:alert animated:YES completion:nil];
}

- (void) editFile
{
	TCUserFileContentView *view = self.view;
	if (![view.contentView.text isEqualToString:view.fileContent])
	{
		_file.changed = YES;
		_file.content = view.contentView.text;

		[[TCServerManager shared] editGist:_file.gist withCallback:^(TCGist *gist, NSError *error) {
			if (error == nil)
			{
				_file.gist                    = gist;
				TCFilesListViewController *vc = [TCFilesListViewController new];
				vc.gist = gist;
				[[self navigationController] pushViewController:vc animated:YES];
			}
		}];
	}
}

- (void) deleteFile
{
	_file.content = nil;

	[[TCServerManager shared] editGist:_file.gist withCallback:^(TCGist *gist, NSError *error) {
		if (error == nil)
		{
			_file.gist.gistDescription = gist.gistDescription;
			_file.gist.public = gist.public;

			[[self navigationController] popViewControllerAnimated:YES];
		}
	}];
}
@end
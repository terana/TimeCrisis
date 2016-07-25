//
// Created by Anastasia on 6/29/16.
//

#import "TCFilesListViewController.h"
#import "TCFilesListView.h"
#import "NSObject+TCDoWith.h"
#import "TCUserFileContentViewController.h"

@interface TCFilesListViewController () <TCFilesListViewDelegate>
@end

@implementation TCFilesListViewController
{
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Files";

		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFile)];
	}
	return self;
}

- (void) addNewFile
{
	TCFile *file = [TCFile new];
	_gist.files = [_gist.files arrayByAddingObject:file];
	file.gist   = _gist;
	file.changed = YES;

	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Creating new file"
	                                                               message:@"Write the name of new file"
	                                                        preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault
	                                                      handler:^(UIAlertAction *action) {
		                                                      UITextField                     *fileNameTextField = [alert textFields][0];
		                                                      file.filename = fileNameTextField.text;
		                                                      TCUserFileContentViewController *vc                = [TCUserFileContentViewController new];
		                                                      vc.file       = file;
		                                                      [[self navigationController] pushViewController:vc animated:YES];
	                                                      }];

	[alert addAction:defaultAction];
	[alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {}];
	[self presentViewController:alert animated:YES completion:nil];
}


- (void) viewDidLoad
{
	TCFilesListView *view = self.view;
	view.gist     = _gist;
	view.delegate = self;
}

- (void) fileIsSelected:(TCFile *)file
{
	TCUserFileContentViewController *vc = [TCUserFileContentViewController new];
	vc.file                     = file;
	vc.hidesBottomBarWhenPushed = YES;// HOW to hide tab bar?
	[self.navigationController pushViewController:vc animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self reloadInputViews];
}
@end
//
// Created by Anastasia on 7/27/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCCreatingGistView.h"
#import "NSObject+TCDoWith.h"
#import "TCGist.h"
#import "TCServerManager.h"

@implementation TCCreatingGistView
{
	UITextField *_gistDescriptionTextField;
	UITextField *_fileNameTextField;
	UITextView  *_fileContentTextView;
}
+ (UITableViewStyle) tableViewStyle
{
	return UITableViewStyleGrouped;
}

+ (NSDictionary *) cellIdentifiers
{
	return @{ @"Cell" : [UITableViewCell class] };
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	switch (section)
	{
		case 0:
		{
			return 1;
		};
		case 1:
		{
			return 2;
		}
		case 2:
		{
			return 2;
		}
		default:
			return 0;
	}
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	switch (indexPath.section)
	{
		case 0:
		{
			UIView               *view      = cell.contentView;
			__unused UITextField *textField = _gistDescriptionTextField = [UITextField tc_with:^(UITextField *o) {
				o.placeholder = @"Description of the new gist";
				[view addSubview:o];
				o.keepInsets.equal = 0;
			}];
			cell.accessoryType = UITableViewCellAccessoryNone;
			break;
		}
		case 1:
		{
			switch (indexPath.row)
			{
				case 0:
				{
					UIView               *view      = cell.contentView;
					__unused UITextField *textField = _fileNameTextField = [UITextField tc_with:^(UITextField *o) {
						o.placeholder = @"Filename";
						[view addSubview:o];
						o.keepInsets.equal = 0;
					}];
					cell.accessoryType = UITableViewCellAccessoryNone;
					break;
				}
				case 1:
				{
					UIView              *view     = cell.contentView;
					__unused UITextView *textView = _fileContentTextView = [UITextView tc_with:^(UITextView *o) {
						[view addSubview:o];
						o.keepInsets.equal = 0;
					}];
					cell.accessoryType = UITableViewCellAccessoryNone;
					break;
				}
				default:
					break;
			}
			break;
		}
		case 2:
		{
			switch (indexPath.row)
			{
				case 0:
				{
					cell.textLabel.text = @"Create public gist";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 1:
				{
					cell.textLabel.text = @"Create private gist";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				default:
					break;
			}
			break;
		}
		default:
			break;
	}
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.section)
	{
		case 0:
		{
			return 40;
		}
		case 1:
		{
			switch (indexPath.row)
			{
				case 0:
				{
					return 40;
				}
				case 1:
				{
					return 200;
				}
				default:
					return 0;
			}
		}
		case 2:
		{
			return 40;
		}
		default:
			return 0;
	}
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 2)
	{
		TCGist *gist = [TCGist new];
		gist.gistDescription = _gistDescriptionTextField.text ? _gistDescriptionTextField.text : @"new gist";
		TCFile *file = [TCFile new];
		file.filename = _fileNameTextField.text ? _fileNameTextField.text : @"new file";
		file.content  = _fileContentTextView.text ? _fileContentTextView.text : @"some text";
		gist.files    = @[ file ];

		switch (indexPath.row)
		{
			case 0:
			{
				gist.public = YES;
				break;
			}
			case 1:
			{
				gist.public = NO;
				break;
			}
			default:
				break;
		}
		[_delegate createGist:gist];
	}
}
@end
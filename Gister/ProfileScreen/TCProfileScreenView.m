//
// Created by Anastasia on 7/12/16.
//

#import "TCProfileScreenView.h"
#import "TCUser.h"

@implementation TCProfileScreenView
{
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
	return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0)
	{return 1;}
	return 4; //TODO
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (indexPath.section == 0)
	{

	}
	return cell;
}
@end
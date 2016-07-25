//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>

@interface TCTableViewContainer : UIView <UITableViewDelegate, UITableViewDataSource>
{
@protected
	UITableView *_tableView;
}
@property (readonly, nonatomic) UITableView *tableView;
+ (UITableViewStyle) tableViewStyle;
+ (NSDictionary *) cellIdentifiers;
@end
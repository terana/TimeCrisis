//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCViewController.h"
#import "TCUsersListViewDelegate.h"

@interface TCUsersListViewController : TCViewController <TCUsersListViewDelegate>
@property (strong, nonatomic) NSArray *users;
@end
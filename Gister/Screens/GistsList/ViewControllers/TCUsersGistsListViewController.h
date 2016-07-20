//
// Created by Anastasia on 7/19/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCViewController.h"
#import "TCGistsListViewDelegate.h"

@interface TCUsersGistsListViewController : TCViewController <TCGistsListViewDelegate>
@property (strong, nonatomic) TCUser *user;
@end
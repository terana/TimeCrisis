//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCViewController.h"
#import "TCGistsListViewDelegate.h"

@interface TCOtherUsersGistsListViewController : TCViewController <TCGistsListViewDelegate>
@property (strong, nonatomic) TCUser *user;
@end
//
// Created by Anastasia on 7/19/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCViewController.h"
#import "TCGistsListViewDelegate.h"

@interface TCMainUsersGistsListViewController : TCViewController <TCGistsListViewDelegate>
@property (strong, nonatomic) NSArray* gists;
@end
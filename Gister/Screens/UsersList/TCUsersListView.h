//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@protocol TCUsersListViewDelegate;

@interface TCUsersListView : TCTableViewContainer
@property (weak, nonatomic) id <TCUsersListViewDelegate> delegate;
@property (strong, nonatomic) NSArray *users;
@end
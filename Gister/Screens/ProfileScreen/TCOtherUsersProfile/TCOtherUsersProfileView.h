//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"
#import "TCMainUserProfileView.h"

@class TCUser;

@interface TCOtherUsersProfileView : TCTableViewContainer
@property (strong, nonatomic) TCUser                   *user;
@property (weak, nonatomic) id <TCProfileViewDelegate> delegate;
@end
//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCViewController.h"
#import "TCProfileViewDelegate.h"
#import "TCMainUserProfileViewController.h"

@class TCUser;

@interface TCOtherUsersProfileViewController : TCViewController <TCProfileViewDelegate>
@property (strong, nonatomic) TCUser *user;
@end
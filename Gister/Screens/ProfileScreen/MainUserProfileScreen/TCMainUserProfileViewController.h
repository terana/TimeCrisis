//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCViewController.h"
#import "TCUser.h"
#import "TCProfileViewDelegate.h"

@interface TCMainUserProfileViewController : TCViewController <TCProfileViewDelegate>
@property (strong, nonatomic) TCUser *user;
@end
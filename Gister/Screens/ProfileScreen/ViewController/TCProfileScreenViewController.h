//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCViewController.h"
#import "TCUser.h"
#import "TCProfileScreenViewDelegate.h"

@interface TCProfileScreenViewController : TCViewController <TCProfileScreenViewDelegate>
@property (strong, nonatomic) TCUser *user;
@end
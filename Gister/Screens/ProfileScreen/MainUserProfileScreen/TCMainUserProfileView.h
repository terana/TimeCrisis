//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@protocol TCProfileViewDelegate;
@class TCUser;

@interface TCMainUserProfileView : TCTableViewContainer
@property (strong, nonatomic) TCUser                   *user;
@property (weak, nonatomic) id <TCProfileViewDelegate> delegate;
@end
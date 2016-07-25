//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"
#import "TCUser.h"

@protocol TCProfileScreenViewDelegate;

@interface TCProfileScreenView : TCTableViewContainer
@property (strong, nonatomic) TCUser                         *user;
@property (weak, nonatomic) id <TCProfileScreenViewDelegate> delegate;
@end
//
// Created by Anastasia on 7/7/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCUserInformatiobSelection.h"

@interface TCUserInformationTableView : UIView
@property (strong, nonatomic) TCUser* user;
@property (nonatomic, weak, nullable) id <TCUserInformatiobSelection> delegate;
@end
//
// Created by Anastasia on 7/14/16.
//

#import <UIKit/UIKit.h>
#import "TCViewController.h"

@interface TCGithubAuthenticationViewController : TCViewController
@property (strong, nonatomic) BOOL (^callback)(NSURLRequest *);
@end
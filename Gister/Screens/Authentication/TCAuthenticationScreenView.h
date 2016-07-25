//
// Created by Anastasia on 7/14/16.
//

#import <UIKit/UIKit.h>
#import "TCAuthenticationScreenViewDelegate.h"

@interface TCAuthenticationScreenView : UIView
@property (strong, nonatomic) id <TCAuthenticationScreenViewDelegate> delegate;
- (void) signIn;
@end
//
// Created by Anastasia on 7/14/16.
//

#import <UIKit/UIKit.h>

@protocol TCAuthenticationScreenViewDelegate <NSObject>
- (void) signIn;
@end

@interface TCWelcomeScreenView : UIView
@property (strong, nonatomic) id <TCAuthenticationScreenViewDelegate> delegate;
- (void) signIn;
@end
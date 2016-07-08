 //
// Created by Anastasia on 7/7/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"

 @protocol TCUserInformatiobSelection;

 @interface TCUserPageView : UIView
@property (strong, nonatomic) TCUser *user;
@property (nonatomic, weak, nullable) id <TCUserInformatiobSelection> delegate;
-(TCUserPageView *) initWithTopInset:(CGFloat)topInset;
@end
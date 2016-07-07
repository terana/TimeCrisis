//
// Created by Anastasia on 7/7/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"

@interface TCUserPageView : UIView
@property (strong, nonatomic) TCUser *user;
-(TCUserPageView *) initWithTopInset:(CGFloat)topInset;
@end
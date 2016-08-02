//
// Created by Anastasia on 7/11/16.
//

#import <UIKit/UIKit.h>

@interface TCViewController : UIViewController
+ (Class) viewClass;
- (BOOL) layoutMarginsAutomaticAdjustmentEnabled;

- (void) applyInsets:(UIEdgeInsets)insets toView:(UIView *)view;
- (void) applyInsets:(UIEdgeInsets)insets toScrollView:(UIScrollView *)scrollView;
@end
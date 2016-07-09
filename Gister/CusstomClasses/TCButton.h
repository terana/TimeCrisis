//
// Created by Anastasia on 6/22/16.
//

#import <UIKit/UIKit.h>

@interface TCButton : UIView
@property (nonatomic, readonly) UILabel *label;
- (void) setTarget:(id)object withAction:(SEL)action;
@end
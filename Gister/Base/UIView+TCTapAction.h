//
// Created by Anastasia on 6/22/16.
//

#import <UIKit/UIKit.h>

typedef void(^TCTapActionBlock)();

@interface UIView (TCTapAction)
@property (nonatomic, strong) TCTapActionBlock tc_tapAction;
- (void) setTarget:(id)object withAction:(SEL)action;
@end
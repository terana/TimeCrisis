//
// Created by Anastasia on 6/22/16.
//

#import <UIKit/UIKit.h>
typedef void(^TCTapActionBlock)(__kindof UIView *sender);

@interface UIView (TCTapAction)
@property (nonatomic, strong) TCTapActionBlock tc_tapAction;
@end
//
// Created by Anastasia on 7/25/16.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowError)
-(void)showMessageWithError:(NSError *) error callback:(void (^)())callback;
@end
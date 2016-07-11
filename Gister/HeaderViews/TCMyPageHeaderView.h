//
// Created by Anastasia on 7/10/16.
//

#import <UIKit/UIKit.h>

@protocol TCHeaderViewSelected;

@interface TCMyPageHeaderView : UIView
@property (weak, nonatomic, nullable) id <TCHeaderViewSelected> delegate;
@end
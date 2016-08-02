//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>

@interface TCTextViewContainer : UIView <UITextViewDelegate>
{
@protected
	UITextView *_textView;
}
@property (nonatomic, readonly) UITextView *textView;
@end
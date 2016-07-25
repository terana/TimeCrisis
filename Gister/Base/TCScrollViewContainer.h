//
// Created by Anastasia on 7/24/16.
//

#import <UIKit/UIKit.h>

@interface TCScrollViewContainer : UIView <UIScrollViewDelegate>
{
@protected
	UIScrollView *_scrollView;
	UIView       *_contentView;
}

@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, readonly) UIView       *contentView;
@end
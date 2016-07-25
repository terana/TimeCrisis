//
// Created by Anastasia on 7/22/16.
//

#import <UIKit/UIKit.h>
#import "TCUserFileContentViewDelegate.h"
#import "TCScrollViewContainer.h"

@interface TCUserFileContentView : UIView
@property (strong, nonatomic) NSString *fileContent;
@property (weak, nonatomic) id <TCUserFileContentViewDelegate> delegate;
@property (strong, readonly) UITextView *contentView;
@end
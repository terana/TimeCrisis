//
// Created by Anastasia on 8/2/16.
//

#import <UIKit/UIKit.h>

@protocol TCMainUserFileContentViewDelegate <NSObject>
- (void) deleteFile;
- (void) renameFile;
@end

@interface TCMainUserFileContentView : UIView
@property (strong, nonatomic) NSString                             *fileContent;
@property (weak, nonatomic) id <TCMainUserFileContentViewDelegate> delegate;
@property (strong, nonatomic, readonly) UITextView *textView;
@end
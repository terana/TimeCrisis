//
// Created by Anastasia on 7/2/16.
//

#import <UIKit/UIKit.h>
#import "TCFile.h"
#import "TCViewController.h"
#import "TCUserFileContentViewDelegate.h"

@interface TCUserFileContentViewController : TCViewController <TCUserFileContentViewDelegate>
@property (strong, nonatomic) TCFile *file;
@end
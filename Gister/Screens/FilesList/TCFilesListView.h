//
// Created by Anastasia on 6/29/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"
#import "TCFileSelected.h"

@interface TCFilesListView : UIView
@property (strong, nonatomic) TCGist                      *gist;
@property (weak, nonatomic, nullable) id <TCFileSelected> delegate;
@end
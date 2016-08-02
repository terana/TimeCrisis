//
// Created by Anastasia on 6/29/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"
#import "TCTableViewContainer.h"

@class TCFile;

@protocol TCFilesListViewDelegate <NSObject>
- (void) fileIsSelected:(TCFile *)file;
@end

@interface TCFilesListView : TCTableViewContainer
@property (strong, nonatomic) NSArray                    *files;
@property (weak, nonatomic) id <TCFilesListViewDelegate> delegate;
@end
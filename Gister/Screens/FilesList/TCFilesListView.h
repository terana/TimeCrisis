//
// Created by Anastasia on 6/29/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"
#import "TCFilesListViewDelegate.h"
#import "TCTableViewContainer.h"

@interface TCFilesListView : TCTableViewContainer
@property (strong, nonatomic) TCGist                               *gist;
@property (weak, nonatomic, nullable) id <TCFilesListViewDelegate> delegate;
@end